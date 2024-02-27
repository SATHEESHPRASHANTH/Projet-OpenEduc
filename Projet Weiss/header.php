<?php 
  echo "
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
    display: flex;
    justify-content: space-between;
    height: 80px;
    z-index: 1;
    width: 100%;
    max-width: 1300px;
    margin-right: auto;
    margin-left: auto;
    padding-right: 50px;
    padding-left: 50px;
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
      padding: 0 1rem;
      height: 100%;
    }
    .navbarlinks:hover {
      color: #b31b1b;
      transition: all 0.3s ease;
    }
  </style>
  <header>
  <h1>OpenEduc</h1>
  <nav class='navbar'>
      <div class='navbarcontainer'>
          <span class='bar'></span> <span class='bar'></span>
          <span class='bar'></span>
        </div>
        <ul class='navbarmenu'>
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
          <a href='index.php' class='image-link'>
          <img src='https://i.ibb.co/8jhnBGX/new-the-mail.png'/>
          <span class='navbarlinks'>Contact</span>
      </a>
        </ul>
      </div>
    </nav>
</header>";
?>