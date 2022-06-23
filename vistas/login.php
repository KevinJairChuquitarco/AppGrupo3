<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Login</title>
</head>
<body>
    <div class="fondo">
        <section class="login">
            <div class="loginContainer">
                <form action="" method = "POST">
                    <?php
                        if(isset($errorLogin)){
                            echo $errorLogin;
                        }

                    ?>
                    <h2 class="titulo">Inicio de Sesión</h2>
                    <p>Usuario: <br>
                        <input type="text" name= "username">
                    </p>
                    <p>Contraseña: <br>
                        <input type="password" name= "password">
                    </p>
                    <input class="btnContainer"type="submit" value ="Iniciar Sesión">
                </form>
            </div>
        </section>
    </div>
    
    
</body>
</html>