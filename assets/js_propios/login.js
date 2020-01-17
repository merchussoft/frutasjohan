$("document").ready(inicia_login);

function inicia_login() {

    $("#form_login").on("submit", login_submit)
}

function login_submit(e) {
    e.preventDefault();
    //
    // Swal.fire({
    //     title: 'Error!',
    //     text: 'Do you want to continue',
    //     icon: 'error',
    //     confirmButtonText: 'Cool'
    // })

    ajax_send($("#pagina_principal").val() + "routing.php", $(this).serialize())
        .done((data) => {
            if (!data.validate) {
                swalAlertTimer("Precaucion", data.data, "error", 2500)
                return false;
            }
            window.location.href = $("#pagina_principal").val() + "routing.php?modulo=1";
        });
}