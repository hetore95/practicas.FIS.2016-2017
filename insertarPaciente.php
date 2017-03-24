<?php

	require './assets/php/BBDD.php';

	//var_dump($_POST);

	$obj = json_decode($_POST['json'], true);

	//var_dump($obj);

	$error = "";
	$response = array();
	$id_registro = 0;

	// VALIDACIÓN DEL FORMULARIO

		//comprobamos que el formulario está completo(campo por campo)
		if ($obj['nombre']=="") {
			$error = "Campo nombre no definido";
		}
		elseif ($obj['apellido']=="") {
			$error = "Campo apellidos no definido";
		}
		elseif ($obj['companyia']=="") {
			$error = "Campo compañía no definido";
		}
		elseif ($obj['dni']=="") {
			$error = "Campo DNI no definido";
		}
		elseif (strlen($obj['dni'])!=9) {
			$error = "Formato DNI incorrecto";
		}
		elseif ($obj['contrasenya']=="") {
			$error = "Campo contraseña no definido";
		}

		// si hay errores, no se sigue y se informa
		if( $error != "" ) {

			$response['error'] = true;
			$response['descripcion'] = $error;

		} else {

			// CONEXIÓN A LA BBDD
			$link = conectar();

			$sql = "SELECT DNI FROM usuario WHERE DNI = " . $obj['dni'];
			$result = mysql_query($sql, $link);

			if( mysql_num_rows($result) == 0 ) {

				//Ingresar la informacion a la tabla de datos
				$sql = "INSERT INTO usuario VALUES ('','" . $obj['nombre'] . "','" . $obj['apellido'] . "','" . $obj['dni'] . "','" . $obj['contrasenya'] . "','paciente')";
				$result = mysql_query($sql, $link);

				$id_registro = mysql_insert_id();

				// Si se ha insertado correctamente en USUARIO
				if( $result ) {

					$sql = "INSERT INTO paciente VALUES ('','" . $id_registro . "','" . $obj['companyia'] . "')";
					$result = mysql_query($sql, $link);

					if( $result ) {

						$response['error'] = false;
						$response['descripcion'] = "Registro completado.";
					} else {

						// Deshacer INSERT de USUARIO
						$sql = "DELETE FROM usuario WHERE ID_USUARIO = " . $id_registro;
						$result = mysql_query($sql, $link);


						$response['error'] = true;
						$response['descripcion'] = "No se ha podido insertar en la tabla de Paciente.";
					}

				} else {

					$response['error'] = true;
					$response['descripcion'] = "No se ha podido insertar en la tabla de Usuario.";
				}

			} else {

				$response['error'] = true;
				$response['descripcion'] = "El usuario ya está registrado, introduzca un nuevo usuario.";
			}
		}

	echo json_encode($response);
?>