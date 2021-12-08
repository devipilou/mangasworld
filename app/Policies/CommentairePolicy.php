<?php

namespace App\Policies;

use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Models\Commentaire;

class CommentairePolicy
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
    // seul le commentateur qui a créé le commentaire peut le modifier
    public function modifierCom(User $user, Commentaire $commentaire){
        $autorized = ($user->role == 'comment' && $user->id == $commentaire->id_lecteur);
        return $autorized;
    }
    // seul le commentateur qui a créé le commentaire peut le supprimer
        public function supprimerCom (User $user,Commentaire $commentaire){
        $autorized = ($user->role == 'comment' && $user->id == $commentaire->id_lecteur);
        return $autorized;
    }
}
