<?php

    require 'BBDD.php';

    //var_dump($_POST);

    $obj = json_decode($_POST['json'], true);
   
    $response = array();
    $link = conectar();
    $error = "";


    if ($obj['comentario']=="") {
			$error = "Comentario no definido";
		}

	else

	$sql = "INSERT INTO historial VALUES ('','" . $obj['id_paciente'] . "','" . $obj['id_medico'] . "','','','" . $obj['comentario'] . "')";
		
		$result = mysql_query($sql, $link);

			if( $result ) {      	
				$response['error'] = false;
				$response['descripcion'] = "Comentario Insertado";
			} 
			else {
				$response['error'] = true;
				$response['descripcion'] = "No se ha podido insertar el comentario";
				}   


	echo json_encode($response);

?>