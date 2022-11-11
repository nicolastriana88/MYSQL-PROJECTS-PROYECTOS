<html>
<head>
<title>Resultado Busqueda</title>
</head>
<body>
<?php
$instruments_sound = mysqli_connect("localhost", "root", "", "instruments_sound") or
die("Problemas con la conexión");
$registros = mysqli_query($instruments_sound, "select
identificacion,correo,nombre,apellidos,contraseña,estado,rol
from usuarios where identificacion=$_REQUEST[identificacion]") or
die("Problemas en el select:" . mysqli_error($instruments_sound));
if ($reg = mysqli_fetch_array($registros)) {
echo "correo:" . $reg['correo'] . "<br>";
echo "nombre:" . $reg['nombre'] . "<br>";
echo "apellidos:" . $reg['apellidos'] . "<br>";
echo "contraseña:" . $reg['contraseña'] . "<br>";
echo "estado:" . $reg['estado'] . "<br>";
echo "rol:" . $reg['rol'] . "<br>";
}
 else
{
echo "No existe un Usuario con esa identificacion.";
}
mysqli_close($instruments_sound);
?>
</body>
</html>