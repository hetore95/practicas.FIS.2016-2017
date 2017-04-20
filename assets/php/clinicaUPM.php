<?php

	// FLUJO

	$peticion = json_decode($_POST['json'], true);

	if( isset( $peticion['accion'] ) && isset( $peticion['opcion'] ) ){

		if( $peticion['opcion'] == 'sesion' ){

			session_start();

			if( $peticion['accion'] == 'consultar' ){ echo json_encode($_SESSION); }

			elseif( $peticion['accion'] == 'cerrar' ){ session_destroy(); }
		}
	}

	// FIN FLUJO



	// Inicia una sesión PHP y se queda con el usuario que accede al sistema
	function iniciarSesion( $usuario, $perfil ){

		session_start();

		$_SESSION['usuario'] = $usuario;
		$_SESSION['perfil'] = $perfil;
	}
?>