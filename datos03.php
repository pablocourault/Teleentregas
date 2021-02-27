<?php

// cargo los datos de conexion
 
require 'configuracion.php'; 

// Datos del Formulario Pasos 1-2
    
  if(isset($_POST['tesista_tipodoc'])) 
    { $tesista_tipodoc = filter_var($_POST['tesista_tipodoc'], FILTER_SANITIZE_STRING); }
    
  if(isset($_POST['tesista_numerodoc'])) 
    { $tesista_numerodoc = filter_var($_POST['tesista_numerodoc'], FILTER_SANITIZE_STRING); }  
   
  if(isset($_POST['tesista_nombres'])) 
    { $tesista_nombres = filter_var($_POST['tesista_nombres'], FILTER_SANITIZE_STRING); } 

  if(isset($_POST['tesista_apellidos'])) 
    { $tesista_apellidos = filter_var($_POST['tesista_apellidos'], FILTER_SANITIZE_STRING); } 

  if(isset($_POST['tesista_telefono'])) 
    { $tesista_telefono = filter_var($_POST['tesista_telefono'], FILTER_SANITIZE_STRING); }     

  if(isset($_POST['tesista_correoe'])) 
    { $tesista_correoe = filter_var($_POST['tesista_correoe'], FILTER_SANITIZE_EMAIL); } 

  if(isset($_POST['director_nombres'])) 
    { $director_nombres = filter_var($_POST['director_nombres'], FILTER_SANITIZE_STRING); } 

  if(isset($_POST['director_apellidos'])) 
    { $director_apellidos = filter_var($_POST['director_apellidos'], FILTER_SANITIZE_STRING); } 

  if(isset($_POST['director_telefono'])) 
    { $director_telefono = filter_var($_POST['director_telefono'], FILTER_SANITIZE_STRING); } 

  if(isset($_POST['director_correoe'])) 
    { $director_correoe = filter_var($_POST['director_correoe'], FILTER_SANITIZE_EMAIL); }

  if(isset($_POST['tesis_titulo'])) 
    { $tesis_titulo = filter_var($_POST['tesis_titulo'], FILTER_SANITIZE_STRING); } 

  $tesis_unidad_academica_id = $_POST['tesis_unidad_academica_id'];  
  $tesis_carrera_id = $_POST['tesis_carrera_id'];
  $tesis_tipo_autorizacion_cod = $_POST['tesis_tipo_autorizacion_cod'];

  $formulario_id1 = $_POST['formulario_id1'];
  $formulario_id2 = $_POST['formulario_id2'];
 
  $codigoerror = $_POST['codigoerror'];
  
  
  // Datos calculados 

  $tesista_nombres_apellidos = $tesista_nombres." ".$tesista_apellidos;
  
  $director_nombres_apellidos = $director_nombres." ".$director_apellidos;


  // verificaciones sobre los datos del formulario
  
  if (strlen($tesista_numerodoc) < 6) // el número de documento es demasiado corto
     {$codigoerror = 2;} 

  if (strlen($tesista_nombres_apellidos) < 6) // los datos de nombres y apellidos del autor podrían estar incompletos
     {$codigoerror = 3;}

  if (strlen($tesista_telefono) < 7) // el número de teléfono del autor está incompleto
     {$codigoerror = 4;}	

  if (!filter_var($tesista_correoe, FILTER_VALIDATE_EMAIL)) 
     {$codigoerror = 5;}
   
  if (strlen($director_nombres_apellidos) < 6) // los datos de nombres y apellidos del director podrían estar incompletos
     {$codigoerror = 6;} 
   
  if (strlen($director_telefono) < 7) // el número de teléfono del director está incompleto
     {$codigoerror = 7;} 
   
  if (!filter_var($director_correoe, FILTER_VALIDATE_EMAIL)) 
     {$codigoerror = 8;}
   
  if (strlen($tesis_titulo) < 24) // el título de la tesis podría estar incompleto
     {$codigoerror = 9;}  

  // Se dejóde controlar es n�mero de documento num�rico porque tuvimos casos de pasaportes alfanum�ricos  
  // if (!is_numeric($tesista_numerodoc)) {$codigoerror = 10;} // el número de documento debe contener solo números
 
  if ($tesista_correoe == $director_correoe) {$codigoerror = 11;} // el correo del autor y del director no pueden ser iguales 

 
  if (!$formulario_id1 == "FmID01") {$codigoerror = 12;} // los datos del formulario uno no provienen del formulario 

  if (!$formulario_id2 == "FmID02") {$codigoerror = 12;} // los datos del formulario dos no provienen del formulario 


  // Tipo de autorización de publicación (embargo o no)


  if (is_numeric($tesis_tipo_autorizacion_cod))

     {
      switch ($tesis_tipo_autorizacion_cod) 
           {
            case 1:
            $tesis_tipo_autorizacion_desc = "Autoriza la publicación";
            break;
            
            case 2:
            $tesis_tipo_autorizacion_desc = "Autoriza después de 1 (un) año";
            break;
            
            case 3:
            $tesis_tipo_autorizacion_desc = "Autoriza después de 2 (dos) años";
            break;
            
            case 4:
            $tesis_tipo_autorizacion_desc = "NO autoriza la publicación";
            break;     
          }    
     } 

else {
        $codigoerror = 13;  // no se eligi� un tipo de autorizaci�n para la tesis
     }

    // Nombre de la Carrrera y nombre corto de la Unidad Académica
   
  // se establece conexion con PostgreSQL

   $link = pg_connect("host=$servidor port=$puerto dbname=$basedatos user=$usuario password=$password");

   if (!$link) die('No se puede conectar a : ' . pg_last_error());
  
   $consulta = "SELECT nombre FROM teleentregas.carreras WHERE codigo = $tesis_carrera_id";

  			$resultado = pg_query($link, $consulta) or die ('Error: no se pudo hacer la consulta del nombre de carrera'.pg_last_error());

  			$cantidadfilas = pg_numrows($resultado);

			if ($cantidadfilas == 0 )
				{
	 			$codigoerror = 1;
				}
			else
	   			{             	 
            	 while ($row = pg_fetch_row($resultado)) 
              		{
               		$tesis_carrera_desc = $row[0];
              		}	
              	}	
	 				 			
			pg_free_result($resultado);

                        $consulta2 = "SELECT nombre_corto FROM teleentregas.uacademi WHERE codigo = $tesis_unidad_academica_id";

  			$resultado2 = pg_query($link, $consulta2) or die ('La consulta fallo : ' . pg_last_error());

  			$cantidadfilas2 = pg_numrows($resultado2);

			if ($cantidadfilas2 == 0 )
				{
	 			$codigoerror = 1;
				}
			else
	   			{             	 
            	 while ($row = pg_fetch_row($resultado2)) 
              		{
               		$tesis_unidad_academica_nombre_corto = $row[0];
              		}	
              	}	
	 				 			
			pg_free_result($resultado2);
			
			// Cierra la conexión	
            pg_close($link);

?>
