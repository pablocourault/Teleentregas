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
	           
  </script>
  
</head>


 <?php require 'datos02.php'; ?> 

<body>

<center>

<div> 
<?php require 'cabecera.html'; ?>
</div>

<div class="contenido">

<form enctype="multipart/form-data" action="envio03.php" method="post">

 <table id="tabla_envio02">
 
  <thead>
  
  <tr>
  <th colspan="2"> ENTREGA DE TRABAJOS </th>
  </tr>
  
  </thead>
  
  <tbody>
  
  <tr>
  <td colspan="2">Complete los siguientes datos:</td>
  </tr>


  <tr>
  <td> Carrera para la que presenta el trabajo: </td>
  <td> <select tabindex="1" name="tesis_carrera_id" required>
                             
 <?php
 
			// cargo los datos de conexion
  
  			include ("configuracion.php"); 

  			// se establece conexion con PostgreSQL

  			$link = pg_connect("host=$servidor port=$puerto dbname=$basedatos user=$usuario password=$password");

  			if (!$link) die('No se puede conectar a : ' . pg_last_error());
  
  			$consulta = "SELECT  max(codigo), nombre 
  		              	   FROM teleentregas.carreras 
                          WHERE uacademi = $tesis_unidad_academica_id 
                            AND nombre NOT IN ('Alumnos Externos de Intercambio','Alumnos Oyentes','Alumnos de Integración',
                                               'Educación Continuada','Formación Continua','ALUMNOS EXTERNOS','EDUCACION CONTINUA',
                                               'Alumnos Externos por Integración','Alumnos Externos','BACHILLER EN CIENCIAS ECONÓMICAS',
                                               'CONTADOR PÚBLICO NACIONAL','LICENCIATURA EN ECONOMÍA','LICENCIATURA EN ADMINISTRACIÓN',
                                               'Extensión y Posgrado','ABOGACIA','PROCURACION','Estudiantes externos','Cursos de posgrado 2007',
                                               'Bachiller Universitario en Ciencias Jurídicas y Sociales','Conferencia: Ineficacia Concursal',
                                               'ALUMNOS POR INTEGRACIÓN','ESTUDIANTES DE INTERCAMBIO','Licenciatura en trabajo social')            
                            AND POSITION('Distancia' IN nombre) = 0
                            AND POSITION('Curso de Posgrado' IN nombre) = 0
                            AND POSITION('Curso de Actualización' IN nombre) = 0
                            AND POSITION('Curso de Actualizacion' IN nombre) = 0
                            AND POSITION('Curso de Formación Profesional' IN nombre) = 0
                            AND POSITION('Curso de Capacitación' IN nombre) = 0
                            AND POSITION('Bachiller Universitario' IN nombre) = 0
                            AND POSITION('Especialización en Diseño' IN nombre) = 0
                            AND POSITION('Especialización en Pericias y Tasaciones' IN nombre) = 0
                            AND POSITION('Tecnicatura en Diseño' IN nombre) = 0
                       GROUP BY 2 
                       ORDER BY 2 ASC";
  			

  			$resultado = pg_query($link, $consulta) or die ('La consulta fallo : ' . pg_last_error());

  			$cantidadfilas = pg_numrows($resultado);

			if ($cantidadfilas == 0 )
				{
	 			  $codigoerror = 1;
				}
			else
	   			{
        		while ($row = pg_fetch_row($resultado)) 
              		{
               		echo "<option value=\"$row[0]\">".substr($row[1],0,90)."</option>";
              		}	
	 			}	 			
			pg_free_result($resultado);
			
			// Cierra la conexión	
            pg_close($link);
 ?>                             
                          
                            
       </select></td>
       
  </tr>



  <tr>
  <td> Título del trabajo: </td>
  <td> <textarea id="textareatitulo" 
                 tabindex="2"
                 name="tesis_titulo" 
                 rows="2" cols="50" 
                 maxlength="400"
                 placeholder="Ingrese aquí el título de la tesis..." required></textarea>
  </td>
  </tr>


  <tr>
  <td> Autorización de publicación: </td>
  <td> <select tabindex="3" name="tesis_tipo_autorizacion_cod" required>
                             <option disabled="disabled" selected="selected">Seleccionar...</option>
                             <option value="1">Autoriza la publicación</option>
                             <option value="2">Autoriza después de 1 (un) año</option>
                             <option value="3">Autoriza después de 2 (dos) años</option>
                             <option value="4">NO autoriza la publicación</option>
                             </select> </td>
  </tr>

  <tr>
  <td> Adjunte ficha catalográfica en español: </td>
  <td> <input type ="file" width="128" name="fichaespaniol"  accept=".doc,.docx,.odt" required> </td>
  </tr>

  
  <tr>
  <td> Adjunte ficha catalográfica en inglés: </td>
  <td> <input type ="file" width="128" name="fichaingles" accept=".doc,.docx,.odt" required> </td>
  </tr>
  

  
  <tr>
  <td> Adjunte el archivo del trabajo: <i>(*)</i> </td>
  <td> <input type ="file" width="128" name="pdftesis" accept=".pdf" required><i>&nbsp;(*) en formato pdf y menor a 24 MB</i></td>
  </tr>


  <tr>
  <td></td>
  <td> <input type="button" value="Volver" onClick="volver()" style="font-size:16px;cursor:pointer;">
  <input type="submit" value="Continuar" class="siguiente"> </td>
  </tr>
  
 <tbody> 
 </table>

    <!-- A continuación antes de cerrar el formulario, preparo campos ocultos con variables ingresadas en los pasos anteriores y consultadas en éste paso -->

    <input type="hidden" name="tesista_tipodoc" value="<?php echo $tesista_tipodoc ?>" >
    <input type="hidden" name="tesista_numerodoc" value="<?php echo $tesista_numerodoc ?>" >
    <input type="hidden" name="tesista_nombres" value="<?php echo $tesista_nombres ?>" >
    <input type="hidden" name="tesista_apellidos" value="<?php echo $tesista_apellidos ?>" >
    <input type="hidden" name="tesista_telefono"  value="<?php echo $tesista_telefono ?>" >
    <input type="hidden" name="tesista_correoe" value="<?php echo $tesista_correoe ?>" >
    <input type="hidden" name="director_nombres" value="<?php echo $director_nombres ?>" >
    <input type="hidden" name="director_apellidos" value="<?php echo $director_apellidos ?>" > 
    <input type="hidden" name="director_telefono" value="<?php echo $director_telefono ?>" > 
    <input type="hidden" name="director_correoe" value="<?php echo $director_correoe ?>" >
    <input type="hidden" name="tesis_unidad_academica_id" value="<?php echo $tesis_unidad_academica_id ?>" >

    <input type="hidden" name="formulario_id1" value="<?php echo $formulario_id1 ?>" >
    <input type="hidden" name="formulario_id2" value="FmID02">

    <input type="hidden" name="codigoerror" value="<?php echo $codigoerror ?>" > 
                
</form>

</div>

 <div class= "piepagina"> 
 <?php require 'piepagina.html'; ?>
 </div>
 
</center>

</body>

</html>
