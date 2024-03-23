<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OpenEduc - Tableau de bord</title>
    <link href="style.css" rel="stylesheet">
    <style>
        /* Ajoutez le style spécifique aux événements ici */
        .event-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        
        .event {
            border: 2px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
            width: 30%; /* Ajustez la largeur en fonction de vos besoins */
            box-sizing: border-box;
            background-color: #f9f9f9;
        }
        
        .event h3 {
            margin-top: 0;
        }
        
        .event p {
            margin-bottom: 5px;
        }
    </style>
</head>
<?php include('header.php');?>
<body>
    <a href="profil.php">Modifier mon profil</a>

    <h2>Événements</h2>
    <?php
    // Inclure le fichier de connexion à la base de données
    include('connexion.php');

    // Vérifier la connexion à la base de données
    if ($connexion->connect_error) {
        die("Échec de la connexion : " . $connexion->connect_error);
    }

    // Vérifier si $user_school est NULL
    if ($user_school == NULL) {
        echo "<p>Vous n'avez pas d'école, vous ne pouvez voir d'évènement.</p>";
    } else {
        // Récupérer les événements depuis la base de données
        $get_events_query = "SELECT nom_evenement, description 
                     FROM evenement 
                     WHERE id_evenement = (SELECT id_evenement 
                                            FROM etablissement 
                                            WHERE id_etablissement = $user_school)";
        $events_result = $connexion->query($get_events_query);

        // Vérifier s'il y a des événements à afficher
        if ($events_result->num_rows > 0) {
            // Parcourir chaque événement et afficher ses détails
            echo '<div class="event-container">';
            while ($event = $events_result->fetch_assoc()) {
                echo '<div class="event">';
                echo '<h3>' . $event['nom_evenement'] . '</h3>';
                echo '<p>' . $event['description'] . '</p>';
                echo '</div>';
            }
            echo '</div>';
        } else {
            echo '<p>Aucun événement à afficher pour le moment.</p>';
        }
    }

    // Fermer la connexion à la base de données
    $connexion->close();
    ?>
</body>
<?php include('footer.php');?>
</html>
