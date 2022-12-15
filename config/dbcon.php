<?php

    $host = "localhost";
    $username = "db";
    $password = "1234!@#$";
    $database = "phpecom";

    // Creating database connection
    $con = mysqli_connect($host, $username, $password, $database);

    // Check database connection
    if(!$con)
    {
        die("Connection Failed: ". mysqli_connect_error());
    }


?>
