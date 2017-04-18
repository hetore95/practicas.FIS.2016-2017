<?php

require '../php/BBDD.php';

$obj = json_decode($_POST['json'], true);
$error = "";
$response = array();
$id_registro = 0;

// VALIDACIÓN
//CONEXIÓN A LA BBDD
$link = conectar();

//Buscar especialidad
$sql = "SELECT id FROM especialidad WHERE nombre = '" . $obj['nombre'] . "'";
$result = mysql_query($sql, $link);

if (mysql_num_rows($result) > 0) {
    //Buscar citas
    //¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡TODO: Problema con las especialidades con acentos
    
    $row = mysql_fetch_row($result);
    $sql = "SELECT fecha, id_personal, id_paciente FROM cita WHERE id_especialidad = '" . $row[0] . "' AND fecha >= CURDATE()";
    $result = mysql_query($sql, $link);

    if (mysql_num_rows($result) > 0) {
        //Sacar citas y buscar el resto de datos
        while($row = mysql_fetch_assoc($result)){
            
            //Buscar médico
            $sql = "SELECT id_usuario FROM PERSONAL WHERE id = ".$row['id_personal'];
            $id = mysql_fetch_assoc(mysql_query($sql, $link))['id_usuario'];
            $sql = "SELECT nombre, apellidos FROM USUARIO WHERE id = ".$id;
            $row_2 = mysql_fetch_assoc(mysql_query($sql, $link));
            $medico = $row_2['nombre'].' '.$row_2['apellidos'];
            
            //Buscar paciente
            $sql = "SELECT id_usuario FROM PACIENTE WHERE id = ".$row['id_paciente'];
            $id = mysql_fetch_assoc(mysql_query($sql, $link))['id_usuario'];
            $sql = "SELECT nombre, apellidos FROM USUARIO WHERE id = ".$id;
            $row_2 = mysql_fetch_assoc(mysql_query($sql, $link));
            $paciente = $row_2['nombre'].' '.$row_2['apellidos'];

            $respuesta = array('fecha' => $row['fecha'],
                'medico' => $medico,
                'paciente' => $paciente);
            
            echo json_encode($respuesta);            
        }
                
    } else {
        echo "NO HAY CITAS";
    }
} else {
    echo "NO EXISTE ESPECIALIDAD";
}


//RESPUESTA
?>