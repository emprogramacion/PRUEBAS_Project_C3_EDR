function respuesta_recuperacion (){
    var email = document.getElementById('email').value;
    
    if (email === ''){
        alert("Por favor digite el email");
    }else {
        alert("Hemos enviado a su email un mensaje para reestablecer su usuario y/o contraseña");
    }
}