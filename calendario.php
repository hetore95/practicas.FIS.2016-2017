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
    $sql = "SELECT DATE_FORMAT(fecha,GET_FORMAT(DATE,'EUR')),DATE_FORMAT(fecha,GET_FORMAT(TIME,'EUR')), id_personal, id_paciente FROM cita WHERE id_especialidad = '" . $row[0] . "' AND fecha >= DATE_SUB(CURDATE(), INTERVAL 1 WEEK) ORDER BY fecha ";
    $result = mysql_query($sql, $link);

    if (mysql_num_rows($result) > 0) {
        //Sacar citas y buscar el resto de datos
		$i = 0;
		$citas = array();
        while($row = mysql_fetch_row($result)){
			
            //Buscar médico
            $sql = "SELECT id_usuario FROM PERSONAL WHERE id = ".$row[2];
            $id = mysql_fetch_assoc(mysql_query($sql, $link))['id_usuario'];
            $sql = "SELECT nombre, apellidos FROM USUARIO WHERE id = ".$id;
            $row_2 = mysql_fetch_assoc(mysql_query($sql, $link));
            $medico = $row_2['nombre'].' '.$row_2['apellidos'];
            
            //Buscar paciente
            $sql = "SELECT id_usuario FROM PACIENTE WHERE id = ".$row[3];
            $id = mysql_fetch_assoc(mysql_query($sql, $link))['id_usuario'];
            $sql = "SELECT nombre, apellidos FROM USUARIO WHERE id = ".$id;
            $row_2 = mysql_fetch_assoc(mysql_query($sql, $link));
            $paciente = $row_2['nombre'].' '.$row_2['apellidos'];

            $citas[$i] = array('fecha' => $row[0],
				'hora' => $row[1],
                'medico' => $medico,
                'paciente' => $paciente);
				
            $i++;     
        }
		$respuesta['citas'] = $citas;
		$respuesta['error']=false;
                
    } else {
		$respuesta['error'] = true;
		$respuesta['descripcion'] = "No hay citas";
    }
} else {
		$respuesta['error'] = true;
		$respuesta['descripcion'] = "No existe especialidad";
}


//RESPUESTA
echo json_encode($respuesta);      
?>