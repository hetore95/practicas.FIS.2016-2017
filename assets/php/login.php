<?php

	require 'BBDD.php';
	require 'clinicaUPM.php';

	$link = conectar();

	$arr_login = json_decode($_POST['json'], true);

	// ver estructura de ese array ($arr_login) por consola

	$query = "SELECT * FROM usuario WHERE DNI = '" . $arr_login['usr'] . "' AND PASSWORD = '" . $arr_login['passwd'] . "'";

	$result = mysql_query($query, $link);
	$row = mysql_fetch_assoc($result);

	if ( mysql_num_rows($result) == 1 ) {

		if( $row['TIPO_USUARIO'] != "PACIENTE" ){

			if( $row['NOMBRE'] == "ROOT" ){

				$response['tipo_usuario'] = "ADMINISTRADOR";
			} else {

				$response['tipo_usuario'] = $row['TIPO_USUARIO'];
			}

			// Creamos sesión para entrar en la aplicación
			iniciarSesion( $row['NOMBRE'], $response['tipo_usuario'] );

			$response['usuario_registrado'] = true;
		} else {

			$response['usuario_registrado'] = false;
			$response['mensaje'] = "No pueden entrar a la aplicación los pacientes. Ingrese un usuario válido.";
		}

	} else {

	    $response['usuario_registrado'] = false;
	    $response['mensaje'] = "Usuario no registrado.";
	}

	echo("Hola");
	// Libero la conexión actual a la bbdd
	mysql_close($link);

	echo json_encode($response);
?>