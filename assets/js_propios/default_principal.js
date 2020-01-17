$('document').ready(default_principal);

function default_principal(){
    $("#cerrar_sesion").on('click', cerrar_sesion)
}

function cerrar_sesion(){
    swalAlert('Desea cerrar sesion', 'Esta seguro', 'warning')
        .then((result) =>{
            if(result.value){
                ajax_send($("#pagina_principal").val() + "routing.php?funcion=cerrarSesion")
                    .done((data)=>{
                        window.location.href = $("#pagina_principal").val();
                    })
            }
        });
}