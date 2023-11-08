<?php
    // Configuration de la connexion à la base de données
    include('db_connection.php');
    // Sélectionner tous les produits de la table "produit"
    $selectQuery = 'SELECT * FROM commande';
    
    $stmt = $conn->prepare($selectQuery);
    $stmt->execute();
    
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Fermer la connexion PDO
    $conn = null;
    
    // Renvoyer la liste des produits au format JSON
    header('Content-Type: application/json');
    echo json_encode($products);

