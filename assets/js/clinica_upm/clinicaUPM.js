/**
 * enviarJSON - envia un objeto JSON en forma de String a el fichero phpUrl
 * mediante una peticion POST
 * 
 * @param {String} phpUrl 
 * @param {JSON} jsonObject 
 */
function enviarJSON(phpUrl, jsonObject){

    return $.ajax({
        url: phpUrl,
        data: {json: JSON.stringify(jsonObject)},
        type: 'POST',
        dataType: 'json',
        success:function(data, textStatus, jqXHR){
            console.log("success");
        }
    })

    .done(function( data, textStatus, jqXHR ) {

        console.log( "La solicitud se ha completado correctamente." );
    })

    .fail(function( jqXHR, textStatus, errorThrown ) {

        console.log( "La solicitud ha fallado: " +  textStatus);
    });
}

/**
 * peticionLogging - obtiene los datos del form de logging y los mana al
 * servidor.
 */
function peticionLoging(){

    var loging = {};
    var respuesta = {};

    loging.usr = $("#loging_user").val();
    loging.passwd = $("#loging_passwd").val();

    console.log(loging);
    
    respuesta = enviarJSON('./assets/php/login.php', loging);

    respuesta.done(function( data, textStatus, jqXHR ) {

        console.log("Usuario registrado: " + data.usuario_registrado);

        if(data.usuario_registrado) {

            window.location.href = "./assets/html/nuevoPaciente.html";

        } else {

            $('#usuario_no_registrado').show('slow');
        }
    });
}

/**
 * cerrarAlert - oculta un mensaje mediante un click en el aspa.
 */
function cerrarAlert(idAlert) {

    $('#' + idAlert).hide('slow');
}

/**
 * pintarMenu - pinta el html del menú de la app en el color especificado.
 */
function pintarMenu(ancla, color) {

    var html = '';
    var colores = ['blue', 'azure', 'green', 'orange', 'red', 'purple'];

    // Si el color no está definido, se pone uno por defecto.
    if( $.inArray(color, colores) == (-1) ){

        color = 'blue';
    }

    html =  '<div class="sidebar" data-color="' + color + '" data-image="../img/sidebar-5.jpg">'+
                    '<div class="sidebar-wrapper">'+
                        '<div class="logo">'+
                            '<a href="http://www.creative-tim.com" class="simple-text">'+
                                'Clínica Universitaria UPM'+
                            '</a>'+
                        '</div>'+
                        '<ul class="nav">'+
                            '<li data-ancla="citas">'+
                                '<a href="dashboard.html">'+
                                    '<i class="pe-7s-news-paper"></i>'+
                                    '<p>Citas</p>'+
                                '</a>'+
                            '</li>'+
                            '<li data-ancla="paciente">'+
                                '<a href="nuevoPaciente.html">'+
                                    '<i class="pe-7s-id"></i>'+
                                    '<p>Nuevo Paciente</p>'+
                                '</a>'+
                            '</li>'+
                            '<li data-ancla="personal">'+
                                '<a href="nuevoPersonal.html">'+
                                    '<i class="pe-7s-id"></i>'+
                                    '<p>Nuevo Médico</p>'+
                                '</a>'+
                            '</li>'+
                        '</ul>'+
                    '</div>'+
            '</div>';

    $('#menuPrincipal').html(html);

    // Comprueba la ruta de la imagen, y la pone de fondo
    lbd.checkSidebarImage();

    // Establece un punto del menú como activo
    $('li[data-ancla="' + ancla + '"]').addClass('active');
}

/**
 * pintarBarraNavegacion - pinta el html de la barra superior de la app.
 */
function pintarBarraNavegacion() {

    var html = '';

    html =  '<nav class="navbar navbar-default navbar-fixed">'+
                '<div class="container-fluid">'+
                    '<div class="collapse navbar-collapse">'+
                        '<ul class="nav navbar-nav navbar-right">'+
                            '<li>'+
                                '<a href="../../index.html">'+
                                    '<p>Cerrar Sesión <i class="pe-7s-power"></i></p>'+
                                '</a>'+
                            '</li>'+
                            '<li class="separator hidden-lg hidden-md"></li>'+
                        '</ul>'+
                    '</div>'+
                '</div>'+
            '</nav>';

    $('#barraNavegacion').html(html);
}