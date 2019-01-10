<?php
  //display all products in a category on the products page (usually called by ajax)

  include "AWS_connect.php";
  if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
    if(isset($_POST["criteria"]) && isset($_POST["value"])) { //Checks if action value exists
      productQuery($_POST["criteria"], $_POST["value"], $conn);
    }
  }

  function productQuery($criteria, $value, $conn){
    $product_sql = "SELECT pid, name, description FROM PRODUCT WHERE $criteria =  '$value' ORDER BY name ASC;";
    $products = mysqli_query($conn, $product_sql);
    while($products_info = mysqli_fetch_array($products)){
      $product_id = $products_info[0];
      $name = $products_info[1];
      $description = $products_info[2];
      echo "<strong style='font-weight:900'>$name</strong>";
      echo "<br><br><p sytle='float: left'>$description</p>";
      $links = mysqli_query($conn, "SELECT name, image_path FROM PRODUCT_IMAGE
      WHERE product_id = $product_id;");
      if ($links){
        while($link_row = mysqli_fetch_array($links)){
          for($i = 0; $i < mysqli_num_fields($links); $i+=2){
            $linkName = $link_row[$i];
            $linkLink = $link_row[$i + 1];
            if ($linkName == 'data'){$linkName = 'Info';}
            echo "<span class='fileLink'><a href = $linkLink class = 'blueLink' target = '_blank'>$linkName</a></span>";
          }
        }
      }
      echo "<br><hr>";
    }
  }
?>
