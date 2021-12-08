<?php

namespace App\Http\Controllers;

use Request;
use App\Models\Manga;
use App\Models\Dessinateur;
use App\Models\Genre;
use App\Models\Scenariste;
use Exception;
use Session;
use Validator;
use Illuminate\Support\Facades\Auth;

class MangaController extends Controller
{
    /**
     * Affiche la liste de tous les mangas
     * @return Vue listesMangas
     */
    public function getMangas()
    {
        $erreur = Session::get('erreur');
        Session::forget('erreur');
        $mangas = Manga::all();
        $user = Auth::user();
        return view('listeMangas', compact('mangas', 'erreur', 'user'));
    }
    
    /**
     * Affiche tous les Mangas d'un genre
     * @param int $idGenre
     * @return Vue listerMangas
     */
    public function getMangasGenre()
    {
        $erreur = "";
        $id_genre = Request::input('cbGenre');
        $user = Auth::user();
        if($id_genre){
            $mangas = Manga::where('id_genre', $id_genre)->get();
            return view('listeMangas', compact('mangas', 'erreur', 'user'));
        }else{
            $erreur = "Il faut sélectionner un genre !";
            Session::put('erreur', $erreur);
            return redirect('listerGenres/'.$erreur);
        }
    }
    
    public function updateManga($id)
    {
        $erreur = Session::get('erreur');
        Session::forget('erreur');
        $readonly = null;
        $manga = Manga::find($id);
        $genres = Genre::all();
        $dessinateurs = Dessinateur::all();
        $scenaristes = Scenariste::all();
        $titreVue = "Modification d'un Manga";
        $user = Auth::user();
        if (!$user->can('modifier', $manga)){
            $erreur = "Vous ne pouvez modifier que les mangas que vous avez créés !";
            $readonly = 'readonly';
        }
        return view('formManga', compact('manga', 'genres', 'dessinateurs', 'scenaristes', 'titreVue', 'erreur', 'user', 'readonly'));
    }
    
    public function validateManga()
    {
        $id_manga = Request::input('id_manga');
        $user = Auth::user();
        
        $regles = array(
            'titre'=>'required',
            'prix'=>'required | numeric',
            'cbScenariste'=>'required',
            'cbGenre'=>'required',
            'cbDessinateur'=>'required'
        );
        $messages = array(
            'titre.required' => 'Il faut saisir un titre',
            'cbGenre.required' => 'Il faut selectionner un genre',
            'cbScenariste.required' => 'Il faut selectionner un scénariste',
            'cbDessinateur.required' => 'Il faut selectionner un dessinateur',
            'prix.required' => 'Il faut saisir un prix',
            'prix.numeric' => 'Le prix doit etre une valeur numérique'
        );
        $validator = Validator::make(Request::all(),$regles, $messages);
        if($validator->fails()){
            if($id_manga>0){
                return redirect ('modifierManga/' .$id_manga)
                        ->withErrors($validator)
                        ->withInput();
            }else{
                return redirect ('ajouterManga/')
                        ->withErrors($validator)
                        ->withInput();
            }
        }
                
        $id_dessinateur = Request::input('cbDessinateur');
        $prix = Request::input('prix');
        $id_scenariste = Request::input('cbScenariste');
        $titre = Request::input('titre');
        $id_genre = Request::input('cbGenre');
        
        if (Request::hasFile('couverture')){
            $image = Request::file('couverture');
            $couverture = $image->getClientOriginalName();
            Request::file('couverture')->move(base_path() . '/public/images/', $couverture);
        }else{
            $couverture = Request::input('couvertureHidden');
        }
        if ($id_manga > 0){
            $manga = Manga::find($id_manga);
        }else{
            $manga = new Manga();
        }
        $manga->titre = $titre;
        $manga->couverture = $couverture;
        $manga->prix = $prix;
        $manga->id_dessinateur = $id_dessinateur;
        $manga->id_scenariste = $id_scenariste;
        $manga->id_genre = $id_genre;
        $manga->id_lecteur = $user->id;
        
        $erreur = "";
        try{
            $manga->save();
        } catch (Exception $ex) {
            $erreur = $ex->getMessage();
            Session::put('erreur', $erreur);
            if ($id_manga > 0){
                return redirect('/modifierManga/' .$id_manga);
            }else{
                return redirect('/ajouterManga/');
            }
        }
        
        return redirect('/listerMangas');
    }
    
    public function addManga()
    {
        $erreur = Session::get('erreur');
        Session::forget('erreur');
        $user = Auth::user();
        $readonly = null;
        
        $manga = new Manga();
        $genres = Genre::all();
        $dessinateurs = Dessinateur::All();
        $scenaristes = Scenariste::all();
        $titreVue = "Ajout d'un Manga";
        return view('formManga', compact('manga', 'genres', 'dessinateurs', 'scenaristes', 'titreVue', 'erreur', 'user', 'readonly'));
    }
    
    public function deleteManga($id)
    {
        $erreur = "";
        try{
            $user = Auth::user();
            $manga = Manga::find($id);
            if (!$user->can('supprimer', $manga)){
                $erreur = 'Vous ne disposez pas des droits pour supprimer ce manga !';
                Session::put('erreur', $erreur);
                return $this->getMangas();
            }
            $manga->delete();
            return redirect('/listerMangas');
        } catch (Exception $ex) {
            $erreur = $ex->getMessage();
            Session::put('erreur', $ex->getMessage());
            return redirect('/listerMangas');
        }       
    }
    
    public function showManga($id){
        $erreur = Session::get('erreur');
        Session::forget('erreur');
        $readonly = 'readonly';
        $manga = Manga::find($id);
        $genres = Genre::all();
        $dessinateurs = Dessinateur::all();
        $scenaristes = Scenariste::all();
        $titreVue = "Consultation d'un Manga";
        return view ('formManga', compact('manga', 'genres', 'dessinateurs', 'scenaristes', 'titreVue', 'readonly', 'erreur'));
    }
}
