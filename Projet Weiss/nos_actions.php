<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet">
    <title>Document</title>
    <style>
        /* Ajoutez le style spécifique au tableau ici */
        .library-container {
            width: 80%;
            margin: 20px auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .book {
            border: 2px solid #000;
            border-radius: 5px;
            margin-bottom: 20px;
            overflow: hidden;
            background-color: #f2f2f2;
            width: calc(33.33% - 20px); /* 3 éléments par ligne avec un espace de 20px entre eux */
            box-sizing: border-box;
        }

        .book-info {
            padding: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .book-title, .book-author {
            font-size: 18px;
            border: 1px solid #000;
            border-radius: 5px;
            padding: 5px;
            margin-top: 5px;
        }

        .book-author {
            font-style: italic;
            color: #555;
        }
    </style>
</head>
<?php include('header.php')?>
<body>
    <div>
        <main>
<?php
// Supposons que $result soit le résultat de votre requête SQL
$result = [
    [1, 'John Doe'],
    [2, 'Jane Smith'],
    [3, 'Bob Johnson'],
    [4, 'Alice Brown'],
    [5, 'Charlie Green'],
    [6, 'David White'],
    // ... autres résultats
];

// Vérifier si la requête a renvoyé des résultats
if (!empty($result)) {
    echo '<div class="library-container">';
    
    foreach ($result as $book) {
        echo '<div class="book">';
        echo '<div class="book-info">';
        echo '<div class="book-title">' . $book[0] . '</div>';
        echo '<div class="book-author">' . $book[1] . '</div>';
        echo '</div>';
        echo '</div>';
    }

    echo '</div>';
} else {
    echo '<p class="library-container">Aucun livre trouvé.</p>';
}
?>
        </main>
</div>
    <div class="modif">
        <main >
            <h2>Édition du contenu</h2>
            <div class="edit-container">
                <h3>Ajout d'action:</h3>
                Nom de l'action : <input type="text" class="edit-input" placeholder="Zone de texte 1"></br/>
                description de l'action : <input type="text" class="edit-input" placeholder="Zone de texte 2">
                <button class="edit-button">Bouton</button>
            </div>
            <div class="edit-container">
                <h3>Suppression d'action</h3>
                num de l'action : <input type="text" class="edit-input" placeholder="Zone de texte 1">
                <button class="edit-button">Bouton</button>
            </div>
        </main>
    </div>

</body>
<?php include('footer.php')?>
</html>