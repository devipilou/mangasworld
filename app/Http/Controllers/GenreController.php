<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Genre;
use Session;
use Illuminate\Support\Facades\Auth;

class GenreController extends Controller
{
    /**
     * Affiche les genres dans une liste déroulante
     * @return Vue formGenre
     */
    public function getGenres($erreur = "")
    {
        $erreur = Session::get('erreur');
        Session::forget('erreur');
        $genres = Genre::all();
        $user = Auth::user();
        return view ('formGenre', compact('genres', 'erreur', 'user'));
    }
}
