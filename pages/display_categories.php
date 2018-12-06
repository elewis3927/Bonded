<?php
  //display categories of products on product_list.php
  include 'AWS_connect.php';
  $conn = connect_DB();
  //get list of categories
  $category_results = mysqli_query($conn, "SELECT DISTINCT category FROM PRODUCT WHERE display = 1");
  if($category_results){
    $list_of_categories = array();
    //store in array so that indices are accessable ($key)
    while($row = mysqli_fetch_array($category_results)){
      array_push($list_of_categories, $row);
    }
    //display each category as a list of products in a table
    foreach($list_of_categories as $key=>$value){
      $category = $value[0];
      $top_product_results = mysqli_query($conn, "SELECT * FROM PRODUCT WHERE category =  '$category' AND display = 1 LIMIT 5");
      $total_product_results = mysqli_query($conn, "SELECT COUNT(*) FROM PRODUCT WHERE category = '$category' AND display = 1");
      $remaining = "";
      $count = mysqli_fetch_array($total_product_results)[0];
      if($count > mysqli_num_rows($top_product_results)){
        $count = $count-5;
        $remaining = "... and ".$count." others";
      }
      $list = "";
      while($product = mysqli_fetch_array($top_product_results)){
        $list .= "<li><a href = '../index.php'>$product[0]</li>";
      }
      if($key == 0){
        echo '<tr>';
      }else if(($key-1) % 3 == 2){
        echo '</tr>';
        echo '<tr>';
      }
      echo "<td>
              <div>
                <button class='btn btn-primary'>$category
                <span class='caret'></span></button>
                <ul >".$list."</ul>".$remaining."
              </div>
          </td>";
    }
    echo '</tr>';
  }
?>
