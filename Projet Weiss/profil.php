<?php 
include('header.php');
include('connexion.php');

// Vérification de la connexion
if ($connexion->connect_error) {
    die("Échec de la connexion : " . $connexion->connect_error);
}

// Récupérer les écoles depuis la base de données
$get_schools_query = "SELECT id_etablissement, nomEtablissement FROM etablissement";
$schools_result = $connexion->query($get_schools_query);
$schools = array();

if ($schools_result->num_rows > 0) {
    while ($row = $schools_result->fetch_assoc()) {
        $schools[$row['id_etablissement']] = $row['nomEtablissement'];
    }
}

// Récupération de l'ID de l'utilisateur à partir de son nom
$sql_id_utilisateur = "SELECT id_utilisateur FROM Utilisateurs WHERE nom = '$user_firstname'";
$result_id_utilisateur = $connexion->query($sql_id_utilisateur);

if ($result_id_utilisateur->num_rows > 0) {
    $row = $result_id_utilisateur->fetch_assoc();
    $id_utilisateur = $row['id_utilisateur'];

    // Récupération des informations de l'utilisateur
    $sql_info_utilisateur = "SELECT * FROM Utilisateurs WHERE id_utilisateur = $id_utilisateur";
    $result_info_utilisateur = $connexion->query($sql_info_utilisateur);

    if ($result_info_utilisateur->num_rows > 0) {
        $utilisateur = $result_info_utilisateur->fetch_assoc();
    } else {
        echo "Aucun utilisateur trouvé.";
    }
} else {
    echo "Aucun utilisateur trouvé avec le nom: $user_firstname";
}

// Mise à jour des informations de l'utilisateur
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['modifierButton'])) {
    $nom = $_POST["nom"];
    $prenom = $_POST["prenom"];
    $email = $_POST["email"];
    $pwd = $_POST["password"];
    $pwd_confirm = $_POST["password_confirm"];
    $tel = $_POST["tel"];
    $civilite = $_POST["civilite"];
    $id_etablissement = $_POST["id_etablissement"];

    if ($id_etablissement === "NULL") {
        // Si l'option "Pas d'établissement" est sélectionnée, assignez NULL à $id_etablissement
        $id_etablissement = NULL;
    }

    // Vérifier si les mots de passe correspondent
    if ($pwd != $pwd_confirm) {
        echo "Les mots de passe ne correspondent pas.";
    } else {
        // Hasher le mot de passe
        $hashed_password = password_hash($pwd, PASSWORD_DEFAULT);

        $sql_update = "UPDATE Utilisateurs SET nom = ?, prenom = ?, email = ?, pwd = ?, numTel = ?, civilite = ?, id_etablissement = ? WHERE id_utilisateur = ?";
        $stmt = $connexion->prepare($sql_update);
        $stmt->bind_param("ssssssii", $nom, $prenom, $email, $hashed_password, $tel, $civilite, $id_etablissement, $id_utilisateur);

        if ($stmt->execute()) {
            echo "Informations mises à jour avec succès.";
            // Rafraîchir les informations de l'utilisateur après la mise à jour
            $result_info_utilisateur = $connexion->query($sql_info_utilisateur);
            if ($result_info_utilisateur->num_rows > 0) {
                $utilisateur = $result_info_utilisateur->fetch_assoc();
            }
        } else {
            echo "Erreur lors de la mise à jour des informations: " . $connexion->error;
        }
    }
    $_SESSION['user_firstname'] = $nom;
    $_SESSION['user_lastname'] = $prenom;
    $_SESSION['user_school'] = $id_etablissement;
    header("Location: board.php");
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil Utilisateur</title>
    <link href="style.css" rel="stylesheet">
</head>
<body>
<div class="edit-container">
    <h1>Profil Utilisateur</h1>
    <form action="" method="post" class="custom-form">
    <div>
        <label for="nom">Nom:</label><br>
        <input type="text" id="nom" name="nom" value="<?php echo $utilisateur['nom']; ?>"><br>
    </div>
    <div>
        <label for="prenom">Prénom:</label><br>
        <input type="text" id="prenom" name="prenom" value="<?php echo $utilisateur['prenom']; ?>"><br/>
    </div>
    <div>
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" value="<?php echo $utilisateur['email']; ?>"><br/>
    </div>
    <div>
        <label for="password">Nouveau mot de passe:</label><br>
        <input type="password" id="password" name="password"><br/>
    </div>
    <div>
        <label for="password_confirm">Confirmer le nouveau mot de passe:</label><br>
        <input type="password" id="password_confirm" name="password_confirm"><br/>
    </div>
    <div>
        <label for="tel">Numéro de téléphone:</label><br>
        <input type="text" id="tel" name="tel" value="<?php echo $utilisateur['numTel']; ?>"><br/>
    </div>
    <div>
        <label for="civilite">
            <div>
                <label for="civilite">Civilité:</label><br>
                <select id="civilite" name="civilite">
                    <option value="monsieur" <?php if ($utilisateur['civilite'] == 'monsieur') echo 'selected'; ?>>Monsieur</option>
                    <option value="madame" <?php if ($utilisateur['civilite'] == 'madame') echo 'selected'; ?>>Madame</option>
                </select><br/>
            </div>
    </div>
    <div>
        <label for="id_etablissement">Établissement:</label><br>
        <select id="id_etablissement" name="id_etablissement">
            <?php
            foreach ($schools as $id => $nom) {
                echo '<option value="' . $id . '"';
                if ($utilisateur['id_etablissement'] == $id) {
                    echo ' selected';
                }
                echo '>' . $nom . '</option>';
            }
            ?>
            <option value="NULL" <?php if ($utilisateur['id_etablissement'] === NULL) echo 'selected'; ?>>Pas d'établissement</option>
        </select><br/>
    </div>
    <div>
        <button type="submit" name="modifierButton">Modifier</button>
    </div>
</form>
<div>
    <h2>Informations actuelles:</h2>
    <p><strong>Nom:</strong> <?php echo $utilisateur['nom']; ?></p>
    <p><strong>Prénom:</strong> <?php echo $utilisateur['prenom']; ?></p>
    <p><strong>Email:</strong> <?php echo $utilisateur['email']; ?></p>
    <p><strong>Numéro de téléphone:</strong> <?php echo $utilisateur['numTel']; ?></p>
    <p><strong>Civilité:</strong> <?php echo $utilisateur['civilite']; ?></p>
    <p><strong>Établissement:</strong> <?php echo isset($utilisateur['id_etablissement']) ? $schools[$utilisateur['id_etablissement']] : 'Aucun établissement'; ?></p>
</div>
</div>
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
</body>
<?php include('footer.php');?>
</html>

