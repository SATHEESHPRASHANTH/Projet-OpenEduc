<?php
session_start();
$user_firstname = isset($_SESSION['user_firstname']) ? $_SESSION['user_firstname'] : '';
$user_lastname = isset($_SESSION['user_lastname']) ? $_SESSION['user_lastname'] : '';
$user_role = isset($_SESSION['user_role']) ? $_SESSION['user_role'] : '';
$user_school = isset($_SESSION['user_school']) ? $_SESSION['user_school'] : '';
$roleSTR="";
$schoolSTR="";
if($user_school==NULL && $user_firstname!=NULL){
  $schoolSTR="Sans établissement";
}else if($user_school!=NULL && $user_firstname!=NULL ){
  include('connexion.php');
  // Requête pour obtenir le nom du rôle à partir de la table 'role'
  $get_role_query = "SELECT nomEtablissement FROM etablissement WHERE id_etablissement = ?";
  $stmt = $connexion->prepare($get_role_query);
  $stmt->bind_param("i", $user_school);
  $stmt->execute();
  $result = $stmt->get_result();
  if($result->num_rows > 0){
      $row = $result->fetch_assoc();
      $schoolSTR = $row['nomEtablissement'];
  }
}else{
  $schoolSTR=$user_school;
}
if($user_role != null){
  include('connexion.php');
  // Requête pour obtenir le nom du rôle à partir de la table 'role'
  $get_role_query = "SELECT nom_role FROM role WHERE id_role = ?";
  $stmt = $connexion->prepare($get_role_query);
  $stmt->bind_param("i", $user_role);
  $stmt->execute();
  $result = $stmt->get_result();
  if($result->num_rows > 0){
      $row = $result->fetch_assoc();
      $roleSTR = $row['nom_role'];
  }
}
if($user_firstname!=NULL)
?>
<style>
  .image-link {
    display: inline-block;
    text-align: center;
    text-decoration: none;
    color: #000; /* Définissez la couleur que vous souhaitez pour le texte */
    width: 170px; /* Définissez la largeur fixe en pixels ou une autre unité */
    height: 170px; /* Définissez la hauteur fixe en pixels ou une autre unité */
  }
  
  .image-link span {
      display: block;
      margin-top: 5px; /* You can adjust the margin as needed */
  }
  
  .navbar {
    background: #3498db;
    height: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.2rem;
    position: sticky;
    top: 0;
    z-index: 999;
  }
  
  .navbarcontainer {
    display: grid;
    justify-content: space-between;
    height: 80px;
    z-index: 1;
    width: 100%;
    max-width: 1300px;
    margin-right: auto;
    margin-left: auto;
    padding-right: 50px;
    padding-left: 50px;

    display: grid;
  grid-template-columns: repeat(4, 1fr); /* Crée une grille avec 4 colonnes de largeur égale */
  grid-gap: 10px; /* Ajoute un espace entre les colonnes */
  align-items: center; /* Aligne les éléments au centre verticalement */
  }
  
    .navbarmenu {
      display: flex;
      align-items: center;
      list-style: none;
      text-align: center;
    }
  
    .navbaritem {
      height: 100px;
    }
  
    .navbarlinks {
      color: #fff;
      display: flex;
      align-items: center;
      justify-content: center;
      text-decoration: none;
    }
    .navbarlinks:hover {
      color: #b31b1b;
      transition: all 0.3s ease;
    }

    .user-info {
      display: flex;
      align-items: center;
      color: #fff;
      margin-right: 20px; /* Ajoutez une marge à droite pour l'espace */
  }
  
  #user-firstname,
  #user-lastname {
      margin-right: 10px; /* Ajoutez une marge entre le prénom et le nom si nécessaire */
  }
  </style>
  <header>
  <h1>OpenEduc</h1>
  <nav class='navbar'>
      <div class='navbarcontainer'>
          <span class='bar' id='user-firstname'><?php echo $user_firstname; ?></span> <span class='bar' id='user-lastname'><?php echo $user_lastname; ?></span>
          <span class='bar'></span> <span class='bar'></span>
          <span class='bar' id='user_school'><?php echo $schoolSTR; ?></span> <span class='bar' id='user-role'><?php echo $roleSTR; ?></span>
          <span class='bar'></span> <span class='bar'></span>
        </div>
        <ul class='navbarmenu'>
          <?php
          if($user_firstname!=NULL){
        echo"<li class='navbaritem'>";
        echo"<a href='board.php' class='image-link'>";
        echo"<img src='https://i.ibb.co/m6T3Jsy/tableau.png' />";
        echo"<span class='navbarlinks'>Accueil</span>";
        echo"</a>";
        echo"</li>";
        echo"<p>|</p>";
};
?>
          <li class='navbaritem'>
          <a href='index.php' class='image-link'>
          <img src='https://i.ibb.co/jHTzZ5g/new-the-house.png' />
          <span class='navbarlinks'>Accueil</span>
      </a>
          </li>
          <p>|</p>
          <li class='navbaritem'>
          <a href='informations.php' class='image-link'>
          <img src='https://i.ibb.co/S5bMSQx/truest-book.png'/>
          <span class='navbarlinks'>à propos</span>
      </a>
          </li>
          <p>|</p>
          <li class='navbaritem'>
          <a href='nos_actions.php' class='image-link'>
          <img src='https://i.ibb.co/mF88ccK/new-people.png'/>
          <span class='navbarlinks'>Nos Actions</span>
      </a>
          </li>
          <p>|</p>
          <li class='navbaritem'>
          <a href='nos_ecoles.php' class='image-link'>
          <img src='https://i.ibb.co/px3NzGY/school-education-learning-classroom-study-svgrepo-com-1-1.png'/>
          <span class='navbarlinks'>Nos Écoles</span>
      </a>
          </li>
          <!--<p>|</p>
          <li class='navbaritem'>
          <a href='index.php' class='image-link'>
          <img src='https://i.ibb.co/8jhnBGX/new-the-mail.png'/>
          <span class='navbarlinks'>Contact</span>
      </a>-->
        </ul>
    </nav>
</header>