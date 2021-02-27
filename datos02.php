<?php

  // Datos del Formulario Paso 1 e inicializa variable de seguimiento de errores

  $tesista_tipodoc = $_POST['tesista_tipodoc'];
  $tesista_numerodoc = htmlspecialchars($_POST['tesista_numerodoc']);
  $tesista_nombres = htmlspecialchars($_POST['tesista_nombres']);
  $tesista_apellidos = htmlspecialchars($_POST['tesista_apellidos']);
  $tesista_telefono = htmlspecialchars($_POST['tesista_telefono']);
  $tesista_correoe = htmlspecialchars($_POST['tesista_correoe']);
  $director_nombres = htmlspecialchars($_POST['director_nombres']);
  $director_apellidos = htmlspecialchars($_POST['director_apellidos']);
  $director_telefono = htmlspecialchars($_POST['director_telefono']);  
  $director_correoe = htmlspecialchars($_POST['director_correoe']);
  $tesis_unidad_academica_id = $_POST['tesis_unidad_academica_id'];

  $tesista_apellidos = strtolower($tesista_apellidos);
  $tesista_apellidos = ucwords($tesista_apellidos);

  $tesista_nombres = strtolower($tesista_nombres);
  $tesista_nombres = ucwords($tesista_nombres);

  $director_nombres = strtolower($director_nombres);
  $director_nombres = ucwords($director_nombres);

  $director_apellidos = strtolower($director_apellidos);
  $director_apellidos = ucwords($director_apellidos);

  $formulario_id1 =  $_POST['formulario_id1'];

  $codigoerror = 0;

?>
