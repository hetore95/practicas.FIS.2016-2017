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
    personal.nombre = $("#nuevoPersonal_nombre").val();
    personal.apellido = $("#nuevoPersonal_apellido").val();
    personal.numColegiado = $("#nuevoPersonal_numcoleg").val();
    personal.tMinConsulta = $("#nuevoPersonal_tminconsulta").val();
    personal.diasConsulta = $("#nuevoPersonal_diasconsulta").val();
    personal.especialidad = [];
    $("input[name='especialidades[]']").each(function() {
        personal.especialidad.push($(this).val());
    });

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
    var div = '<div class="form-group" id="divEspecialidad"><input type="text" class="form-control" placeholder="Especialidad" name="especialidades[]"></div>'
    $("#spamEspecialidad").prepend(div);
}


// // Mis mierdas
// function asdf(){
//     var a = {
//         'nombre' : 'David',
//         'telefono' : [
//             '679919980',
//             '786777568'
//         ],
//     }
//     console.log(a.telefono[0]);
// }
