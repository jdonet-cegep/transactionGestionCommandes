<?php
try {
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'commandes_clients';


$conn = new PDO("mysql:host=$host;dbname=$database", $user, $password);

    // Définir le mode d'erreur PDO sur Exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch (PDOException $e) {
    echo "Erreur de connexion à la base de données : " . $e->getMessage();
}
?>
