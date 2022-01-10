<?php
 if(isset($_POST['submit'])){
    $output=shell_exec('sh ../sh/GADIO Abdourahmane - Script interactif.sh');
    echo $output;
    }
?>