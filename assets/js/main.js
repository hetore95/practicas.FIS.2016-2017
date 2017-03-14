



/**
 * nuevoPaciente - funcion que obtiene los datos del "form de "
 */
function nuevoPaciente(){
    var paciente = {};
    paciente.nombre = $("#nuevoPaciente_nombre").val();
    paciente.apellido = $("#nuevoPaciente_apellido").val();
    paciente.companyia = $("#nuevoPaciente_companyia").val();
    paciente.dni = $("#nuevoPaciente_dni").val()

    console.log(paciente);
}


function rellenar(){
    $.getJSON("/person.php", function(result){
        console.log(result);
        $("#nombre").val(result.name);
        $("#edad").val(result.age);
        $("#ciudad").val(result.city);
    });
}