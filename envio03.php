<!DOCTYPE html>

<html lang="es">

<head>

<title>
Entrega de Tesis
</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen" href="entregas.css">
<link rel="shortcut icon" href="favicon.ico">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="author" content="Pablo Courault">
<meta http-equiv="Page-Exit" content="revealTrans(Duration=1, Transition=12)">

   <script language="javascript">

   // función para retornar sin perder los datos introducidos en el formulario

	 	function volver()
	           { history.back(); }
		
   // función para cargar otra imagen captcha
   	
      function recargar() 
             { document.getElementById('imagencaptcha').src = 'captcha.php?' + Date.now(); }
              
   </script>
   
</head>

 <?php require 'datos03.php'; 
       require 'archivos.php'; ?>

<body>

<center>

<div> 
<?php require("cabecera.html"); ?>
</div>

<div class="contenido">

<form enctype="multipart/form-data" action="envio04.php" method="post">

 <table id="tabla_envio03">
 
  <thead>
  
  <tr>
  <th colspan="2"> ENTREGA DE TRABAJOS </th>
  </tr>
  
  </thead>
  
  <tbody>
  
  <tr>
  <td colspan="2">Confirme los siguientes datos:</td>
  </tr>
  
  <tr>
  <td><u>Autor</u></td>
  <td><u>Profesor</u></td>
  </tr>

  <tr>
  <td> <?php echo $tesista_nombres_apellidos; ?> </td>
  <td> <?php echo $director_nombres_apellidos; ?></td>
  </tr>
  
  <tr>
  <td> Tel: <?php echo $tesista_telefono; ?> </td>
  <td> Tel: <?php echo $director_telefono; ?> </td>
  </tr>
  
  <tr>
  <td> Correo: <?php echo $tesista_correoe; ?> </td>
  <td> Correo: <?php echo $director_correoe; ?> </td>
  </tr>

  <tr>
  <td> Título: </td>
  <td> <textarea id="areatitulo" 
                 name="tesistitulo" 
                 rows="2" cols="32" 
                 readonly><?php echo $tesis_titulo."..."; ?></textarea>
  
  
   </td>
  </tr>
  
  <tr>
  <td> Permiso: </td>
  <td> <?php echo $tesis_tipo_autorizacion_desc; ?> </td>
  </tr>

  <tr>
  <td> Los datos son correctos:</td>
  <td> <input type="checkbox" id="chbx_confirma" name="confirmadatos" value="1" title="Confirma todos los datos" required> </td>
  </tr>

 
  <tr>
  <td> Ingrese las letras de la imagen: </td>
  <td><img src="captcha.php" width="200" height="50" id="imagencaptcha"><span id="recargar" class="reload" onClick="recargar()" title="recargar imagen">&#x21bb;</span></td>
  </tr> 

  
  <tr>
  <td></td>
  <td><input type="text" name="captcha_ingresado" pattern="[A-Z]{6}" placeholder="aquí en letras mayúsculas" required></td>
  </tr>


  <tr>
  <td></td>
  <td> <input type="button" value="Volver" onClick="volver()" style="font-size:16px;cursor:pointer;">
  <input type="submit" value="Confirmar" class="siguiente"> </td>
  </tr>
  
 <tbody> 
 </table>

    <!-- A continuación antes de cerrar el formulario, preparo campos ocultos con variables ingresadas
         en los pasos anteriores y consultadas en éste paso -->

    <input type="hidden" name="tesista_tipodoc" value="<?php echo $tesista_tipodoc ?>" >
    <input type="hidden" name="tesista_numerodoc" value="<?php echo $tesista_numerodoc ?>" >
    <input type="hidden" name="tesista_nombres" value="<?php echo $tesista_nombres ?>" >
    <input type="hidden" name="tesista_apellidos" value="<?php echo $tesista_apellidos ?>" >
    <input type="hidden" name="tesista_nombres_apellidos" value="<?php echo $tesista_nombres_apellidos ?>" >
    <input type="hidden" name="tesista_telefono"  value="<?php echo $tesista_telefono ?>" >
    <input type="hidden" name="tesista_correoe" value="<?php echo $tesista_correoe ?>" >
    <input type="hidden" name="director_nombres" value="<?php echo $director_nombres ?>" >
    <input type="hidden" name="director_apellidos" value="<?php echo $director_apellidos ?>" >
    <input type="hidden" name="director_nombres_apellidos" value="<?php echo $director_nombres_apellidos ?>" >  
    <input type="hidden" name="director_telefono" value="<?php echo $director_telefono ?>" > 
    <input type="hidden" name="director_correoe" value="<?php echo $director_correoe ?>" >
    <input type="hidden" name="tesis_unidad_academica_id" value="<?php echo $tesis_unidad_academica_id ?>" >
    <input type="hidden" name="tesis_unidad_academica_nombre_corto" value="<?php echo $tesis_unidad_academica_nombre_corto ?>" > 
    <input type="hidden" name="tesis_carrera_id" value="<?php echo $tesis_carrera_id ?>" >
    <input type="hidden" name="tesis_carrera_desc" value="<?php echo $tesis_carrera_desc ?>" >
    <input type="hidden" name="tesis_titulo" value="<?php echo $tesis_titulo ?>" >
    <input type="hidden" name="tesis_tipo_autorizacion_cod" value="<?php echo $tesis_tipo_autorizacion_cod ?>" >  
    <input type="hidden" name="tesis_tipo_autorizacion_desc" value="<?php echo $tesis_tipo_autorizacion_desc ?>" > 
    <input type="hidden" name="tesis_carpeta_ubicacion" value="<?php echo $tesis_carpeta_ubicacion ?>" >     
    <input type="hidden" name="codigoerror" value="<?php echo $codigoerror ?>" >    

</form>

</div>

 <div class= "piepagina">  
 <?php "piepagina.html"; ?>
 </div>
 
</center>

</body>

</html>
