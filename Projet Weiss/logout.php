<?php
session_start();

// Détruire la session
session_destroy();

// Rediriger vers la page d'accueil ou une autre page appropriée
header("Location: index.php");
exit();
?>
