<?php
  
  /* Controla y guarda archivos */

 if(isset($_FILES['fichaespaniol'])) 
    {
     if ($_FILES['fichaespaniol']['size'] > 40000)
        {$codigoerror = 30;}  // el archivo de la ficha en español es demasiado grande
    }
 else 

    {
    {$codigoerror = 37;}  // no se adjuntó el archivo de la ficha en español
    }

 if(isset($_FILES['fichaingles'])) 
    {
     if ($_FILES['fichaingles']['size'] > 40000)
        {$codigoerror = 31;}  // el archivo de la ficha en inglés es demasiado grande
    }
 else 

    { {$codigoerror = 38;} // no se adjuntó el archivo de la ficha en inglés
    }  
    
 if(isset($_FILES['pdftesis'])) 
    {     
     if ($_FILES['pdftesis']['size'] > 25165824)
        {$codigoerror = 32;}  // el archivo pdf de tesis es demasiado grande
     }

 else 

    {
    {$codigoerror = 39;}  // no se adjuntó el archivo pdf de tesis
    }
     
  // verificación de que el mime-type de los archivos adjuntos se corresponda con lo pedido

  if ( (mime_content_type($_FILES['fichaespaniol']['tmp_name']) !== 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')
     and (mime_content_type($_FILES['fichaespaniol']['tmp_name']) !== 'application/msword')
     and (mime_content_type($_FILES['fichaespaniol']['tmp_name']) !== 'application/vnd.oasis.opendocument.text'))
     {$codigoerror = 40;
      echo mime_content_type($_FILES['fichaespaniol']['tmp_name']);} // el tipo de archivo adjuntado no coincide con el formato pedido.

  if ( (mime_content_type($_FILES['fichaingles']['tmp_name']) !== 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')
     and (mime_content_type($_FILES['fichaingles']['tmp_name']) !== 'application/msword')
     and (mime_content_type($_FILES['fichaingles']['tmp_name']) !== 'application/vnd.oasis.opendocument.text'))
     {$codigoerror = 41;} // el tipo de archivo adjuntado no coincide con el formato pedido.

  if ( mime_content_type($_FILES['pdftesis']['tmp_name']) !== 'application/pdf')
     {$codigoerror = 42;} 

 
    /*
    $finfo = finfo_open(FILEINFO_MIME_TYPE);
    $mime = finfo_file($finfo, $_FILES['pdftesis']['tmp_name']);
    if ($mime !== 'application/pdf')
    {$codigoerror = 42;}
    finfo_close($finfo);
    */

  // $tesis_carpeta_ubicacion se va a usar para crear la carpeta donde se guarden todos los documentos del tesista
  
  date_default_timezone_set('America/Argentina/Buenos_Aires');

  // $tesista_apellidos =  strtolower($tesista_apellidos);

  // $tesista_apellidos = ucwords($tesista_apellidos);
 
  $tesis_carpeta_ubicacion = date('Y-m-d')."-".str_replace(' ','',$tesista_apellidos);

  // crea variable con la ruta para subir los archivos del autor

  $rutaservidor = $root = $_SERVER["DOCUMENT_ROOT"];
    
  $target_path = $rutaservidor."/".$rutapdfs.$tesis_carpeta_ubicacion;
  
    
  // crea directorio para los archivos de un lector  
 
  if ($codigoerror == 0)
   {     
     if (!file_exists($target_path))
      {
       mkdir($target_path, 0775, true);
      }
      
     else  // borra los archivos de los intentos de envíos anteriores 
     
         {
          $files = glob($target_path.'/*'); // se obtienen todos los nombres de los archivos viejos
          foreach($files as $file)
                 { 
                   if(is_file($file))
                   unlink($file); // elimina el archivo
                 }
         }            
   } 



  if ($codigoerror == 0)
   { 
   
     // Fecha en la que el tesista remitió el formulario
  
     date_default_timezone_set('America/Argentina/Buenos_Aires');
     $tesis_fecha_solicitud = date('Y-m-d H:i:s');
  
     // Creo el archivo de texto con la información (ficha del autor)
     $ficha = "Autor: ".$tesista_nombres_apellidos."\n\n";
     $ficha = $ficha."Teléfono: ".$tesista_telefono."\n\n";
     $ficha = $ficha."Correo: ".$tesista_correoe."\n\n";
     $ficha = $ficha."Director: ".$director_nombres_apellidos."\n\n";
     $ficha = $ficha."Teléfono: ".$director_telefono."\n\n";
     $ficha = $ficha."Correo: ".$director_correoe."\n\n";
     $ficha = $ficha."Carrera: ".$tesis_carrera_desc."\n\n";
     $ficha = $ficha."Título: ".$tesis_titulo."\n\n\n\n";
     $ficha = $ficha."Fecha de recepción: ".$tesis_fecha_solicitud."\n";
     $ficha = $ficha."TIPO DE AUTORIZACIÓN: ".$tesis_tipo_autorizacion_desc."\n";
 
     // Grabo la ficha en un archivo txt con los datos del tesista
            
     $archivo = fopen($target_path."/".str_replace(' ', '',$tesista_apellidos)."_Ficha.txt", "w");

     fwrite($archivo, $ficha);

     fclose($archivo);

   }
   
  // sube ficha catalográfica en español

 if ($codigoerror == 0)
   {
   
    $pathesp = $_FILES['fichaespaniol']['name'];
    $extesp = pathinfo($pathesp, PATHINFO_EXTENSION);
    $target_fichaespaniol = $target_path."/"."ficha_es_".str_replace(' ','',$tesista_apellidos).".".$extesp;
    
                                                   
    
    if(move_uploaded_file($_FILES['fichaespaniol']['tmp_name'], $target_fichaespaniol))
    
     { /* echo "El archivo ". basename( $_FILES['fichaespaniol']['name']). " ha sido subido"; */}

    else

     {$codigoerror = 34;} // error subida ficha catalográfica en español 
   }

   // sube ficha catalográfica en inglés
  
  if ($codigoerror == 0)
   {
    $pathing = $_FILES['fichaingles']['name']; 
    $exting = pathinfo($pathing, PATHINFO_EXTENSION);
    $target_fichaingles = $target_path."/"."ficha_en_".str_replace(' ', '',$tesista_apellidos).".".$exting;

    if(move_uploaded_file($_FILES['fichaingles']['tmp_name'], $target_fichaingles))

     {  /* echo "El archivo ". basename( $_FILES['fichaingles']['name']). " ha sido subido"; */}

    else

     {$codigoerror = 35;} // error subida ficha catalográfica en inglés 
   }

    // sube el archivo de tesis
  
  if ($codigoerror == 0)
   {
 
    // uso str_replace para borrar espacios en blanco de apellidos dobles
 
    $target_pdftesis = $target_path."/"."tesis_".str_replace(' ', '',$tesista_apellidos).".pdf";

    if(move_uploaded_file($_FILES['pdftesis']['tmp_name'], $target_pdftesis))

     {  /* echo "El archivo ". basename( $_FILES['fichaingles']['name']). " ha sido subido"; */}

    else

     {$codigoerror = 36;} // error subida archivo de tesis 
   }


?>
