function datos_registrados(){
    var latitud = document.getElementById('latitud').value;
    var orden = document.getElementById('orden').value;
    var longitud = document.getElementById('longitud').value;
    var familia = document.getElementById('familia').value;
    var pais = document.getElementById('pais').value;
    var especie = document.getElementById('especie').value;
    var localidad = document.getElementById('localidad').value;
    var elevacion = document.getElementById('elevacion').value;
    var genero = document.getElementById('genero').value;
    var codigo_genbank = document.getElementById('geob').value;
    var marcador_molecular = document.getElementById('marmol').value;
    var referencia = document.getElementById('referencia').value;

    console.log ("Latitud: "+ latitud + " - Longitud: "+longitud + " - Orden: " + orden + " - Familia: " + familia
    + " - Pais: "+ pais + " - Especie: "+ especie + " - Localidad: "+ localidad + " - Elevacion: "+ elevacion 
    + " - Genero: "+ genero + " - Codigo genbank: "+ codigo_genbank + " - Marcador molecular: "+marcador_molecular
    + " - Referencia: "+referencia);

    alert("Latitud: "+ latitud + " - Longitud: "+longitud + " - Orden: " + orden + " - Familia: " + familia
    + " - Pais: "+ pais + " - Especie: "+ especie + " - Localidad: "+ localidad + " - Elevacion: "+ elevacion 
    + " - Genero: "+ genero + " - Codigo genbank: "+ codigo_genbank + " - Marcador molecular: "+marcador_molecular
    + " - Referencia: "+referencia);

    if (latitud === '' || orden === '' || longitud === '' || pais === '' || especie === '' || genero === ''
    || codigo_genbank === '' || marcador_molecular === '' || referencia === ''){
        alert("Registro de datos biológicos exitoso");
    }else {
        alert("Los campos obligatorios no pueden estar vacíos");
    }

}