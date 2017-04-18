<?php

  require 'BBDD.php';

  //var_dump($_POST);

  $obj = json_decode($_POST['json'], true);
  $personal = ( isset( $obj['personal'] ) ) ? $obj['personal'] : false;
  $response = array();
  $i = 0;

  //var_dump($obj);

  if( $obj['accion'] == 'consultar' ) {

    if( $obj['opcion'] == 'especialidad' ) {

      $link = conectar();

      // Para que la respuesta pueda contener acentos
      mysql_set_charset("utf8", $link);

      $sql = "SELECT ID, NOMBRE FROM especialidad";
      $result = mysql_query($sql, $link);

      while( $fila = mysql_fetch_assoc($result) ) {

          $response[$i]['ID'] = $fila['ID'];
          $response[$i]['NOMBRE'] = $fila['NOMBRE'];

          $i++; 
      }
    }

  } 

  elseif( $obj['accion'] == 'insertar' && $obj['opcion'] == 'personal' ) {

    // Alta de Personal

    $error = "";
    $id_registro = 0;

    // VALIDACIÓN DEL FORMULARIO

    //comprobamos que el formulario está completo(campo por campo)
    if ($personal['nombre']=="") {
      $error = "Campo nombre no definido";
    }
    elseif ($personal['apellido']=="") {
      $error = "Campo apellidos no definido";
    }
    elseif ($personal['numColegiado']=="") {
      $error = "Campo número de colegiado no definido";
    }
    elseif ($personal['dni']=="") {
      $error = "Campo DNI no definido";
    }
    elseif (strlen($personal['dni'])!=9) {
      $error = "Formato DNI incorrecto";
    }
    elseif ($personal['contrasenya']=="") {
      $error = "Campo contraseña no definido";
    }
    elseif ($personal['tMinConsulta']=="") {
      $error = "Campo tiempo mínimo de consulta no definido";
    }
    elseif ($personal['diasConsulta']=="") {
      $error = "Campo días de consulta no definido";
    }
    elseif (count( $personal['especialidades'] ) <= 0 ) {
      $error = "Campo especialidad no definido";
    }

    // si hay errores, no se sigue y se informa
    if( $error != "" ) {

      $response['error'] = true;
      $response['descripcion'] = $error;

    } else {

      // CONEXIÓN A LA BBDD
      $link = conectar();

      $sql = "SELECT DNI FROM usuario WHERE DNI LIKE '" . $personal['dni'] . "'";
      $result = mysql_query($sql, $link);

      if( mysql_num_rows($result) == 0 ) {

        //Ingresar la informacion a la tabla de datos
        $sql = "INSERT INTO usuario VALUES ('','" . $personal['nombre'] . "','" . $personal['apellido'] . "','" . $personal['dni'] . "','" . $personal['contrasenya'] . "','PERSONAL')";
        $result = mysql_query($sql, $link);

        $id_registro = mysql_insert_id();

        // Si se ha insertado correctamente en USUARIO
        if( $result ) {

          $sql = "INSERT INTO personal VALUES ('','" . $id_registro . "','" . $personal['numColegiado'] . "', '" . $personal['diasConsulta'] . "', '" . $personal['tMinConsulta'] . "')";
          $result = mysql_query($sql, $link);

          if( $result ) {

            $id_registro = mysql_insert_id();

            for( $i=0; $i<count($personal['especialidades']); $i++ ) {

              $sql = "INSERT INTO rel_personal_especialidad VALUES ('','" . $id_registro . "','" . $personal['especialidades'][$i] . "')";
              $result = mysql_query($sql, $link);
            }

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
  }

  echo json_encode($response);
?>