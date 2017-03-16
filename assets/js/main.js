/**
 * nuevoPaciente - obtiene los datos del formulario de nuevo paciente y los
 * envia a <fichero PHP> 
 */
function nuevoPaciente(){
    var paciente = {};
    paciente.nombre = $("#nuevoPaciente_nombre").val();
    paciente.apellido = $("#nuevoPaciente_apellido").val();
    paciente.companyia = $("#nuevoPaciente_companyia").val();
    paciente.dni = $("#nuevoPaciente_dni").val()

    console.log(paciente);

    enviarJSON('hola.php', paciente);
}

/**
 * nuevoPersonal - obtiene los datos del formulario nuevo personal y los envia a
 * <fichero PHP>
 */
function nuevoPersonal(){
    var personal = {};
    personal.nombre = $("#nuevoPaciente_nombre").val();

    console.log(personal);

    enviarJSON('hola.php', personal);
}

/**
 * enviarJSON - envia un objeto JSON en forma de String a el fichero phpUrl
 * mediante una peticion POST
 * 
 * @param {String} phpUrl 
 * @param {JSON} jsonObjet 
 */
function enviarJSON(phpUrl, jsonObjet){
    $.ajax({
        url: phpUrl,
        data: {json: JSON.stringify(jsonObjet)},
        type: 'POST',
        dataType: 'json',
        success:function(data, textStatus, jqXHR){
            console.log("success");
        }
    });
}

/**
 * anyadirEspecialidad - añade un campo de especialidad en el html.
 */
function anyadirEspecialidad(){
    // TODO:
}


// Mis mierdas
function asdf(){
    var a = {
        'nombre' : 'David',
        'telefono' : [
            '679919980',
            '786777568'
        ],
    }
    console.log(a.telefono[0]);
}