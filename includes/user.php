<?php
    class User extends DB{
        private $username;
        private $password;

        public function userExits($user){
            $query = $this->connect()->prepare('SELECT *FROM usuarios WHERE username= :username');
            $query->execute(['usu_name'=> $username, 'usu_password'=>$password])
        }


    }
    

?>