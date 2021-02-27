<!DOCTYPE html>

<html lang="es">

<head>

<title>
Consulta de tesis
</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen" href="entregas.css">
<link rel="shortcut icon" href="favicon.ico">

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

<form action="consulta02.php" method="post">

 <table id="tabla_consulta01">
 
 <thead> 
  <tr>
  <th colspan="2"> CONSULTA DE TRABAJOS </th>
  </tr>
 </thead>
 
 <tbody>
  
  <tr>
  <td> Tipo de documento: </td>
  <td> <select tabindex="1" name="tipodoc" required>
                             <option disabled="disabled" selected="selected">Seleccionar...</option>
                             <option value="1">DNI</option>
                             <option value="2">LC</option>
                             <option value="3">LE</option>
                             <option value="4">CI</option>
                             <option value="5">PASAPORTE</option>
                             <option value="6">DNT</option>
                             <option value="7">EXT</option>
                             <option value="8">CFED</option>
                             </select></td>
  </tr>

  <tr>
  <td> Número de documento: </td>
  <td><input tabindex="2" type="text" name="numerodoc" size="16" required> (sin puntos ni guiones)</td>
  </tr>

  <tr>
   <td></td>
   <td> <input type="submit" value="Buscar" class="siguiente"/> </td>
  </tr>
 
 </tbody>
 
 </table>

</form>

</div>

<div class= "piepagina"> 
<?php require 'piepagina.html'; ?>
</div>
 
</center>

</body>

</html>
