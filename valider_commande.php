
<?php
// Inclure la configuration de la base de données
include('db_connection.php');


// Récupérer le code de la commande sélectionnée dans la requête GET
if (isset($_GET['commandeId'])) {
    $commande = $_GET['commandeId'];

//isoler les transactions

try {
    //débuter transaction

    // Sélectionner tous les articles de la commande
    $selectQuery = 'SELECT codepro, qtecde FROM ligne_commande WHERE codecde = :commande';
    $stmt = $conn->prepare($selectQuery);
    $stmt->bindParam(':commande', $commande);
    $stmt->execute();
    $articles = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $success = true;
    $insufficientStock = array();

    //Etape 1 : Changement du statut de la commande
    $updateStatut = 'UPDATE commande SET statutcde="validee" WHERE codecde = :codecde';
    $stmt = $conn->prepare($updateStatut);
    $stmt->bindParam(':codecde', $commande);
    $stmt->execute();

    // Étape 2 : Vérification du stock chaque article de la commande
    foreach ($articles as $article) {
        $codepro = $article['codepro'];
        $qtecde = $article['qtecde'];

        $selectStockQuery = 'SELECT stockpro FROM produit WHERE codepro = :codepro';
        $stmt = $conn->prepare($selectStockQuery);
        $stmt->bindParam(':codepro', $codepro);
        $stmt->execute();
        $stockData = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($stockData && $stockData['stockpro'] < $qtecde) {
            $success = false;
            $insufficientStock[] = $codepro;
        }
    }
    if($commande==="CDE001")
        sleep(5); // Ajouter un délai de 5 secondes pour la commande 1

    // Étape 3 : Si aucun article n'a de problème de stock, mise à jour du stock article par article
    if ($success) {
        foreach ($articles as $article) {
            $codepro = $article['codepro'];
            $qtecde = $article['qtecde'];

           // sleep(1); // Ajouter un délai d'une seconde entre chaque mise à jour de quantité
            $updateStockQuery = 'UPDATE produit SET stockpro = stockpro - :qtecde WHERE codepro = :codepro';
            $stmt = $conn->prepare($updateStockQuery);
            $stmt->bindParam(':codepro', $codepro);
            $stmt->bindParam(':qtecde', $qtecde);
            $stmt->execute();
        }
        $response = array('message' =>'Commande validée avec succès !');
        echo json_encode($response);
        //valider la transaction
        

    } else {
        //annuler la transaction

        $insufficientStockMessage = 'Stock insuffisant pour les articles : ' . implode(', ', $insufficientStock);
        $response = array('message' => $insufficientStockMessage);
        echo json_encode($response);

    }
    } catch (PDOException $e) {
        //annuler la transaction

        // En cas d'erreur, affichez l'erreur
        $response = array('message' => 'Erreur : ' . $e->getMessage());
        echo json_encode($response);
    }
} else {
    $response = array('message' => 'Commande non spécifiée.');
    echo json_encode($response);
}
?>
