<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OpenEduc - Accueil</title>
    <link href="style.css" rel="stylesheet"></link>
</head>
<?php 
    include('header.php');
?>
<body>
    <main>
        <section>
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
            <section>
    <h2>Commencez dès maintenant</h2>
    <?php if (isset($_SESSION['user_firstname'])) : ?>
        <!-- Bouton de déconnexion aligné à droite -->
        <form action="logout.php" method="post" class="logout-form">
        <button type="submit" name="logout">Déconnexion</button>
        <?php
        if($user_role==6){
        echo'<button><a href="register.php">Inscription</a></button>';
        };
        ?>
        </form>
    <?php else : ?>
        <!-- Boutons de connexion et d'inscription -->
        <form>
        <button><a href="login.php">Connexion</a></button>
    </form>
    <?php endif; ?>
</section>

    </main>
</body>
<?php include('footer.php')?>
</html>
