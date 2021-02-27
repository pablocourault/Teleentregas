<!DOCTYPE html>

<html lang="es">

<head>

<title>
Entrega de Tesis
</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen" href="entregas.css">
<link rel="shortcut icon" href="favicon.ico">

<meta http-equiv=”Content-Language” content=”es”/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="author" content="Pablo Courault">
<meta http-equiv="Page-Exit" content="revealTrans(Duration=1, Transition=12)">
 
</head>

<body>

<center>

<div> 

<?php require 'cabecera.html'; ?>

</div>

<div class="contenido">

<form enctype="multipart/form-data" action="envio02.php" method="post">

 <table id="tabla_envio01">
 
  <thead>
  <tr>
  <th colspan="2"> ENTREGA DE TRABAJOS </th>
  </tr>
  </thead>
  
  <tbody>
  <tr>
  <td colspan="2">COMPLETE LOS SIGUIENTES DATOS:</td>
  </tr>

  <tr>
  <td colspan="2"> Información del autor </td>
  </tr>

  <tr>
  <td> Tipo de documento: </td>
  <td> <select tabindex="1" name="tesista_tipodoc" required>
                             <option disabled="disabled" selected="selected">Seleccionar...</option>
                             <option value="1">DNI</option>
                             <option value="2">LC</option>
                             <option value="3">LE</option>
                             <option value="4">CI</option>
                             <option value="5">PASAPORTE</option>
                             <option value="6">DNT</option>
                             <option value="7">EXT</option>
                             <option value="8">CFED</option>
                             </select> </td>
  </tr>

  <tr>
  <td> Número de documento: </td>
  <td> <input tabindex="2" type="text" name="tesista_numerodoc" pattern="^[A-Z0-9]+" maxlength="14" size="14" required> (sin puntos ni guiones) </td>
  </tr>


  <tr>
  <td> Nombres: </td>
  <td><input tabindex="3" type="text" name="tesista_nombres" maxlength="32" size="32" required></td>
  </tr>

  <tr>
  <td> Apellidos: </td>
  <td> <input tabindex="4" type="text" name="tesista_apellidos" maxlength="32" size="32" required> </td>
  </tr>
  
  <tr>
  <td> Teléfono: </td>
  <td> <input tabindex="5" type="text" name="tesista_telefono"  maxlength="16" size="16" required> </td>
  </tr>
  
  <tr>
  <td>Correo electrónico: </td>
  <td> <input tabindex="6" type="email" name="tesista_correoe" maxlength="40" size="40" required> </td>
  </tr>

  <tbody>
  
 </table>

 <table id="tabla_envio01b">
 
  <tr>
  <td colspan="2"> Información del profesor </td>
  </tr>


  <tr>
  <td> Nombres: </td>
  <td> <input tabindex="7" type="text" name="director_nombres" maxlength="32" size="32" required></td>
  </tr>

  <tr>
  <td> Apellidos: </td>
  <td> <input tabindex="8" type="text" name="director_apellidos" maxlength="32" size="32" required> </td>
  </tr>

  <tr>
  <td> Teléfono: </td>
  <td> <input tabindex="9" type="text" name="director_telefono"  maxlength="16" size="16" required> </td>
  </tr>
 
  <tr>
  <td> Correo electrónico: </td>
  <td> <input tabindex="10" type="email" name="director_correoe"  maxlength="40" size="40" required> </td>
  </tr> 

 </table>

 <table id="tabla_envio01c">
 
  <tr>
  <td> Unidad académica de la carrera: </td>
  <td> <select tabindex="11" name="tesis_unidad_academica_id" required>
                             <option disabled="disabled" selected="selected">Seleccionar...</option>
                             <option value="2">Facultad de Ingeniería</option>
                             <option value="3">Facultad de Ciencias</option>
                             <option value="4">Facultad de Bioquímica</option>
                             <option value="5">Facultad de Economía</option>
                             <option value="6">Facultad de Abogacía</option>
                             <option value="7">Facultad de Veterinaria</option>
                             <option value="8">Facultad de Agronomía</option>
                             <option value="9">Facultad de Humanidades</option>
                             <option value="10">Facultad de Arquitectura</option>
                             <option value="20">Facultad de Medicina</option>
                             </select> </td>
  </tr>
  
  <tr>
  <td> </td>
  <td> <input type="reset" value="Limpiar" style="font-size:16px;cursor:pointer;"/>
        <input type="submit" value="Continuar" class="siguiente"> 
  </td>
  </tr>
  
 </table>

    <input type="hidden" name="formulario_id1" value="FmID01">

</form>

</div>

 <div class= "piepagina"> 

<?php require 'piepagina.html'; ?>
 
 </div>
 
</center>

</body>

</html>
