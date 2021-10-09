function RegistroExitoso(){
    var nombres=document.getElementById('nombres').value;
    var apellidos=document.getElementById('apellidos').value;
    var correo=document.getElementById('correo').value;
    var usuario=document.getElementById('usuario').value;
    var contraseña=document.getElementById('contraseña').value;
    if(nombres==='' || apellidos==='' || correo==='' || usuario==='' || contraseña===''){
        alert('Llena todos los campos')
    }else{
        alert('Registro exitoso');
    }   
}
