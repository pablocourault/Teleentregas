<?php

// Datos de conexi�n

    $servidor = "localhost";
    $puerto = "5432";
    $usuario = "postgres";
    $password = "postgres";
    $schema = "teleentregas";
    $basedatos ="teleentregas";
    
// Directorio ra�z del sistema

   $directorioinicio = "entregas/";

// Directorio almacenamiento tesis

    $rutapdfs = "entregas/archivos/";
    
// Direcci�n de correo administrador de trabajos
   // la direcci�n donde tienen que llegar las alertas de nuevos trabajos y
   // los avisos de revisi�n del profesor de trabajos

   $correo_administracion = "pcourault@unl.edu.ar";
   
// Direcci�n de correo remitente del sistema de recepci�n de trabajos
   // (la direcci�n que les va a aparecer al autor y el profesor)
   // y la direcci�n desde donde se hace la comunicaci�n con ambos

   $correo_comunicacion = "pcourault@unl.edu.ar";
   
 // Datos del remitente
 
   $datos_remitente = "Biblioteca Virtual UNL";
   
   $correo_remitente = "pcourault@unl.edu.ar";
?>
