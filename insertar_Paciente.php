<?php
	var_dump($_POST);
	$stingJSON = $_POST['json'];
	$obj = json_decode($stingJSON,true);

	var_dump($obj);

		//comprobamos que el formulario está completo(campo por campo)
		if ($obj['nombre']=="")
		{
			$error= array('error'=>'campo nombre no definido');
			return json_encode($error);
		}
		if ($obj['apellido']=="")
		{
			$error= array('error'=>'campo apellidos no definido');
			return json_encode($error);
		}
		if ($obj['companyia']=="")
		{
			$error= array('error'=>'campo compañía no definido');
			return json_encode($error);
		}
		if ($obj['dni']=="")
		{
			$error= array('error'=>'campo DNI no definido');
			return json_encode($error);
		}
		if (strlen($obj['dni'])!=9)
		{
			$error= array('error'=>'forato DNI incorrecto');
			return json_encode($error);
		}
		if ($obj['contrasenya']=="")
		{
			$error= array('error'=>'campo contraseña no definido');
			return json_encode($error);
		}

		//datos del servidor
		$hotsdb= "localhost"; //servidor
		$basededatos="clinica_upm";
		$usuariodb="root";
		$clavedb="";

	//conexion a la base de datos y servidor
	$conexion_db = mysql_connect($hotsdb, $usuariodb,$clavedb) or die ("No se encuentra el servidor");
	mysql_select_db($basededatos) or die ("Error de conexión");
	
	
	//obtenemos los valores del formulario
	$nombre = $obj['nombre'];
	$apellidos = $obj['apellido'];
	$aseguradora = $obj['companyia'];
	$dni = $obj['dni'];
	$contraseña = $obj['contrasenya'];

	//Obtiene la longitud de un string(para validar que todo esté relleno)
	/*$req = (strlen($nombre)*strlen($apellidos)*strlen($aseguradora)*strlen($dni)) or die("No se han rellenado todos los campos<br><br><a href='nuevoPaciente.html' >");*/

	$sql = "SELECT 'dni' FROM usuario";
	if(mysql_num_rows(mysql_query($sql))!= $dni){
		//Ingresar la informacion a la tabla de datos
		$sql = "INSERT INTO usuario VALUES ('','$nombre','$apellidos','$dni','$contraseña','paciente')" or die("<h2>Error de envio</h2>");
		$result = mysql_query($sql);

		$sql = "INSERT INTO paciente VALUES ('','','$aseguradora')" or die("<h2>Error de envio</h2>");
		$result = mysql_query($sql);

		echo '<h2>Registro completo</h2>';
	}
	else echo "El usuario ya esta registrado, introduzca un nuevo usuario";
?>