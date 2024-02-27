<?php
// Vérifie si le formulaire a été soumis
//if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Connexion à la base de données (remplacez ces valeurs par les vôtres)
    $serveur = "localhost";
    $utilisateur = "root";
    $mot_de_passe = "root";
    $base_de_donnees = "openeduc";

    $connexion = mysqli_connect($serveur, $utilisateur, $mot_de_passe, $base_de_donnees);
    // Vérification de la connexion
    if (!$connexion) {
        die("La connexion à la base de données a échoué : " . mysqli_connect_error());
    }else{
        echo('la base est connectée successfully');
    }

    // Récupération des données du formulaire
    //$nom_utilisateur = $_POST["nom_utilisateur"];
    //$mot_de_passe = $_POST["mot_de_passe"];

    // Requête SQL pour vérifier l'existence de l'utilisateur
    //$requete = "SELECT id FROM utilisateurs WHERE nom_utilisateur = '$nom_utilisateur' AND mot_de_passe = '$mot_de_passe'";
    //$resultat = mysqli_query($connexion, $requete);

    // Vérification des résultats
    //if (mysqli_num_rows($resultat) == 1) {
        //echo "Connexion réussie !"; // Vous pouvez rediriger l'utilisateur vers une autre page ici
    //} else {
        //echo "Nom d'utilisateur ou mot de passe incorrect.";
    //}

    // Fermeture de la connexion
    //mysqli_close($connexion);
//}
?>