<?php
$ecoles = array("École 1", "École 2", "École 3", "École 4","NULL");
$nombreAleatoire = rand(100000, 999999);
// Vérifier si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les valeurs du formulaire
    $mail = $_POST["mail"];
    $password = $_POST["password"];
    $password2 = $_POST["password2"];
    $name = $_POST["name"];
    $lastname = $_POST["lastname"];
    $school = $_POST["school"];
    $civil = $_POST["civil"];
    $tel = $_POST["tel"];


    // Vérifier si les mots de passe correspondent
    if ($password != $password2) {
        echo("Les mots de passe ne correspondent pas.");
    } else {
        include('connexion.php');
        // Vérifier si l'utilisateur avec cette adresse électronique existe déjà
        $check_user_query = "SELECT email FROM utilisateurs WHERE email = 'mail'";
        $check_user_result = mysqli_query($connexion, $check_user_query);

        if (mysqli_num_rows($check_user_result) > 0) {
            echo("Un compte avec cette adresse électronique existe déjà.");
        } else {
            // Hasher le mot de passe
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            // Insérer les données dans la table login
            $insert_user_query = "INSERT INTO utilisateurs (id_utilisateur, nom, prenom, civilite, email, numTel, pwd, id_role, id_etablissement) VALUES ('$nombreAleatoire','$name','$lastname','$civil','$mail','$tel','$hashed_password','1',Null)";
            if (mysqli_query($connexion, $insert_user_query)) {
                // Rediriger l'utilisateur vers une page après l'inscription réussie
                header("Location: login.php");
                exit();
            } else {
                echo("Erreur lors de l'inscription. Veuillez réessayer.");
            }
        }
        // Fermer la connexion à la base de données
        mysqli_close($connexion);
    }
}
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
    <form action="" method="post">
    <label for="mail">Adresse électronique</label>
    <input type="mail" id="mail" name="mail" required>

    <label for="password">Mot de passe :</label>
    <input type="password" id="password" name="password" required>

    <label for="password2">Confirmation du mot de passe :</label>
    <input type="password" id="password2" name="password2" required>

    <label for="name">Nom</label>
    <input type="text" id="name" name="name" required>

    <label for="lastname">Prénom</label>
    <input type="text" id="lastname" name="lastname" required>

    <label for="civil">Civilité</label>
    <select id="civil" name="civil" required>
    <option value="monsieur">Monsieur</option>
    <option value="madame">Madame</option>
    </select>


    <label for="tel">Numéro de téléphone</label>
    <input type="text" id="tel" name="tel" required pattern="[0-9]+" title="Veuillez saisir uniquement des chiffres">



    <?php
// Liste des écoles
$ecoles = array("École 1", "École 2", "École 3", "École 4","NULL");

// Afficher la liste déroulante
echo '<label for="school">Établissement</label>';
echo '<select id="school" name="school" required>';
foreach ($ecoles as $ecole) {
    echo '<option value="' . strtolower(str_replace(' ', '', $ecole)) . '">' . $ecole . '</option>';
}
echo '</select>';
?>


    <button type="submit">S'inscrire</button>
</form>

    </main>
    <?php include('footer.php')?>
</body>
<style>
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
</html>
