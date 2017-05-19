<?php
class Medico {
    var $dni;
    var $name;
    var $surname;
    var $n_citas;

    function __construct($dni, $name, $surname) {
       $this->dni = $dni;
       $this->name = $name;
       $this->surname = $surname;
       $this->n_citas = rand(25, 1000);
    }
}

$myArr = array(
    new Medico("12345678A", "Alirio", "Suarez"),
    new Medico("12345678A", "Alejandro", "Jimenez"), 
    new Medico("12345678A", "Marianela", "Cordero"), 
    new Medico("12345678A", "Marcelo", "Camero"),
    new Medico("12345678A", "Carmelo", "de Luca"),
    new Medico("12345678A", "Maria Aurora", "Zambrano"),
    new Medico("12345678A", "Luis", "Sosa"),
    new Medico("12345678A", "Jose Manuel", "Herrera"),
    new Medico("12345678A", "Luis Manuel", "Villegas"),
    new Medico("12345678A", "German Antonio", "Lotero Upegui"), 
    new Medico("12345678A", "Carlos Augusto", "Giraldo"), 
    new Medico("12345678A", "Jaime", "Lopez Tobon"), 
    new Medico("12345678A", "Bernardo", "Posada Vera"), 
    new Medico("12345678A", "Karen", "Contreras Fernandez"), 
    new Medico("12345678A", "Yessica", "Frias Ramirez"), 
    new Medico("12345678A", "Monica", "Diaz Diaz"), 
    new Medico("12345678A", "Pepe", "Troncho")
);

// Sort the json
function medicoSort( $a, $b ) {
    return $a->n_citas == $b->n_citas ? 0 : ( $a->n_citas < $b->n_citas ) ? 1 : -1;
}
usort( $myArr, 'medicoSort' );

$myJSON = json_encode($myArr);
echo $myJSON;
?>