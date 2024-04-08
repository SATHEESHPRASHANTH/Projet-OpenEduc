<?php
include('connexion.php'); // Inclure le fichier de connexion à la base de données

// Récupérer les écoles depuis la base de données
$get_schools_query = "SELECT id_etablissement, nomEtablissement FROM etablissement";
$schools_result = $connexion->query($get_schools_query);
$schools = array();

if ($schools_result->num_rows > 0) {
    while ($row = $schools_result->fetch_assoc()) {
        $schools[$row['id_etablissement']] = $row['nomEtablissement'];
    }
}

// Récupérer les rôles depuis la base de données
$get_roles_query = "SELECT id_role, nom_role FROM role";
$roles_result = $connexion->query($get_roles_query);
$roles = array();

if ($roles_result->num_rows > 0) {
    while ($row = $roles_result->fetch_assoc()) {
        $roles[$row['id_role']] = $row['nom_role'];
    }
}

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
    $role = $_POST["role"]; // Récupérer le rôle de l'utilisateur

    // Convertir l'établissement sélectionné en NULL si "Pas d'établissement" est choisi
    if ($school == "NULL") {
        $school = NULL;
    }

    // Vérifier si les mots de passe correspondent
    if ($password != $password2) {
        echo("Les mots de passe ne correspondent pas.");
    } else {
        // Vérifier si l'utilisateur avec cette adresse électronique existe déjà
        $check_user_query = "SELECT email FROM utilisateurs WHERE email = ?";
        $stmt = $connexion->prepare($check_user_query);
        $stmt->bind_param("s", $mail);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            echo("Un compte avec cette adresse électronique existe déjà.");
        } else {
            // Hasher le mot de passe
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            // Insérer les données dans la table login
            $insert_user_query = "INSERT INTO utilisateurs (nom, prenom, civilite, email, numTel, pwd, id_role, id_etablissement) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt = $connexion->prepare($insert_user_query);
            $stmt->bind_param("ssssssss", $name, $lastname, $civil, $mail, $tel, $hashed_password, $role, $school);
            if ($stmt->execute()) {
                // Rediriger l'utilisateur vers une page après l'inscription réussie
                header("Location: index.php");
                exit();
            } else {
                echo("Erreur lors de l'inscription. Veuillez réessayer.");
            }
        }
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
    <input type="email" id="mail" name="mail" required>

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

    <label for="school">Établissement</label>
    <select id="school" name="school" required>
        <?php
        foreach ($schools as $id => $nom) {
            echo '<option value="' . $id . '">' . $nom . '</option>';
        }
        ?>
        <option value="NULL">Pas d'établissement</option>
    </select>

    <label for="role">Rôle</label>
    <select id="role" name="role" required>
        <?php
        foreach ($roles as $id => $nom) {
            echo '<option value="' . $id . '">' . $nom . '</option>';
        }
        ?>
    </select>

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

form label,
form input,
form select {
    margin-bottom: 10px;
}

form button {
    align-self: flex-end;
}
</style>
</html>
