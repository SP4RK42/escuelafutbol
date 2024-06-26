$(document).on("click", "#btnagregar", function(){
    $("#txtnomequi").val("");
    $("#txtmaxequi").val("");
    $("#hddequicod").val("0");
    listarCboEntrenador(0, 0);

    $("#modalequipos").modal("show");
})

$(document).on("click", ".btnactualizar", function(){
    $("#txtnomequi").val($(this).attr("data-equinom"));
    $("#cboentrenador").empty();
        listarCboEntrenador($(this).attr("data-equient"));
    $("#txtmaxequi").val($(this).attr("data-equimax"));
    $("#hddequicod").val($(this).attr("data-equicod"));
    $("#modalequipos").modal("show");
})

$(document).on("click", "#btnguardar", function(){
    $.ajax({
        type: "POST",
        url: "/equipos/register",
        contentType: "application/json",
        data: JSON.stringify({
            id: $("#hddequicod").val(),
            nombre_equipo: $("#txtnomequi").val(),
            entrenador: $("#cboentrenador").val(),
            nromaximo: $("#txtmaxequi").val()
        }),
        success: function(resultado){
            if(resultado.respuesta){
                listarequipos()
            }
            alert(resultado.mensaje);
        }
    });
    $("#modalequipos").modal("hide");
});

function listarequipos(){
    $.ajax({
        type: "GET",
        url: "/equipos/list",
        datatype:"json",
        success: function(resultado){
            $("#tblequipo > tbody").html("");
            $.each(resultado, function(index, value){
                $("#tblequipo > tbody").append(`<tr>`+
                `<td>${value.id}</td>`+
                `<td>${value.nombre_equipo}</td>`+
                `<td>${value.entrenador.nombre + ' ' + value.entrenador.apellido}</td>`+
                `<td>${value.nromaximo}</td>`+
                `<td><button type='button' class='btn btn-primary btnactualizar' `+
                    `data-equicod="${value.id}" `+
                    `data-equinom="${value.nombre_equipo}" `+
                    `data-equient="${value.entrenador.id}" `+
                    `data-equimax="${value.nromaximo}">Actualizar `+
                    `</button></td>`+
                `</tr>`);
            });
        }
    });
}

function listarCboEntrenador(id){
    $.ajax({
    type: "GET",
    url: "/profesores/get",
    datatype: "json",
    success: function(resultado){
        $.each(resultado, function(index, value){
            $("#cboentrenador").append(
                `<option value="${value.id}">${value.nombre} ${value.apellido}</option>`
            )
        });
        if(id > 0){
            $("#cboentrenador").val(id);
        }
    }
    })
}
