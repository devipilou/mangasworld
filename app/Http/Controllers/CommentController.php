<?php

namespace App\Http\Controllers;

use Request;
use App\Models\Manga;
use App\Models\Commentaire;
use App\Models\Lecteur;
use Session;
use Illuminate\Support\Facades\Auth;
use Validator;
use Exception;

class CommentController extends Controller
{
    
    public function getCommentManga($id_manga){
        $erreur = Session::get('erreur');
        Session::forget('erreur');
        $manga = Manga::find($id_manga);
        $commentaires = Commentaire::where('id_manga', $id_manga)->get();
        $user = Auth::user();
        return view('listeCommentaires', compact('commentaires', 'erreur', 'user', 'manga'));
    }
    
    public function addComment($id_manga){
        $erreur = Session::get('erreur');
        Session::forget('erreur');
        $user = Auth::user();
        $readonly = null;
        $manga = Manga::find($id_manga);
        $comment = new Commentaire();
        $titreVue = "Ajout d'un Commentaire";
        return view('formCommentaire', compact('manga', 'comment', 'titreVue', 'erreur', 'user', 'readonly'));
    }
    
    public function validateComment(){
        
        $id_commentaire = Request::input('id_commentaire');
        $id_manga = Request::input('id_manga');
        $lib_commentaire = Request::input('lib_commentaire');
        $user = Auth::user();
        
        
        $regles = array(
            'lib_commentaire'=>'required',
        );
        $messages = array(
            'lib_commentaire.required' => 'Il faut saisir un commentaire',
        );
        $validator = Validator::make(Request::all(),$regles, $messages);
        if($validator->fails()){
            if($id_commentaire>0){
                return redirect ('modifierCommentaire/' .$id_commentaire)
                        ->withErrors($validator)
                        ->withInput();
            }else{
                return redirect ('ajouterCommentaire/' .$id_manga)
                        ->withErrors($validator)
                        ->withInput();
            }
        }
               

        if ($id_commentaire > 0){
            $commentaire = Commentaire::find($id_commentaire);
        }else{
            $commentaire = new Commentaire();
        }
        $commentaire->id_manga = $id_manga;
        $commentaire->id_lecteur = $user->id;
        $commentaire->lib_commentaire = $lib_commentaire;
        
        $erreur = "";
        try{
            $commentaire->save();
        } catch (Exception $ex) {
            $erreur = $ex->getMessage();
            Session::put('erreur', $erreur);
            if ($commentaire > 0){
                return redirect('modifierCommentaire/' .$id_commentaire);
            }else{
                return redirect('ajouterCommentaire/' .$id_manga);
            }
        }
        
        return redirect('listerCommentaires/' .$id_manga);
    
    }
    
    public function updateComment($id_commentaire){
        $erreur = Session::get('erreur');
        Session::forget('erreur');
        $readonly = null;
        $commentaire = Commentaire::find($id_commentaire);
        $manga = Manga::find($commentaire->id_manga);
        $titreVue = "Modification d'un Commentaire";
        $user = Auth::user();
        if($user != null){
            if (!$user->can('modifierCom', $commentaire)){
                $erreur = "Vous ne pouvez modifier que les commentaires que vous avez créés !";
                $readonly = 'readonly';
            }
        }else{
            $readonly = 'readonly';
        }
        return view('formCommentaire', compact('commentaire', 'manga', 'titreVue', 'erreur', 'user', 'readonly'));
    }
    
    public function deleteComment($id_commentaire){
        $erreur = "";
        try{
            $user = Auth::user();
            $commentaire = Commentaire::find($id_commentaire);
            
            if (!$user->can('supprimerCom', $commentaire)){
                $erreur = 'Vous ne disposez pas des droits pour supprimer ce commentaire !';
                Session::put('erreur', $erreur);
                return $this->getCommentManga($commentaire->id_manga);
            }
            $commentaire->delete();
            return redirect('listerCommentaires/' .$commentaire->id_manga);
        } catch (Exception $ex) {
            $erreur = $ex->getMessage();
            Session::put('erreur', $ex->getMessage());
            return redirect('listerCommentaires/' .$commentaire->id_manga);
        } 
    }
    
    public function showComment($id_commentaire){
        $erreur = Session::get('erreur');
        Session::forget('erreur');
        $commentaire = Commentaire::find($id_commentaire);
        $manga = Manga::find($commentaire->id_manga);
        $lecteur = Lecteur::find($commentaire->id_lecteur);
        $titreVue = "Commentaire par $lecteur->prenom $lecteur->nom";
        $user = Auth::user();
        $readonly = 'readonly';
        
        return view('formCommentaire', compact('commentaire', 'manga', 'titreVue', 'erreur', 'user', 'readonly'));
    }
}
