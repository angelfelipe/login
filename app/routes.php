<?php

     Route::get('/', array('before' => 'auth', function(){  
          return View::make('inicio');
     }));

     Route::get('login', array('before' => 'validar', function(){
          return View::make('login');
     }));

     Route::post('check', 'LoginController@check');

     Route::get('logout', function(){
          Auth::logout();
          return Redirect::to('/login');
     });

     Route::get('uno', array('before' => 'auth', function(){  
          return View::make('primero');
     }));

        
?>