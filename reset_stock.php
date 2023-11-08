<?php
// Inclure la configuration de la base de données
include('db_connection.php');


try {

    //remettre le statut de toutes les commandes à passee
    $updateStatut = 'UPDATE commande SET statutcde="passee"';
    $stmt = $conn->prepare($updateStatut);
    $stmt->execute();

    // Réinitialisez les quantités en stock aux valeurs spécifiées
    $resetQuery = "
        UPDATE produit
        SET stockpro = CASE
            WHEN codepro = 1 THEN 5
            WHEN codepro = 2 THEN 35
            WHEN codepro = 3 THEN 29
            WHEN codepro = 4 THEN 37
            WHEN codepro = 5 THEN 50
            WHEN codepro = 9 THEN 61
        END
    ";

    $stmt = $conn->prepare($resetQuery);
    $stmt->execute();

    echo "Les quantités en stock ont été réinitialisées avec succès.";

} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}

// Fermez la connexion PDO
$conn = null;
?>
