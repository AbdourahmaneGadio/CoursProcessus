<html lang = "fr">

    <head>

        <meta charset="utf-8" />
        <link rel="stylesheet" href="css/mainPage.css" />

        <title>Script processus sur Debian</title>

    </head>

    <body> 

        <div class="header">
            <h1><br>Script expliquant les processus sur Debian</br></h1>
            <hr>
        </div>
        
        <!-- Sites -->
        <div class="main">

            <!-- Partie PHP -->
            <?php
                echo '
                <form action="php/execScript.php" method="post">
                    <input type="submit" name="submit" value="Lancer le script">
                </form>'
            ?>    

        </div>

        <hr>

        <footer>
            <p>Copyright © Abdourahmane Gadio - 2022 - Tous Droits Réservés</p>
        </footer>


    </body>

</html>

