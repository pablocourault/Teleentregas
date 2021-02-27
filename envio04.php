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
		{
		history.back();
		}

	</script>

</head>

<?php
  
 session_start();
 
  // Datos desde pasos anteriores

  require 'datos04.php';

  // Valida letras de captcha
  
  if($_POST['captcha_ingresado'] <> $_SESSION['texto_captcha']) 
    {$codigoerror = 20;}
  
?>

<body>

<center>

<div> 
<?php require("cabecera.html"); ?>
</div>

<div class="contenido">

<form enctype="multipart/form-data" action="envio04.php" method="post">

 <table id="tabla_envio04">
  
  <thead>
  
  <tr>
  <th> ENTREGA DE TRABAJOS </th>
  </tr>
  
  </thead>
  
  <tbody>
  
  <tr>
  <td> Resultado del envío: </td>
  </tr>

  
  <tr>
  <td>
  
  <?php
 
    if ($codigoerror == 0)
 	 {
         
      // ARRANCO LA GRABACIÓN EN LA BASE DE DATOS

      // cargo los datos de conexion
 
      require("configuracion.php"); 

	  // se establece conexion con PostgreSQL


      $link = pg_connect("host=$servidor port=$puerto dbname=$basedatos user=$usuario password=$password");

      if (!$link) {$codigoerror = 99;};
  
            $consulta = "INSERT INTO teleentregas.tesisdigitales 
                         VALUES (default,'$tesista_tipodoc','$tesista_numerodoc','$tesista_nombres',
                                         '$tesista_apellidos','$tesista_nombres_apellidos','$tesista_correoe','$tesista_telefono',
                                         '$director_nombres','$director_apellidos','$director_nombres_apellidos','$director_correoe','$director_telefono',
                                         '$tesis_unidad_academica_id','$tesis_unidad_academica_nombre_corto',$tesis_carrera_id,'$tesis_carrera_desc',
                                         '$tesis_titulo','$tesis_tipo_autorizacion_cod','$tesis_tipo_autorizacion_desc','$tesis_fecha_solicitud',NULL,NULL,
                                         '$tesis_conformidad_director',NULL,'$tesis_estado_publicacion','$tesis_estado_publicacion_desc',
                                         '$tesis_carpeta_ubicacion','$tesis_coordenada_uno','$tesis_coordenada_dos')";

  			$resultado = pg_query($link, $consulta) or die ('Error: no se pudo insertar en la base de datos'.pg_last_error());

			if ($resultado)
				{
	 			 echo "<div class=\"datosgrabados\">";     		      
                 echo "Hemos recibido su solicitud de publicación, puede consultar el estado de su trabajo yendo a la opción: 'Consultar estado'.";
                 echo "</div>";               

                 // envío un correo de aviso al administrador del repositorio de que hay una tesis pendiente de publicación y los datos necesarios

                 $to = "$correo_administracion";
                 $subject = "Tesis: ".$tesista_nombres_apellidos." Pendiente de publicación";
                 $txt = "Tipo Documento: ".$tesista_tipodoc."\n"."Número de documento: ".$tesista_numerodoc."\n";
                 $txt = $txt."Coordenada Uno: "."$tesis_coordenada_uno"."\n"."Coordenada Dos: ".$tesis_coordenada_dos."\n";
                 $headers = "MIME-Version: 1.0" . "\r\n";
                 $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
                 $headers .= "From: $correo_remitente" . "\r\n";
                 $headers .= 'Bcc: pablocourault@gmail.com' . "\r\n";
                 mail($to,$subject,$txt,$headers); 
 
				}
			else
	   			{ 
	   			{$codigoerror = 99;}            	 
              	}	
	 				 			
			pg_free_result($resultado);
			
			// Cierra la conexión	
            pg_close($link);
            
            echo "</td>";
            echo "</tr>";     
                            
	}
        
 else {

  	   echo "<div class=\"errordatos\">";

       if ($codigoerror == 1) {echo "Error: No se pudieron leer los datos introducidos.";} 	 	      
       if ($codigoerror == 2) {echo "Error: El valor del documento o pasaporte es demasiado corto.";}
       if ($codigoerror == 3) {echo "Error: Los datos de nombres y apellidos del autor podrían estar incompletos.";}
       if ($codigoerror == 4) {echo "Error: El número de teléfono del autor está incompleto.";}
       if ($codigoerror == 5) {echo "Error: La dirección de correo electrónico del autor es vacía/nula.";}
       if ($codigoerror == 6) {echo "Error: Los datos de nombres y apellidos del director podrían estar incompletos.";}
       if ($codigoerror == 7) {echo "Error: El número de teléfono del director está incompleto.";}
       if ($codigoerror == 8) {echo "Error: La dirección de correo electrónico del director es vacía/nula.";}
       if ($codigoerror == 9) {echo "Error: El título del trabajo podría estar incompleto";}
       if ($codigoerror == 10) {echo "Error: El número de documento debe contener solo números.";}
       if ($codigoerror == 11) {echo "Error: Los correos del autor y del director son iguales.";}
       if ($codigoerror == 12) {echo "Error: ha ocurrido un error interno en el flujo del formulario.";}
       if ($codigoerror == 13) {echo "Error: No se ha elegido un tipo de autorización de publicación.";}
       if ($codigoerror == 20) {echo "Error: Las letras introducidas no coinciden con la imagen.";}
       if ($codigoerror == 30) {echo "Error: El archivo de la ficha en español es demasiado grande.";}
       if ($codigoerror == 31) {echo "Error: El archivo de la ficha en inglés es demasiado grande.";}
       if ($codigoerror == 32) {echo "Error: El archivo pdf de tesis es demasiado grande.";}
       if ($codigoerror == 33) {echo "Error: No se pudo crear la carpeta contenedora de los documentos.";}
       if ($codigoerror == 34) {echo "Error: No se pudo subir la ficha catalográfica en español.";}
       if ($codigoerror == 35) {echo "Error: No se pudo subir la ficha catalográfica en inglés.";}
       if ($codigoerror == 36) {echo "Error: No se pudo subir el archivo con la tesis.";}
       if ($codigoerror == 37) {echo "Error: No se adjuntó el archivo de la ficha en español.";}
       if ($codigoerror == 38) {echo "Error: No se adjuntó el archivo de la ficha en inglés.";}
       if ($codigoerror == 39) {echo "Error: No se adjuntó el archivo pdf de la tesis.";}
       if ($codigoerror == 40) {echo "Error: El tipo de archivo adjuntado no coincide con el formato pedido en la ficha en español";}       
       if ($codigoerror == 41) {echo "Error: El tipo de archivo adjuntado no coincide con el formato pedido en la ficha en ingles";}       
       if ($codigoerror == 42) {echo "Error: El tipo de archivo adjuntado no coincide con el formato pedido en el archivo de tesis";}       
       if ($codigoerror == 99) {echo "Error: Problemas en el servidor, intente más tarde.";}
        
       echo "</div>";
       echo "</td>";
       echo "</tr>";
     
       echo "<tr>";
       echo "<td>";
       echo "<input type=\"button\" value=\"Volver\" onClick=\"volver()\"  style=\"font-size:12px;cursor:pointer;\">";
       echo "</td>";
       echo "</tr>";     	
	
      }
 
 ?>
  
 </tbody>
  
 </table>

</form>

<?php

    // Verifico que estén todos los datos 

    // echo "tesista_tipodoc: $tesista_tipodoc</br>";
    // echo "tesista_numerodoc: $tesista_numerodoc</br>";
    // echo "tesista_nombres: $tesista_nombres</br>";
    // echo "tesista_apellidos: $tesista_apellidos</br>";
    // echo "tesista_nombres_apellidos: $tesista_nombres_apellidos</br>";
    // echo "tesista_telefono: $tesista_telefono</br>";
    // echo "tesista_correoe: $tesista_correoe</br>";
    // echo "director_nombres: $director_nombres</br>";
    // echo "director_apellidos: $director_apellidos</br>";
    // echo "director_nombres_apellidos: $director_nombres_apellidos</br>";    
    // echo "director_telefono: $director_telefono</br>";  
    // echo "director_correoe: $director_correoe</br>";
    // echo "tesis_titulo: $tesis_titulo</br>";
    // echo "tesis_unidad_academica_id: $tesis_unidad_academica_id</br>";
    // echo "tesis_unidad_academica_nombre_corto: $tesis_unidad_academica_nombre_corto</br>";
    // echo "tesis_tipo_autorizacion_cod: $tesis_tipo_autorizacion_cod</br>";
    // echo "tesis_tipo_autorizacion_desc: $tesis_tipo_autorizacion_desc</br>";
    // echo "tesis_carrera_id: $tesis_carrera_id</br>"; 
    // echo "tesis_carrera_desc: $tesis_carrera_desc</br>";
    // echo "tesis_fecha_solicitud: $tesis_fecha_solicitud</br>";
    // echo "tesis_estado_publicacion: $tesis_estado_publicacion</br>";
    // echo "tesis_estado_publicacion_desc: $tesis_estado_publicacion_desc</br>";
    // echo "tesis_identificacion: $tesis_identificacion</br>";
    // echo "tesis_conformidad_director: $tesis_conformidad_director</br>";
    // echo "tesis_coordenada_uno: $tesis_coordenada_uno</br>";
    // echo "tesis_coordenada_dos: $tesis_coordenada_dos</br>";
    // echo "tamaño archivo tesis: ".$_FILES['pdftesis']['size']."</br>";
    // echo "código de error: $codigoerror</br>";
    // echo "ruta construida: $target_path";  
    
?>

</div>

 <div class= "piepagina"> 
 <?php require 'piepagina.html'; ?>
 </div>
 
</center>

</body>

</html>
