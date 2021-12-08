<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

//routes publiques
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/', 'HomeController@index');
//afficher la liste de tous les mangas
Route::get('/listerMangas', 'MangaController@getMangas');
//lister tous les mangas d'un genre selectionné
Route::post('/listerMangasGenre', 'MangaController@getMangasGenre');
//afficher la liste déroulante des genre
Route::get('/listerGenres/{erreur?}', 'GenreController@getGenres');
//afficher la liste des commentaires d'un manga
Route::get('/listerCommentaires/{id}', 'CommentController@getCommentManga');
//demande de consultation d'un manga
Route ::get('/consulterManga/{id}', 'MangaController@showManga');
//demande de consultation d'un commentaire
Route ::get('/consulterCommentaire/{id}', 'CommentController@showComment');

//route protegées
Route::group(['middleware' => ['auth']], function(){
    //afficher le profil
    Route::get('/profil', 'ProfilController@getProfil');
    //enregistrer la MAJ du profil
    Route::post('/profil', 'ProfilController@setProfil');
    //demande d'ajout d'un manga
    Route::get('/ajouterManga/', 'MangaController@addManga')->middleware('can:contrib');

    //demande de modification d'un manga
    Route::get('/modifierManga/{id}', 'MangaController@updateManga')->middleware('can:contrib');
    //enregistrer la MAJ d'un manga
    Route::post('/validerManga', 'MangaController@validateManga');
    //supprimer un manga
    Route::get('/supprimerManga/{id}', 'MangaController@deleteManga');

    //demande d'ajout d'un commentaire
    Route::get('/ajouterCommentaire/{id}', 'CommentController@addComment')->middleware('can:comment');
    //enregistrer un commentaire
    Route::post('/validerCommentaire', 'CommentController@validateComment');
    //demande de modification d'un commentaire
    Route::get('/modifierCommentaire/{id}', 'CommentController@updateComment')->middleware('can:comment');
    //supprimer un commentaire
    Route::get('/supprimerCommentaire/{id}', 'CommentController@deleteComment');
    
    
});