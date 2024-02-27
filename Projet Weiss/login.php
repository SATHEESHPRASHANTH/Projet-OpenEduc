<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OpenEduc - Connexion</title>
    <link href="style.css" rel="stylesheet">
</head>
<body>
    <?php include('header.php')?>

    <main>
        <img src="https://i.ibb.co/hmdTYRG/new-login-image.png" alt="Login Image">

        <form action="login.php" method="post">
            <label for="username">Nom d'utilisateur :</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Mot de passe :</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Se connecter</button>
        </form>
    </main>

    <?php include('footer.php')?>
</body>
</html>
<style>
    body {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
}

main {
    display: flex;
}

form {
    display: flex;
    flex-direction: column;
}

form label, form input {
    margin-bottom: 10px;
}

form button {
    align-self: flex-end;
}
    </style>