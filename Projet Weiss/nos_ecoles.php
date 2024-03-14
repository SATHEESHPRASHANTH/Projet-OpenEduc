<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet">
    <title>Document</title>
    <style>
        /* Ajoutez le style spécifique au tableau ici */
        .library-container {
            width: 80%;
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
        }

        .book-author {
            font-style: italic;
            color: #555;
        }

    </style>
</head>
<?php include('header.php')?>
<body>
    <div>
        <main>
<?php
include('connexion.php');

if ($connexion->connect_error) {
    die("Échec de la connexion : " . $connexion->connect_error);
}
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['ajouterButton'])) {
    // Récupérer les valeurs du formulaire
    $nombreAleatoire = rand(100000, 999999);
    $nomEcole = $_POST["nomEcole"];
    $nombreClasses = $_POST["nombreClasses"];
    $adresse = $_POST["adresse"];
    $codePostal = $_POST["codePostal"];
    $numeroTelephone = $_POST["numeroTelephone"];
    $adresseEmail = $_POST["adresseEmail"];
    // Construction de la requête SQL
    $sql = "INSERT INTO etablissement (nomEtablissement ,nbClasse, adresse, codePostale,NumTel,Email,id_evenement) 
            VALUES ('$nomEcole', '$nombreClasses', '$adresse', '$codePostal', '$numeroTelephone', '$adresseEmail',1)";
    // Exécuter la requête
    if ($connexion->query($sql) === TRUE) {
        echo "L'école a été ajoutée avec succès.";
    } else {
        echo "Erreur lors de l'ajout de l'école : " . $connexion->error;
    }
    // Fermer la connexion à la base de données
    $connexion->close();
}
?>


<?php
// Connexion à la base de données
include('connexion.php');

// Vérification de la connexion
if ($connexion->connect_error) {
    die("Échec de la connexion : " . $connexion->connect_error);
}

// Construction de la requête SQL pour récupérer les établissements
$sql = "SELECT nomEtablissement,adresse,codePostale,numTel,email FROM etablissement";

// Exécution de la requête SQL
$result = $connexion->query($sql);

// Vérification s'il y a des résultats
if ($result->num_rows > 0) {
    // Initialisation de la variable pour stocker les résultats
    $etablissements = array();

    // Récupération des données et stockage dans la variable $etablissements
    while($row = $result->fetch_assoc()) {
        $etablissements[] = array($row["nomEtablissement"], $row["adresse"],$row["codePostale"],$row["numTel"],$row["email"]);
    }

    // Affichage des résultats dans la section appropriée de votre HTML
    if (!empty($etablissements)) {
        echo '<div class="library-container">';
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
} else {
    echo '<p class="library-container">Aucun établissement trouvé.</p>';
}

// Fermeture de la connexion à la base de données
$connexion->close();
?>

        </main>
</div>
    <div class="modif">
        <main >
            <h2 class="edit-title">Édition du contenu</h2>
            <div class="edit-container">
            <form class="custom-form" action="" method="post">
            <h3>Ajout d'école :</h3>
            Nom de l'école : <input type="text" class="edit-input" name="nomEcole"></br/>
            Nombre de classe : <input type="text" class="edit-input" name="nombreClasses"></br>
            Adresse : <input type="text" class="edit-input" name="adresse"></br/>
            Code postal : <input type="text" class="edit-input" name="codePostal"></br>
            Numéro de téléphone : <input type="text" class="edit-input" name="numeroTelephone"></br/>
            Adresse émail : <input type="text" class="edit-input" name="adresseEmail"></br>
            code évènement : <input type="text" class="edit-input" name="event"></br>
            <button type="submit" name="ajouterButton" class="edit-button">Ajouter</button>
            </form>
    </div>
<STYLE>
    .custom-form {
    /* Styles spécifiques pour le formulaire ici */
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
    /* Ajoutez d'autres styles personnalisés si nécessaire */
}

</style>
</br>
            <div class="edit-container">
                <h3>Suppression d'école</h3>
                nom de l'école : <input type="text" class="edit-input" ></br>
                <button class="edit-button">Supprimer</button>
            </div>
        </main>
    </div>

</body>
<?php include('footer.php')?>
</html>