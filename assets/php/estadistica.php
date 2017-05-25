<?php

    require 'BBDD.php';

    //var_dump($_POST);

    $obj = json_decode($_POST['json'], true);
    $fila = array();
    $response = array();
    $link = conectar();
    $sql = "SELECT u.dni, u.nombre, u.apellidos, count(c.id_personal) as NumCitas from usuario u, personal p, cita c where u.id=p.id_usuario and p.id=c.id_personal group by (c.id_personal) order by NumCitas DESC";
    $result = mysql_query($sql, $link);
    $i=0;
    while( $fila = mysql_fetch_assoc($result) ) {
//var_dump($fila);die(1);
        $response[$i]['dni'] = $fila['dni'];
        $response[$i]['name'] = $fila['nombre'];
        $response[$i]['surname'] = $fila['apellidos'];
        $response[$i]['n_citas'] = $fila['NumCitas'];
        $i++;
    }


    echo json_encode($response);

    ?>