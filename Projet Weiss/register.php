<?php
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OpenEduc - Inscription</title>
    <!-- Inclure vos styles CSS ici -->
    <link href="style.css" rel="stylesheet"></link>
    <!-- <link rel="stylesheet" href="styles.css"> -->
</head>
<body>
<?php include('header.php')?>

    <main>
        <form action="register.php" method="post">
            <label for="username">Nom d'utilisateur :</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Mot de passe :</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">S'inscrire</button>
        </form>
    </main>

    <?php include('footer.php')?>
</body>
</html>
