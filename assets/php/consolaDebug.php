<?php

	/* FUNCIÓN QUE EQUIVALE A console.log DE JavaScript PERO EN PHP */

	function console_log( $data ){

  		/*echo '<script>';
		echo 'console.log('. json_encode( $data ) .')';
		echo '</script>';*/

		if(is_array($data) || is_object($data))
		{
			echo("<script>console.log('PHP: ".json_encode($data)."');</script>");
		} else {
			echo("<script>console.log('PHP: ".$data."');</script>");
		}
	}
?>