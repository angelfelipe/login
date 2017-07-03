<?php
 
class LoginController extends BaseController {
 
    public function check() {
        
        $userdata = array(
            'email' => Input::get('email').'@misena.edu.co',
            'password' => Input::get('password')
        );
    
        if(Auth::attempt($userdata)){
            
            $id = Auth::user()->id;
    
            $sql2= DB::insert('insert into visitas(id_usuario)  
                    values(?)',
                    array(   
                        $id
                    )
                );

            return Redirect::to('/');
        }
        else{
            return Redirect::to('login')->with('login_errors', true);
        }
        
    }
}