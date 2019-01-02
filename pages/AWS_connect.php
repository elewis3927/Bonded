<?php
  //return a connection to AWS RDS instance "bondedDB"
  function connect_DB(){
    $servername = 'bondeddb.c62n00tl8ltg.us-west-1.rds.amazonaws.com';
    $conn = mysqli_connect($servername, "bondedAdmin", "Scoobie10");
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
