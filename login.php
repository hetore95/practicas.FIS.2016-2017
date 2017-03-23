<?php
var_dump($_POST);
$stingJSON = $_POST['json'];
$obj = json_decode($stingJSON,true);
var_dump($obj);

$servername = "localhost";
$db_username = "";
$db_password = "";
$db_name = "clinica_upm";

$DNI = $obj['usr'];
$password = $obj['passwd']

$conn = new mysqli_connect($servername, $db_username, $db_password, $dbname)

if ($conn->connect_error) {
    die("No se pudo conectar a la base de datos: " . $conn->connect_error);
} 

$query = "SELECT * FROM usuario WHERE DNI = '$DNI' AND password = '$password'";
$result = $conn->query($query) or die("Unable to verify user because " . mysql_error());

if ($result->num_rows > 0) {
	$query1 = "SELECT TIPO_USUARIO FROM usuario WHERE DNI = '$DNI'";
	$result1 = mysql_query($query1) or die("Unable to verify user because " . mysql_error());
	$line = $result1->fetch_assoc();
	if($line[TIPO_USUARIO] == "medico"){
		$response["medico"] = 1;
	}
	elseif ($line[TIPO_USUARIO] == "admin") {
		$response["admin"] = 1;
	}
	else{
		$response["errorTr"] = 1;
	}
    echo json_encode($response);
}


else {

    $response["errorAu"] = 1;

    echo json_encode($response);
}

?>
