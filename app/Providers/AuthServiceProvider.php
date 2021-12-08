<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facade\Auth;
use App\Models\Manga;
use App\Policies\MangaPolicy;
use App\Models\Commentaire;
use App\Policies\CommentairePolicy;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
        Manga::class => MangaPolicy::class,
        Commentaire::class => CommentairePolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();
        Gate::define('contrib', function($user){
            return $user->role == 'contrib';
        });
        Gate::define('comment', function($user){
            return $user->role == 'comment';
        });

        //
    }
}
