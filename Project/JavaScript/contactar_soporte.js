function contactar_soporte(){
    var nombre = document.getElementById("nombre").value;
    var doc = document.getElementById("doc").value;
    var email = document.getElementById("email").value;
    var desc = document.getElementById("desc").value;

    console.log("Nombre: "+nombre +" - Documento: "+doc+" - Email: "+email+" - Descripción: "+desc);
    alert("Nombre: "+nombre +" - Documento: "+doc+" - Email: "+email+" - Descripción: "+desc);

    if(nombre === '' || doc === '' || email === '' || desc === ''){
        alert("Solicitud al soporte técnico enviada, la respuesta a su solicitud será via email");
    }else {
        alert("Diligencia los campos requeridos para contactarse con el soporte");
    }

}