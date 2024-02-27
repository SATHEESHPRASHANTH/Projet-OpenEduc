<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OpenEduc - Accueil</title>
    <link href="style.css" rel="stylesheet"></link>
    <!-- Inclure vos styles CSS ici -->
    <!-- <link rel="stylesheet" href="styles.css"> -->
</head>
<?php include('header.php')?>
<body>
    <main>
        <section>
            <a href="connexion.php"><h1>Test Dev</h1></a>
            <h2>À propos de nous</h2>
            <p>OpenEduc facilite la collecte d'informations sur les écoles, permettant une participation active de l'APEA.</p>
        </section>

        <section>
            <h2>Fonctionnalités principales</h2>
            <ul>
                <li>Collecte en ligne des informations sur les écoles</li>
                <li>Accès sécurisé pour les référents locaux et le secrétaire général</li>
                <li>Historique des saisies pour la traçabilité</li>
                <li>Affichage public des informations par école</li>
            </ul>
        </section>
        <section>
            <h2>Commencez dès maintenant</h2>
            <p>Connectez-vous pour accéder à votre espace personnel ou inscrivez-vous si vous êtes nouveau.</p>
            <button><a href="login.php">Connexion</a></button>
            <button><a href="register.php">Inscription</a></button>
        </section>
    </main>
</body>
<?php include('footer.php')?>
</html>
