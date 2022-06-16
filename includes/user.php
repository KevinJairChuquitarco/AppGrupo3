<?php
    include_once 'db.php';
    class User extends DB{
        private $username;
        private $password;

        public function userExists($user, $pass){
            $usuario = $user;
            $password = $pass; 
            $conn = $this->connect();
            $res = $conn->query("SELECT *FROM usuarios WHERE usu_name= '$usuario' and usu_password= '$password'");
            //$query = $this->connect()->prepare('SELECT *FROM usuarios WHERE usu_name= :user and usu_password= :pass');
            //$query->execute(['user'=> $user, 'pass'=>$pass]);
            if ($res) {
                return true;
            }else {
                return false;
            }
        }

        public function setUser($user){
            $usuario = $user; 
            $conn = $this->connect();
            $res = $conn->query("SELECT *FROM usuarios WHERE usu_name='$usuario'");
            //$query = $this->connect()->prepare('SELECT *FROM usuarios WHERE usu_name= :user');
            //$query->execute(['user'=> $user]);
            foreach ($res as $currentUser) {
                $this->username = $currentUser['usu_name'];
                $this->password = $currentUser['usu_password'];
            }
        }

        public function getNombre(){
            return $this->username;
        }

    }
    

?>
