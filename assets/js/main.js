



/**
 * nuevoPaciente - funcion que obtiene los datos del "form" del alta de nuevos
 * pacientes y lo envia a un fichero php "nuevoPaciente.php"
 */
function nuevoPaciente(){
    var paciente = {};
    paciente.nombre = $("#nuevoPaciente_nombre").val();
    paciente.apellido = $("#nuevoPaciente_apellido").val();
    paciente.companyia = $("#nuevoPaciente_companyia").val();
    paciente.dni = $("#nuevoPaciente_dni").val()

    console.log(paciente);

    $.ajax({
        url: 'nuevoPaciente.php',
        data: {paciente: JSON.stringify(paciente)},
        type: 'POST',
        dataType: 'json',
        success:function(data, textStatus, jqXHR){
            console.log(Success);
        }
});
}


function anyadirEspecialidad(){
    $("#nuevoPersonal_botton_anyadir")
}