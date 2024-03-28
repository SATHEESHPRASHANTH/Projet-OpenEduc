<?php include('header.php')?>
<?php
include('connexion.php');

// Vérification de la connexion
if ($connexion->connect_error) {
    die("Échec de la connexion : " . $connexion->connect_error);
}

// Ajout d'une action
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['ajouterButton'])) {
    // Récupérer les valeurs du formulaire
    $nomEvenement = $_POST["nomEvenement"];
    $description = $_POST["description"];

    // Construction de la requête SQL
    $sql = "INSERT INTO evenement (nom_evenement, description)
            VALUES ('$nomEvenement', '$description')";

    // Exécuter la requête
    if ($connexion->query($sql) === TRUE) {
        echo "L'action a été ajoutée avec succès.";
    } else {
        echo "Erreur lors de l'ajout de l'action : " . $connexion->error;
    }
}

// Suppression d'une action
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['supprimerButton'])) {
    // Assurez-vous que le champ nomAction est défini dans la requête POST
    if(isset($_POST['nomAction'])) {
        $nomAction = $_POST["nomAction"];
        // Construction de la requête SQL pour la suppression
        $sql = "DELETE FROM evenement WHERE nom_evenement = '$nomAction'";
        // Exécuter la requête
        if ($connexion->query($sql) === TRUE) {
            echo "L'action a été supprimée avec succès.";
        } else {
            echo "Erreur lors de la suppression de l'action : " . $connexion->error;
        } 
    } else {
        echo "Erreur : Champ 'nomAction' non défini dans la requête POST.";
    }
}

// Récupération des actions
$sql = "SELECT nom_evenement, description FROM evenement";
$result = $connexion->query($sql);

// Vérification s'il y a des résultats
if ($result->num_rows > 0) {
    // Initialisation de la variable pour stocker les résultats
    $actions = array();

    // Récupération des données et stockage dans la variable $actions
    while($row = $result->fetch_assoc()) {
        $actions[] = array($row["nom_evenement"], $row["description"]);
    }
} else {
    //echo '<p class="library-container">Aucune action trouvé.</p>';
}

// Fermeture de la connexion à la base de données
$connexion->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet"></link>
    <title>Nos actions</title>
    <style>
        /* Ajoutez le style spécifique au tableau ici */
        .library-container {
            width: 100%;
            margin: 20px auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .book {
            border: 2px solid #000;
            border-radius: 5px;
            margin-bottom: 20px;
            overflow: hidden;
            background-color: #f2f2f2;
            width: calc(33.33% - 20px); /* 3 éléments par ligne avec un espace de 20px entre eux */
            box-sizing: border-box;
        }

        .book-info {
            padding: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .book-title, .book-author {
            font-size: 18px;
            border: 1px solid #000;
            border-radius: 5px;
            padding: 5px;
            margin-top: 5px;
            text-align: center;
        }

        .book-details{
            text-align: center;
        }

        .book-author {
            font-style: italic;
            color: #555;
        }
        .custom-form {
            margin: 10px;
            padding: 15px;
            display: flex;
            flex-direction: column;
            /* Ajoutez d'autres styles personnalisés si nécessaire */
        }

        .edit-title {
            text-align: center;
        }

        .edit-button {
            display: flex;
            justify-content: center;
            display: block; /* Afficher le bouton en tant que bloc */
            margin: 0 auto; /* Marges automatiques à gauche et à droite pour centrer le bouton horizontalement */
            width: 150px; /* Définir une largeur fixe pour le bouton */
            /* Ajoutez d'autres styles personnalisés si nécessaire */
        }
    </style>
</head>
<body>
    <div>
        <main>
        <h1 class ='titre'>Nos actions</h1>
            <div class="library-container">
                <?php
                // Affichage des actions
                if (!empty($actions)) {
                    foreach ($actions as $action) {
                        echo '<div class="book">';
                        echo '<div class="book-info">';
                        echo '<div class="book-title">' . $action[0] . '</div>';
                        echo '<div class="book-details">Description: ' . $action[1] . '</div>';
                        echo '</div>';
                        echo '</div>';
                    }
                } else {
                    echo '<p class="library-container">Aucune action trouvé.</p>';
                }
                ?>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
            </div>
        </main>
    </div>
    <?php
    if($user_role==6){
        echo'<div class="modif">';
        echo'<main>';
        echo'<h2 class="edit-title">Édition du contenu</h2>';
        echo'<div class="edit-container">';
        echo'<form class="custom-form" action="" method="post">';
        echo"<h3>Ajout d'action:</h3>";
        echo"Nom de l'action : <input type='text' class='edit-input' name='nomEvenement'><br>";
        echo"Description de l'action : <input type='text' class='edit-input' name='description'>";
        echo'<button type="submit" name="ajouterButton" class="edit-button">Ajouter</button>';
        echo'</form>';
        echo'</div>';
        echo'<div class="edit-container">';
        echo'<form class="custom-form" action="" method="post">';
        echo"<h3>Suppression d'action</h3>";
        echo"Nom de l'action : <input type='text' class='edit-input' name='nomAction'><br>";
        echo'<button type="submit" name="supprimerButton" class="edit-button">Supprimer</button>';
        echo'</form>';
        echo'</div>';
        echo'</main>';
        echo'</div>';
    };
    ?>
</body>
<?php include('footer.php')?>
</html>
