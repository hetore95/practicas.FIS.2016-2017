<?php
class Historial {
    var $fecha;
    var $comentario;

    function __construct($fecha, $comentario) {
       $this->fecha = $fecha;
       $this->comentario = $comentario;
    }
}

$myArr = array();
for ($i = 0; $i < 100; $i++) {
	$ma_fecha = rand(2014, 2017) . "/" . rand(1, 12) . "/" . rand(1, 30);
	// $ma_desc = "En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que vivía un hidalgo de los de lanza en astillero, adarga antigua, rocín flaco y galgo corredor. Una olla de algo más vaca que carnero, salpicón las más noches, duelos y quebrantos los sábados, lentejas los viernes, algún palomino de añadidura los domingos, consumían las tres partes de su hacienda. El resto della concluían sayo de velarte, calzas de velludo para las fiestas con sus pantuflos de lo mismo, los días de entre semana se honraba con su vellori de lo más fino. Tenía en su casa una ama que pasaba de los cuarenta, y una sobrina que no llegaba a los veinte, y un mozo de campo y plaza, que así ensillaba el rocín como tomaba la podadera. Frisaba la edad de nuestro hidalgo con los cincuenta años, era de complexión recia, seco de carnes, enjuto de rostro; gran madrugador y amigo de la caza. Quieren decir que tenía el sobrenombre de Quijada o Quesada (que en esto hay alguna diferencia en los autores que deste caso escriben), aunque por conjeturas verosímiles se deja entender que se llama Quijana; pero esto importa poco a nuestro cuento; basta que en la narración dél no se salga un punto de la verdad.";
	$ma_desc = "Comentario " . ($i+1);
    $num = rand(1, 10);
	array_push($myArr, new Historial($ma_fecha, $ma_desc));
}

// Sort the json
function histSort( $a, $b ) {
    return $a->fecha == $b->fecha ? 0 : ( $a->fecha < $b->fecha ) ? 1 : -1;
}
usort( $myArr, 'histSort' );

$respuesta["nombre_medico"] = "Manolo Diaz";
$respuesta["nombre_paciente"] = "Benito Arcantara";
$respuesta["historial"] = $myArr;

$myJSON = json_encode($respuesta);
echo $myJSON;
?>