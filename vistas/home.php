<?php 
    include('../includes/db.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body>
    <h2>Bienvenido <?php //echo $user->getNombre(); ?> </h2>
    <a href="index.php">Cerrar sesión</a>
    <br><br>
    <form method="post">
        <select id="cmb_tablas" name="cmb_tablas" >
            <option value="seleccione">-- Seleccione --</option>
            <option value="campus">Campus</option>
            <option value="bar">Bares</option>
            <option value="menu">Menús</option>
            <option value="snack"> Snacks </option>
            <option value="buzon"> Buzones </option>
            <option value="preferencia"> Preferencias </option>
        </select>
        <input type="submit" name="btnBuscar"
                class="button" value="Buscar" />
    </form>

    <?php  

        if(array_key_exists('btnBuscar', $_POST)) {
            $value = $_POST['cmb_tablas'];
            changeValue($value);
        }

        //Cambia el valor
        function changeValue($value){
            $DB = new DB(); 
            $conn = $DB->connect();
          //  echo '<h3>'.$value.'</h3>';
 
            if($value == 'campus'){
                echo  "<table> <tr> 
                    <th>Id.</th> 
                    <th>Nombre</th>
                    <th>Dirección</th>
                    </tr>";
                $res = $conn->query('SELECT * FROM campus');
                if ($res == true) {
                    foreach( $res as $fila){
                        echo '<tr>
                            <td>'.$fila['cam_id'].'</td>
                            <td>'.$fila['cam_nombre'].'</td>
                            <td>'.$fila['cam_direccion'].'</td>
                        </tr>';
                        //echo '<h4>Resultado: '.$fila['cam_nombre'].'</h4> ';   
                    }
                }else {
                    //false
                    echo '<p>No hay datos registrados</p>';
                }
            } 
            if($value == 'bar'){
                echo  "<table> <tr> 
                    <th>Id.</th> 
                    <th>Campus</th> 
                    <th>Nombre</th>
                    <th>Disponibilidad</th>
                    </tr>";
                $res = $conn->query('SELECT * FROM bar');
                if ($res == true) {
                    foreach( $res as $fila){
                        echo '<tr>
                            <td>'.$fila['bar_id'].'</td>
                            <td>'.$fila['cam_id'].'</td>
                            <td>'.$fila['bar_nombre'].'</td>
                            <td>'.$fila['bar_abierto'].'</td>
                        </tr>';  
                    }
                }else {
                    //false
                    echo '<p>No hay datos registrados</p>';
                }
            } 
            if($value == 'menu'){
                echo  "<table> <tr> 
                    <th>Id.</th> 
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Descripción</th>
                    </tr>";
                $res = $conn->query('SELECT * FROM menu');
                if ($res == true) {
                    foreach( $res as $fila){
                        echo '<tr>
                            <td>'.$fila['men_id'].'</td>
                            <td>'.$fila['men_nombre'].'</td>
                            <td>'.$fila['men_precio'].'</td>
                            <td>'.$fila['men_descripcion'].'</td>
                        </tr>';    
                    }
                }else {
                    //false
                    echo '<p>No hay datos registrados</p>';
                }
            } 
            if($value == 'snack'){
                echo  "<table> <tr> 
                    <th>Id.</th> 
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Disponibilidad</th>
                    </tr>";
                $res = $conn->query('SELECT * FROM snack');
                if ($res == true) {
                    foreach( $res as $fila){
                        echo '<tr>
                            <td>'.$fila['sna_id'].'</td>
                            <td>'.$fila['sna_nombre'].'</td>
                            <td>'.$fila['sna_precio'].'</td>
                            <td>'.$fila['sna_disponible'].'</td>
                        </tr>';  
                    }
                }else {
                    //false
                    echo '<p>No hay datos registrados</p>';
                }
            } 
            if($value == 'buzon'){
                echo  "<table> <tr> 
                    <th>Id.</th> 
                    <th>Bar</th>
                    <th>Fecha</th>
                    <th>Descripción</th>
                    </tr>";
                $res = $conn->query('SELECT * FROM buzon');
                if ($res == true) {
                    foreach( $res as $fila){
                        echo '<tr>
                            <td>'.$fila['buz_id'].'</td>
                            <td>'.$fila['bar_id'].'</td>
                            <td>'.$fila['buz_fecha'].'</td>
                            <td>'.$fila['buz_descripcion'].'</td>
                        </tr>';   
                    }
                }else {
                    //false
                    echo '<p>No hay datos registrados</p>';
                }
            }
            if($value == 'preferencia'){
                echo  "<table> <tr> 
                    <th>Id.</th> 
                    <th>Menu</th> 
                    <th>Fecha</th>
                    <th>Observación</th>
                    </tr>";
                $res = $conn->query('SELECT * FROM preferencias');
                if ($res == true) {
                    foreach( $res as $fila){
                        echo '<tr>
                            <td>'.$fila['pre_id'].'</td>
                            <td>'.$fila['men_id'].'</td>
                            <td>'.$fila['pre_fecha'].'</td>
                            <td>'.$fila['pre_observacion'].'</td>
                        </tr>';    
                    }
                }else {
                    //false
                    echo '<p>No hay datos registrados</p>';
                }
            }   
        }    
    ?>
</body>
</html>