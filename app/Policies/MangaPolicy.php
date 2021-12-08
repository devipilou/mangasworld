<?php

namespace App\Policies;

use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Models\Manga;

class MangaPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }
    // seul le contributeur qui a créé le manga peut le modifier
    public function modifier(User $user, Manga $manga){
        $autorized = ($user->role == 'contrib' && $user->id == $manga->id_lecteur);
        return $autorized;
    }
    // seul le contributeur qui a créé le manga peut le supprimer
        public function supprimer (User $user, Manga $manga){
        $autorized = ($user->role == 'contrib' && $user->id == $manga->id_lecteur);
        return $autorized;
    }
}   
