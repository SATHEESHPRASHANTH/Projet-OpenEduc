<?php include('header.php')?>
<?php
include('connexion.php');

// Vérification de la connexion
if ($connexion->connect_error) {
    die("Échec de la connexion : " . $connexion->connect_error);
}

// Ajout d'une école
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['ajouterButton'])) {
    $nomEcole = $_POST["nomEcole"];
    $nombreClasses = $_POST["nombreClasses"];
    $adresse = $_POST["adresse"];
    $codePostal = $_POST["codePostal"];
    $numeroTelephone = $_POST["numeroTelephone"];
    $adresseEmail = $_POST["adresseEmail"];
    $event = $_POST["event"];

    $sql = "INSERT INTO etablissement (nomEtablissement ,nbClasse, adresse, codePostale,NumTel,Email,id_evenement) 
            VALUES (?, ?, ?, ?, ?, ?, ?)";

    $stmt = $connexion->prepare($sql);
    $stmt->bind_param("sssssss", $nomEcole, $nombreClasses, $adresse, $codePostal, $numeroTelephone, $adresseEmail,$event);
    if ($stmt->execute()) {
        echo "L'école a été ajoutée avec succès.";
    } else {
        echo "Erreur lors de l'ajout de l'école : " . $connexion->error;
    }
}

// Suppression d'une école
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['supprimerButton'])) {
    if(isset($_POST['nomEcoleSup'])) {
        $nomEcoleSup = $_POST["nomEcoleSup"];
        $sql = "DELETE FROM etablissement WHERE nomEtablissement = ?";
        $stmt = $connexion->prepare($sql);
        $stmt->bind_param("s", $nomEcoleSup);
        if ($stmt->execute()) {
            echo "L'école a été supprimée avec succès.";
        } else {
            echo "Erreur lors de la suppression de l'école : " . $connexion->error;
        } 
    } else {
        echo "Erreur : Champ 'nomEcoleSup' non défini dans la requête POST.";
    }
}

// Récupération des établissements
$sql = "SELECT nomEtablissement,adresse,codePostale,numTel,email,id_etablissement FROM etablissement";
$result = $connexion->query($sql);

// Vérification s'il y a des résultats
if ($result->num_rows > 0) {
    // Initialisation de la variable pour stocker les résultats
    $etablissements = array();

    // Récupération des données et stockage dans la variable $etablissements
    while($row = $result->fetch_assoc()) {
        $etablissements[] = array($row["nomEtablissement"], $row["adresse"],$row["codePostale"],$row["numTel"],$row["email"], 'bla');
    }
} else {
    //echo '<p class="library-container">Aucun établissement trouvé.</p>';
}

// Fermeture de la connexion à la base de données
$connexion->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet">
    <title>Nos écoles</title>
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
        <h1 class ='titre'>Nos écoles</h1>
            <div class="library-container">
                <?php
                // Affichage des actions
                if (!empty($etablissements)) {
                    echo '<div class="library-container" id="tableau">';
                    foreach ($etablissements as $etablissement) {
                        echo '<div class="book">';
                        echo '<div class="book-info">';
                        echo '<div class="book-title">' . $etablissement[0] . '</div>';
                        echo '<div class="book-details">Adresse: ' . $etablissement[1] . '</div>';
                        echo '<div class="book-details">Code Postal: ' . $etablissement[2] . '</div>';
                        echo '<div class="book-details">Téléphone: ' . $etablissement[3] . '</div>';
                        echo '<div class="book-details">Email: ' . $etablissement[4] . '</div>';
                        echo '</div>';
                        echo '</div>';
                    }
                    echo '</div>';
                } else {
                    echo '<p class="library-container">Aucun établissement trouvé.</p>';
                }
                ?>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
            </div>
        </main>
    </div>
    <div>
                <?php
                // Affichage de la section d'édition uniquement si le rôle de l'utilisateur est égal à 1
                if ($user_role == 6) {
                    echo'<main>';
                    echo'<div class="modif">';
                    echo '<h2 class="edit-title">Édition du contenu</h2>';
                    echo '<div class="edit-container">';
                    echo '<form class="custom-form" action="" method="post">';
                    echo '<h3>Ajout d\'école :</h3>';
                    echo 'Nom de l\'école : <input type="text" class="edit-input" name="nomEcole"><br>';
                    echo 'Nombre de classe : <input type="text" class="edit-input" name="nombreClasses"><br>';
                    echo 'Adresse : <input type="text" class="edit-input" name="adresse"><br>';
                    echo 'Code postal : <input type="text" class="edit-input" name="codePostal"><br>';
                    echo 'Numéro de téléphone : <input type="text" class="edit-input" name="numeroTelephone"><br>';
                    echo 'Adresse émail : <input type="text" class="edit-input" name="adresseEmail"><br>';
                    echo 'code évènement : <input type="text" class="edit-input" name="event"><br>';
                    echo '<button type="submit" name="ajouterButton" class="edit-button">Ajouter</button>';
                    echo '</form>';
                    echo '</div>';
                    echo '<div class="edit-container">';
                    echo '<form class="custom-form" action="" method="post">';
                    echo '<h3>Suppression d\'école</h3>';
                    echo 'Nom de l\'école : <input type="text" class="edit-input" name="nomEcoleSup"><br>';
                    echo '<button type="submit" name="supprimerButton" class="edit-button">Supprimer</button>';
                    echo '</form>';
                    echo '</div>';
                    echo '</div>';
                    echo'</main>';
                }
                ?>
        </main>
    </div>
    <?php include('footer.php')?>
</body>
</html>
