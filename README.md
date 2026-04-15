https://kasugimi.lovestoblog.com/Perpustakaan/public/index.php?page=login
______________
admin : bintang
pw :2006
______________
user. :keylla
pw :2008
______________
koneksi
<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "db_perpus_b";

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}
_______________________________________
