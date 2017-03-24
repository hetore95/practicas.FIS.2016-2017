<?php

	require './assets/php/BBDD.php';

	$link = conectar();

	$arr_login = json_decode($_POST['json'], true);

	// ver estructura de ese array ($arr_login) por consola

	$query = "SELECT * FROM usuario WHERE DNI = '" . $arr_login['usr'] . "' AND PASSWORD = '" . $arr_login['passwd'] . "'";

	$result = mysql_query($query, $link);
	$row = mysql_fetch_assoc($result);

	if ( mysql_num_rows($result) == 1 ) {

		if( $row['NOMBRE'] == "ROOT" ){

			$response['tipo_usuario'] = "ROOT";
		} else{

			$response['tipo_usuario'] = $row['TIPO_USUARIO'];
		}

		$response['usuario_registrado'] = true;

	} else {

	    $response['usuario_registrado'] = false;

	    // Libero la conexión actual a la bbdd
	    mysql_close($link);
	}


	echo json_encode($response);
?>
