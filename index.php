<?php

    include_once 'includes/user.php';
    include_once 'includes/user_session.php';
    $userSession = new UserSession();
    $user = new User();
    if(isset($_POST['username']) && isset($_POST['password'])){

        if($user->userExists($_POST['username'],  $_POST['password'])){ //UsuarioValidado
            $userSession->setCurrentUser($_POST['username']);
            $user->setUser($_POST['username']);
            include_once 'vistas/home.php';

        }else{ //Error Login
            $errorLogin = "Nombre de usuario y/o password es incorrecto";
            include_once 'vistas/login.php';
        }

    }else{
        include_once 'vistas/login.php';
    }
?>