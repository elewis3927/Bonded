<?php

  //return a connection to AWS RDS instance "bondedDB"
  function connect_DB(){

    //get AWS servername, dbName and dbPassword in file (not on github)
    include "dbInfo.php";

    $conn = mysqli_connect($servername, $dbName, $dbPassword);
    // Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_error());
        echo "COULD NOT CONNECT TO AWS DB \INSTANCE: bondedDB";
        return null;
    }else{
        return $conn;
    }
  }

  $conn = connect_DB();
  mysqli_select_db($conn, 'bondedDB');
?>
