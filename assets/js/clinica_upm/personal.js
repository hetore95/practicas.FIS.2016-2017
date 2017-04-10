/**
 * nuevoPersonal - obtiene los datos del formulario nuevo personal y los envia a
 * <fichero PHP>
 */
function nuevoPersonal(){

    var personal = {};
    var respuesta = {};
    var peticion = {};

    peticion.accion = "insertar";
    peticion.opcion = "personal";

    personal.nombre = $("#nuevoPersonal_nombre").val();
    personal.apellido = $("#nuevoPersonal_apellido").val();
    personal.numColegiado = $("#nuevoPersonal_numcoleg").val();
    personal.tMinConsulta = $("#nuevoPersonal_tminconsulta").val();
    personal.diasConsulta = $("#nuevoPersonal_diasconsulta").val();
    personal.contrasenya = $("#nuevoPersonal_contrasenia").val();
    personal.dni = $("#nuevoPersonal_DNI").val();
    personal.especialidades = [];

    /*$("input[name='especialidades[]']").each(function() {
        personal.especialidad.push($(this).val());
    });*/

    $('#tabla_especialidades td[data-id_especialidad]').each(function() {

        personal.especialidades.push( $(this).text() );
    });

    console.log(personal);

    peticion.personal = personal;

    respuesta = enviarJSON('../php/insertarPersonal.php', peticion);

    respuesta.done(function( data, textStatus, jqXHR ) {

        if(data.error) {

            $('#personal_registrado').removeClass('alert-success');
            $('#personal_registrado').addClass('alert-danger');
        } else {

            $('#personal_registrado').removeClass('alert-danger');
            $('#personal_registrado').addClass('alert-success');
        }

        $('#personal_registrado > span').text(data.descripcion);
        $('#personal_registrado').show('slow');
    });
}

/**
 * anyadirEspecialidad - añade un campo de especialidad en el html.
 */
function anyadirEspecialidad(idEspecialidad, especialidad){

    /*var div = '<div class="form-group" id="divEspecialidad"><input type="text" class="form-control" placeholder="Especialidad" name="especialidades[]"></div>'
    $("#spamEspecialidad").prepend(div);*/

    var html = '';
    var error = '';
    var especialidadesSeleccionadas = [];

    if( idEspecialidad == '' ){

        // Si no se ha seleccionado una especialidad
        error = 'Por favor, selecciona una especialidad.';

    } else {

        // Obtengo las especialidades que ha seleccionado el usuario
        $( '#tabla_especialidades td[data-id_especialidad]' ).each(function( key ) {

            especialidadesSeleccionadas[key] = $( this ).text(); 
        });


        if( $.inArray(idEspecialidad, especialidadesSeleccionadas) != (-1) ){

            // Si hay coincidencias, significa que se ha seleccionado la especialidad dos veces
            error = 'Especialidad seleccionada.';

        } else {

            $('#tabla_especialidades').removeClass('hide');

            html = '<tr>';
            html += '<td data-id_especialidad="' + idEspecialidad + '">' + idEspecialidad + '</td>';
            html += '<td>' + especialidad + '</td>';
            html += '<td><i class="pe-7s-trash" style="color:red;" onclick="eliminarEspecialidad(this)"></i></td>';
            html += '</tr>';

            $('#tabla_especialidades > tbody').append(html);
        }
    }


    if( error != '' ){

        $('#personal_registrado').addClass('alert-danger');
        $('#personal_registrado > span').html(error);
        $('#personal_registrado').show('slow');
    }
}

/**
 * cargarEspecialidad - consulta en la BD las posibles especialidades.
 */
function cargarEspecialidad(){
    
    var respuesta = {};
    var peticion = {};
    var html = '';

    peticion.accion = "consultar";
    peticion.opcion = "especialidad";

    respuesta = enviarJSON('../php/insertarPersonal.php', peticion);

    respuesta.done(function( data, textStatus, jqXHR ) {

        html += '<option value="">Selecionar ...</option>';

        $.each( data, function( key, value ) {

            html += '<option value="' + value.ID + '">';
            html += value.NOMBRE;
            html += '</option>';
        });

        $('#divEspecialidad > select').html(html);
    });
}

/**
 * eliminarEspecialidad - elimina una especialidad de la tabla creada en el front
 */
function eliminarEspecialidad(dom) {

    var tr = $(dom).closest('tr');

    tr.remove();
}