<?php

// Datos de conexión

    $servidor = "localhost";
    $puerto = "5432";
    $usuario = "postgres";
    $password = "postgres";
    $schema = "teleentregas";
    $basedatos ="teleentregas";
    
// Directorio raíz del sistema

   $directorioinicio = "entregas/";

// Directorio almacenamiento tesis

    $rutapdfs = "entregas/archivos/";
    
// Dirección de correo administrador de trabajos
   // la dirección donde tienen que llegar las alertas de nuevos trabajos y
   // los avisos de revisión del profesor de trabajos

   $correo_administracion = "pcourault@unl.edu.ar";
   
// Dirección de correo remitente del sistema de recepción de trabajos
   // (la dirección que les va a aparecer al autor y el profesor)
   // y la dirección desde donde se hace la comunicación con ambos

   $correo_comunicacion = "pcourault@unl.edu.ar";
   
 // Datos del remitente
 
   $datos_remitente = "Biblioteca Virtual UNL";
   
   $correo_remitente = "pcourault@unl.edu.ar";
?>
