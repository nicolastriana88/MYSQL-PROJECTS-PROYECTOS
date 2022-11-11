<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conexion</title>
</head>
<body>
<?php
$instruments_sound = mysqli_connect("localhost", "root", "", "instruments_sound") or
die("Problemas con la conexión");

mysqli_query($instruments_sound, "insert into usuarios(identificacion,correo,nombre,apellidos,contraseña,estado,rol) values
                        ($_REQUEST[identificacion],'$_REQUEST[correo]','$_REQUEST[nombre]','$_REQUEST[apellidos]','$_REQUEST[contraseña]','$_REQUEST[estado]',$_REQUEST[rol])")
or die("Problemas en el select" . mysqli_error($instruments_sound));

mysqli_close($instruments_sound);

echo "Los datos fueron guardados ";
?>
</body>
</html>