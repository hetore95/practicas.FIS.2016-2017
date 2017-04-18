/**
 * nuevoPaciente - obtiene los datos del formulario de nuevo paciente y los
 * envia a <fichero PHP> 
 */
function nuevoPaciente(){

    var paciente = {};
    var respuesta = {};

    paciente.nombre = $("#nuevoPaciente_nombre").val();
    paciente.apellido = $("#nuevoPaciente_apellido").val();
    paciente.companyia = $("#nuevoPaciente_companyia").val();
    paciente.dni = $("#nuevoPaciente_dni").val();
    paciente.contrasenya = '';//$("#nuevoPaciente_contrasenia").val();

    console.log(paciente);

    respuesta = enviarJSON('../php/insertarPaciente.php', paciente);

    respuesta.done(function( data, textStatus, jqXHR ) {

        if(data.error) {

            $('#paciente_registrado').removeClass('alert-success');
            $('#paciente_registrado').addClass('alert-danger');
        } else {

            $('#paciente_registrado').removeClass('alert-danger');
            $('#paciente_registrado').addClass('alert-success');
        }

        $('#paciente_registrado > span').text(data.descripcion);
        $('#paciente_registrado').show('slow');
    });
}