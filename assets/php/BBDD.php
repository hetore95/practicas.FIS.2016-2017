<?php

	require 'consolaDebug.php';

	function conectar(){

		// Se conecta a la bbbd y devuelve un identificador de conexión

		$servername = "localhost";
		$db_username = "root";
		$db_password = "";
		$db_name     = "clinica_upm";

		$conn = mysql_connect($servername, $db_username, $db_password);

		if (!$conn) {
		    die('No se pudo conectar al servidor: ' . mysql_error());
		}

		$select_db = mysql_select_db($db_name, $conn);

		if (!$select_db) {
		    die('No se pudo conectar a la base de datos.');
		}

		//console_log("CONECTADO A LA BBDD");

		return $conn;
	}


?>