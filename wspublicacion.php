<?php

header("Content-Type: application/json; charset=UTF-8");

 /*  Para usarlo por CLI
     php wspublicaciontesis.php tipodoc=1 numerodoc=45878898
     Para usarlo desde una URL: http://url/wspublicacion.php?tipodoc=1&numerodoc=45878898
     Devuelve el estado de publicación de la tesis digital, que puede ser: "Pendiente" o "Publicada"  */


/* pasa los parámetros para el caso que se utilice la línea de comandos */

if(isset($argc))
  { parse_str(implode('&',array_slice($argv, 1)), $_GET); }


/* pasa los parámetros desde url, requiere el tipo de dococumento y el número */

if(isset( $_GET['tipodoc'] ) )
  {$tesista_tipodoc = $_GET['tipodoc'];}

if(isset( $_GET['numerodoc'] ) )  
  {$tesista_numerodoc = $_GET['numerodoc'];}
 
 
  /* consulta sql */ 
  
  // cargo los datos de conexion
  
  include ("configuracion.php"); 
    
  // se establece conexion con PostgreSQL

   $link = pg_connect("host=$servidor port=$puerto dbname=$basedatos user=$usuario password=$password");

   if (!$link) die('No se puede conectar a : ' . pg_last_error());
  
   $consulta = "SELECT tesis_estado_publicacion_desc 
                  FROM teleentregas.tesisdigitales 
                 WHERE tesista_tipodoc = $tesista_tipodoc
                   AND tesista_numerodoc = '$tesista_numerodoc'";

  			$resultado = pg_query($link, $consulta) or die ('Error: no se pudo hacer la consulta'.pg_last_error());

  			$cantidadfilas = pg_numrows($resultado);

			if ($cantidadfilas == 0 )
			   {
	                    $publicada->publicada = "false";	
			    $publicacion = json_encode($publicada);
     			    echo $publicacion;
			   }

			else
	   		   {
                            $publicada->publicada = "true";	
			    $publicacion = json_encode($publicada);
     			    echo $publicacion;             	 		  
	 		   } 	
	 						
			pg_free_result($resultado);
			
			// Cierra la conexión	
            pg_close($link);

?>
