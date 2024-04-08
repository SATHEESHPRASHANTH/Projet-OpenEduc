<?php
include('connexion.php');

if ($connexion->connect_error) {
    die("Échec de la connexion : " . $connexion->connect_error);
}

// Vérifier si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les valeurs du formulaire
    $email = $_POST["email"];
    $password = $_POST["password"];

    // Préparer la requête SQL
    $stmt = $connexion->prepare("SELECT email, pwd, nom, prenom , id_role , id_etablissement FROM utilisateurs WHERE email = ?");
    if (!$stmt) {
        die('Erreur de préparation de la requête SQL : ' . $connexion->error);
    }
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();
    // Vérification du résultat de la requête
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($db_mail, $db_password, $db_nom, $db_prenom,$db_role,$db_school);
        $stmt->fetch();

        // Vérifier si le mot de passe correspond
        if (password_verify($password, $db_password)) {

            // L'utilisateur est authentifié
            session_start();
        
            // Enregistrer les informations de l'utilisateur dans la session
            $user_firstname = isset($_SESSION['user_firstname']) ? $_SESSION['user_firstname'] : '';
            $user_lastname = isset($_SESSION['user_lastname']) ? $_SESSION['user_lastname'] : '';
            $user_role = isset($_SESSION['user_role']) ? $_SESSION['user_role'] : '';
            $user_school = isset($_SESSION['user_school']) ? $_SESSION['user_school'] : '';
            $roleSTR = "";
            $schoolSTR = "";
// Récupérer le nom de l'établissement en fonction de l'ID de l'établissement
        if (!empty($user_school)) {
            $get_school_query = "SELECT nomEtablissement FROM etablissement WHERE id_etablissement = ?";
            $stmt = $connexion->prepare($get_school_query);
            $stmt->bind_param("i", $user_school);
            $stmt->execute();
            $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $schoolSTR = $row['nomEtablissement'];
    }
}

// Récupérer le nom du rôle en fonction de l'ID du rôle
if (!empty($user_role)) {
    $get_role_query = "SELECT nom_role FROM role WHERE id_role = ?";
    $stmt = $connexion->prepare($get_role_query);
    $stmt->bind_param("i", $user_role);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $roleSTR = $row['nom_role'];
    }
}
$_SESSION['user_firstname'] = $db_nom; // Assurez-vous que vous avez le nom correct dans $db_nom
$_SESSION['user_lastname'] = $db_prenom; // Assurez-vous que vous avez le prénom correct dans $db_prenom
$_SESSION['user_role'] = $db_role; // Assurez-vous que vous avez le rôle correct dans $db_role
$_SESSION['user_school'] = $db_school; // Assurez-vous que vous avez l'école correcte dans $db_school

            // Redirection vers la page board.php
            header("Location: board.php");
            exit(); // Assurez-vous d'ajouter exit() après la redirection pour arrêter l'exécution du script immédiatement
        } else {
            // Mot de passe incorrect
            echo " mot de passe incorrect.";
        }
    } else {
        // Aucun utilisateur trouvé avec cet e-mail
        echo "Nom d'utilisateur ou mot de passe incorrect.";
    }

    // Fermer la connexion à la base de données
    $stmt->close();
    $connexion->close();
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OpenEduc - Connexion</title>
    <link href="style.css" rel="stylesheet">
</head>
<?php include('header.php')?>
<body>
    <main>
        <img src="https://i.ibb.co/C1xFPdV/try-login.png" alt="Login Image">
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
            <label for="email">Email :</label>
            <input type="text" id="email" name="email" required>
            <label for="password">Mot de passe :</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Se connecter</button>
        </form>
        <?php if (!empty($error_message)) : ?>
            <p style="color: red;"><?php echo $error_message; ?></p>
        <?php endif; ?>
    </main>
</body>
<?php include('footer.php')?>
</html>
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