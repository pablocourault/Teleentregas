<?php

  // Datos desde pasos anteriores
  
  $tesista_tipodoc = $_POST['tesista_tipodoc'];
  $tesista_numerodoc = $_POST['tesista_numerodoc'];
  $tesista_nombres = $_POST['tesista_nombres'];  
  $tesista_apellidos = $_POST['tesista_apellidos'];
  $tesista_nombres_apellidos = $_POST['tesista_nombres_apellidos'];
  $tesista_telefono = $_POST['tesista_telefono'];
  $tesista_correoe = $_POST['tesista_correoe'];
 
  $director_nombres = $_POST['director_nombres'];  
  $director_apellidos = $_POST['director_apellidos'];
  $director_nombres_apellidos = $_POST['director_nombres_apellidos'];  
  $director_telefono = $_POST['director_telefono'];  
  $director_correoe = $_POST['director_correoe'];
     
  $tesis_unidad_academica_id = $_POST['tesis_unidad_academica_id'];
  $tesis_unidad_academica_nombre_corto = $_POST['tesis_unidad_academica_nombre_corto'];
  $tesis_tipo_autorizacion_cod = $_POST['tesis_tipo_autorizacion_cod'];
  $tesis_tipo_autorizacion_desc = $_POST['tesis_tipo_autorizacion_desc'];
  $tesis_carpeta_ubicacion = $_POST['tesis_carpeta_ubicacion'];
  $tesis_carrera_id = $_POST['tesis_carrera_id'];
  $tesis_carrera_desc = $_POST['tesis_carrera_desc'];
  $tesis_titulo = $_POST['tesis_titulo'];
  $codigoerror = $_POST['codigoerror'];
   
  // Datos calculados en el presente paso
  
  // Conformidad del director
  
  // Confirmidad del director: P = Pendiente
  // Confirmidad del director: R = Rechaza
  // Confirmidad del director: C = Confirma
      
  $tesis_conformidad_director = "P";

  // Fecha en la que el tesista remitió el formulario
  
  date_default_timezone_set('America/Argentina/Buenos_Aires');
  $tesis_fecha_solicitud = date('Y-m-d H:i:s');
  
  // Estados de Publicación: R = Pendiente de revisión por el director
  // Estados de Publicación: P = Pendiente de publicación
  // Estados de Publicación: A = Publicada
  // Estados de Publicación: B = Publicada y archivos remitidos borrados (Se mantienen todos los datos)
  // Estados de Publicación: Z = Rechazada por el director (Se mantienen todos los datos)
  
  // NOTA: inicialmente no se va a realizar revisión del director, así que los dos estados serán "P" Pendiente o "A" Publicada
   
  $tesis_estado_publicacion = "P";
  $tesis_estado_publicacion_desc = "Pendiente";

   // se generan dos coordenadas aleatorias para enviar al director de tesis, las que deberá introducir para recuperar los datos
  
  $tesis_coordenada_uno = rand(10,99);
  $tesis_coordenada_dos = rand(10,99);

?>