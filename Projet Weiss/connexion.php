<?php
    $serveur = "localhost";
    $utilisateur = "root";
    $mot_de_passe = "root";
    $base_de_donnees = "openeduc";

    $connexion = mysqli_connect($serveur, $utilisateur, $mot_de_passe, $base_de_donnees);
    // Vérification de la connexion
    if (!$connexion) {
        die("La connexion à la base de données a échoué : " . mysqli_connect_error());
    }else{
        
    }
?>