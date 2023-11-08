document.addEventListener('DOMContentLoaded', function () {
    const selectCommande = document.getElementById('selectCommande');
    const validerCommande = document.getElementById('validerCommande');
    const resultatValidation = document.getElementById('resultatValidation');
    const resetStockButton = document.getElementById('resetStockButton');

    resetStockButton.addEventListener('click', function () {
        fetch('reset_stock.php')
            .then(response => response.text())
            .then(data => {
                alert(data); // Affiche un message pour indiquer que la réinitialisation a réussi
            })
            .catch(error => {
                console.error('Erreur lors de la réinitialisation des quantités en stock :', error);
            });
    });

    // Appel à getCommandes.php pour récupérer la liste des commandes
    fetch('getCommandes.php')
        .then(response => response.json())
        .then(data => {
            const commandeList = document.getElementById('selectCommande');

            // Parcourir la liste des commandes et créer un élément <option> pour chaque commande
            data.forEach(commande => {
                const optionItem = document.createElement('option');
                optionItem.value = commande.codecde;
                optionItem.textContent = `Code : ${commande.codecde}, Date : ${commande.datecde}, Client : ${commande.codecli}`;
                
                // Ajouter l'élément <option> à la liste déroulante commandeList
                commandeList.appendChild(optionItem);
            });
        })
        .catch(error => {
            console.error('Impossible de récupérer la liste des commandes :', error);
        });

    validerCommande.addEventListener('click', function () {
        const commandeId = selectCommande.value;

        if (commandeId) {
            validerCommande.setAttribute('disabled', 'true');

            // Ici, vous pouvez appeler un fichier PHP qui exécute la validation de la commande
            // Assurez-vous que le fichier PHP prend en charge la validation de la commande
            // et la décrémentation des stocks d'articles un par un avec un délai entre chaque article
            fetch(`valider_commande.php?commandeId=${commandeId}`)
            .then(response => response.json())
            .then(data => {
                resultatValidation.innerText = data.message;
                validerCommande.removeAttribute('disabled');

            })
            .catch(error => {
                console.error('Erreur :', error);
            });
        
        }
    });
});
