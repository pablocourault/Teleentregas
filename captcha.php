<?php 

session_start();

// lista de caracteres aceptados en el captcha para evitar confusiones entre números y letras parecidas

$caracteres_permitidos = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

// genera cadena aleatoria de caracteres
  
function genera_cadena($entrada, $longitud = 5) 
         {
          $tamanio_entrada = strlen($entrada);
          $cadena_aleatoria = '';
          
          for($i = 0; $i < $longitud; $i++)
             {
              $caracter_aleatorio = $entrada[mt_rand(0, $tamanio_entrada - 1)];
              $cadena_aleatoria .= $caracter_aleatorio;
             }
  
          return $cadena_aleatoria;
                 
         }



// Imágen del fondo del captcha

// tamaño en píxeles de la imagen de fondo 

$imagen = imagecreatetruecolor(200, 50);
 
imageantialias($imagen, true);
 
$colores = [];
 
// valores areatorios para los colores rojo, verde y azul

$rojo = rand(125, 175);
$verde = rand(125, 175);
$azul = rand(125, 175);
 
// se utilizan 5 colores diferentes para el fondo, almacenados de más claro a más oscuro 

for($i = 0; $i < 5; $i++) 
   {
    $colores[] = imagecolorallocate($imagen, $rojo - 20*$i, $verde - 20*$i, $azul - 20*$i);
   }
 
imagefill($imagen, 0, 0, $colores[0]);

// crea sombras de colores progresivamente más oscuros del color original 

for($i = 0; $i < 10; $i++) 
   {

  // crea rectángulos de 2 a 10 píxeles de grosor
  
  imagesetthickness($imagen, rand(2, 10));
  $rect_color = $colores[rand(1, 4)];
  imagerectangle($imagen, rand(-10, 190), rand(-10, 10), rand(-10, 190), rand(40, 60), $rect_color);

  }

$amarillo = imagecolorallocate($imagen, 255, 255, 0);
$blanco = imagecolorallocate($imagen, 255, 255, 255);
$textcolors = [$amarillo, $blanco];
 
// genero un listado de fuentes para que las letras tengan también una tipografía aleatoria 
 
$fuentes = ['fuentes/roboto/roboto-medium.ttf','fuentes/roboto/roboto-bold.ttf','fuentes/opensans/opensans-regular.ttf','fuentes/opensans/opensans-italic.ttf'];

 
$longitud_cadena = 6;
$cadena_captcha = genera_cadena($caracteres_permitidos, $longitud_cadena);
 
$_SESSION['texto_captcha'] = $cadena_captcha;
 
for($i = 0; $i < $longitud_cadena; $i++) {
  $letter_space = 180/$longitud_cadena;
  $initial = 16;
  
  // se hace una rotación al azar de las letras y se deja un relleno de 16 píxeles a ambos lados de la imagen
  // el espacio restante de 180 píxeles se divide en partes iguales para cada letra
//   error_log("fuentes INI: ".$fuentes[array_rand($fuentes)]." FIN fuentes.");
  imagettftext($imagen, 24, rand(-16, 16), $initial + $i*$letter_space, rand(25, 45), $textcolors[rand(0, 1)], realpath($fuentes[array_rand($fuentes)]), $cadena_captcha[$i]);
//  imagettftext($imagen, 24, rand(-16, 16), $initial + $i*$letter_space, rand(25, 45), $textcolors[rand(0, 1)], realpath('fuentes/opensans/opensans-regular.ttf'), $cadena_captcha[$i]);
}
 
header('Content-type: image/png');
imagepng($imagen);
imagedestroy($imagen);
  
?>
