<!DOCTYPE html>

<html>

<head>

<title>
Consulta de tesis
</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen" href="entregas.css">
<link rel="shortcut icon" href="favicon.ico">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="author" content="Pablo Courault">
<meta http-equiv="Page-Exit" content="revealTrans(Duration=10, Transition=12)">

  <script language="javascript">

   // función para retornar sin perder los datos introducidos en el formulario

	 function volver()
	          { history.back(); }
              
  </script>
   
</head>

<body>

<center>

<div> 
<?php require 'cabecera.html'; ?>
</div>

<div class="contenido">
 
 <table id="tabla_consulta02">
  
 <thead>
 
 <tr>
 <th colspan="5">CONSULTA DE TRABAJOS</th>
 </tr>
 
 </thead>

<tbody>

  <tr>
   <td>INGRESO</td>
   <td>AUTOR</td>
   <td>TÍTULO</td>
   <td>CARRERA</td>
   <td>PUBLICACIÓN</td>
  </tr>

<?php

  $tesista_tipodoc = $_POST['tipodoc'];
  $tesista_numerodoc = $_POST['numerodoc'];

  // cargo los datos de conexion
  
  include ("configuracion.php"); 
    
  // se establece conexion con PostgreSQL

   $link = pg_connect("host=$servidor port=$puerto dbname=$basedatos user=$usuario password=$password");

   if (!$link) die('No se puede conectar a : ' . pg_last_error());
  
   $consulta = "SELECT tesis_fecha_solicitud,tesista_apellidos,tesis_titulo,tesis_carrera_desc,tesis_estado_publicacion_desc 
                  FROM teleentregas.tesisdigitales 
                 WHERE tesista_tipodoc = $tesista_tipodoc
                   AND tesista_numerodoc = '$tesista_numerodoc'";

  			$resultado = pg_query($link, $consulta) or die ('Error: no se pudo hacer la consulta'.pg_last_error());

  			$cantidadfilas = pg_numrows($resultado);

			if ($cantidadfilas == 0 )
				{
				
				 echo "<tr>";
     			 echo "<td colspan=\"5\">  </td>";
     		     echo "</tr>";
     
	 			 echo "<tr>";
     			 echo "<td colspan=\"5\"> <span class=\"errorconsulta\">No se encuentran tesis para el número de documento ingresado</span> </td>";
     		     echo "</tr>";
     
     			 echo "<tr>";
     			 echo "<td colspan=\"5\">";     			 
     			 echo "<input type=\"button\" value=\"Volver\" onClick=\"volver()\" style=\"font-size:16px;cursor:pointer;\"> </td>";
     			 echo "</tr>"; 
     
     			 echo "</table>";
				}
			else
	   			{             	 
            	  for($contador=0;$contador<$cantidadfilas;$contador++)
	 	             {
                      // se formatea la fecha al uso local
	 	 			  $campo0= date("d-m-Y", strtotime(pg_result($resultado,$contador,0)));	 	 			  
	 	 			  $campo1=pg_result($resultado,$contador,1);
	 	 			  // se trunca el título a 102 caractéres
	 	 			  $campo2=substr(pg_result($resultado,$contador,2),0,102);
	 	 			  $campo3=pg_result($resultado,$contador,3);
	 	 			  // $campo4=pg_result($resultado,$contador,4);
	 	 			  $campo4=substr(pg_result($resultado,$contador,4),0,9);
	 	 			  
	 	 			  $color = "blue";
	 	 			  if ($campo4 == "Pendiente") {$color = "#FF0000";}
	 	 			  if ($campo4 == "Publicada") {$color = "#00CC00";}
	 	 	 	 
	     			  echo "<tr>\n";   // ¿¿ porqué el barra n ??
	     			  echo "<td>$campo0</td>\n";
         			  echo "<td>$campo1</td>\n";
         			  echo "<td>$campo2</td>\n";
         			  echo "<td>$campo3</td>\n";
         			  echo "<td><text style=\"color: $color; font-size:9pt;\">$campo4 </text></td>\n";
         			  echo "</tr>\n";	
              		  }	

	 				} 			
			pg_free_result($resultado);
			
			// Cierra la conexión	
            pg_close($link);

?>
  
 </tbody>  
 
 </table>
 
 </div>
 
<div class= "piepagina"> 
<?php require 'piepagina.html'; ?> 
</div>
 
</center>

</body>
</html>
