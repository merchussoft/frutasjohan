function ajax_send(direccion = '', parametros= {}){
    return $.ajax({
        url: direccion,
        method: "POST",
        data: parametros
    });
}

function swalAlertTimer(titulo, texto, icono, tiempo){
    Swal.fire({
        icon: icono,
        title: titulo,
        text: texto,
        showConfirmButton: false,
        timer: tiempo
    })
}

function swalAlert(titulo, texto, icono, ){
    return Swal.fire({
        title: titulo,
        text: texto,
        icon: icono,
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar'
    });
}

function dataTableOptions(data=[], column = []){
    return {
        "language":{
            "lengthMenu": "mostar _MENU_ registros por página",
            "info": "Mostrando página _PAGE_ de _PAGES_",
            "search": "Buscar:",
            "paginate": {
                "first":      "First",
                "last":       "Last",
                "next":       "Siguiente",
                "previous":   "Anterior"
            },
            "emptyTable":     "No hay datos disponibles en la tabla",
            "infoEmpty":      "mostrar 0 de 0 registros"
        },
        data: data,
        destroy: true,
        paging: true,
        bFilter: true,
        order: [
            [1, 'asc']
        ],
        columns: column
    }
}

function datepickerOptions() {
    return {
        monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio', 'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun', 'Jul','Ago','Sep','Oct','Nov','Dic'],
        dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sa'],
        changeYear: true,
        changeMonth: true,
        yearRange: '1940:2020',
    }
}