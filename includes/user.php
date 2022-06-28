<?php
    include_once 'db.php';
    class User extends DB{
        private $username;
        private $password;

        public function userExists($user, $pass){
            $query = $this->connect()->prepare('SELECT *FROM usuarios WHERE usu_name= :user and usu_password= :pass');
            $query->execute(['user'=> $user, 'pass'=> md5($pass)]);
            if ($query->rowCount()) {
                return true;
            }else {
                return false;
            }
        }

        public function setUser($user){
            $query = $this->connect()->prepare('SELECT *FROM usuarios WHERE usu_name= :user');
            $query->execute(['user'=> $user]);
            foreach ($query as $currentUser) {
                $this->username = $currentUser['usu_name'];
                $this->password = $currentUser['usu_password'];
            }
        }

        public function getNombre(){
            return $this->username;
        }

    }
    

?>
