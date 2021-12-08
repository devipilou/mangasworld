<?php

namespace App\Http\Controllers;

use Request;
use Exception;
use Session;
use Validator;
use App\User;
use App\Models\Lecteur;
use Illuminate\Support\Facades\Auth;

class ProfilController extends Controller
{
    public function getProfil(){
        $erreur = "";
        $user = Auth::user();
        $id_lecteur = $user->id;
        $lecteur = Lecteur::find($id_lecteur);
        return view('formProfil', compact('lecteur', 'user', 'erreur'));
    }
    
    public function setProfil(){
        $messages = array(
            'nom.required' => 'Il faut saisir un nom (bril).',
            'prenom.required' => 'Il faut saisir un prénom (bril aussi).',
            'cp.required' => 'Il faut saisir un Code Postal (eyrrand).',
            'cp.numeric' => 'Le Code Postal doit etre une valeur numéric (et ramzy).'
        );
        
        $regles = array(
            'nom' => 'required',
            'prenom' => 'required',
            'cp' => 'required | numeric'
        );
        $validator = Validator::make(Request::all(), $regles, $messages);
        if ($validator->fails()){
            return redirect('formProfil')
                ->withErrors($validator)
                ->withInput();
        }
        
       $user = Auth::user();
       $id_lecteur = $user->id;
       $lecteur = Lecteur::find($id_lecteur);
       $lecteur->nom = Request::input('nom');
       $lecteur->prenom = Request::input('prenom');
       $lecteur->rue = Request::input('rue');
       $lecteur->cp = Request::input('cp');
       $lecteur->ville = Request::input('ville');
       $lecteur->save();
       return redirect('home');
    }
}
