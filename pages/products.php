<?php
  include "AWS_connect.php";
  session_start();
  $category_result = mysqli_query($conn, "SELECT DISTINCT category FROM PRODUCT ORDER BY category");
  $cat_array = mysqli_fetch_array($category_result);
  $first_category = $cat_array[0];
  $vendor_result = mysqli_query($conn, "SELECT DISTINCT vendor FROM PRODUCT ORDER BY vendor");
  $ven_array = mysqli_fetch_array($vendor_result);
  $first_vendor = $ven_array[0];
 ?>

<!DOCTYPE html>
<html lang="en">
<style>

</style>
<head>
  <title>Bonded Materials</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="../style-sheets/style_navbar.css">
  <link rel="stylesheet" href="../style-sheets/style_product.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script type="text/javascript" src="jquery-3.3.1.min.js"> </script>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
  <link rel="icon" href="../assets/logos/logo.png">
</head>

<body class= "mb-2 bg-light text-dark" data-spy="scroll" data-target="#categorySpy" data-offset="1">
  <div style="background-color: grey; height: 55px;" class = "fixed-top">
  <nav class="navbar navbar-expand-sm fixed-top">
  <div id="logo">
    <a href="../index.php">
      <img src= "../assets/logos/logo.png" style="width:55px;">
    </a>
  </div>
  <button class="navbar-toggler hidden-md-up pull-xs-right"
          data-target="#navB" data-toggle="collapse" type="button">
            ☰
        </button>
  <div class="collapse navbar-collapse" id ="navB" style="margin-bottom: .09%;">
      <ul class="navbar-nav navbar-right">
        <li class="nav-item container-fluid ">
          <button class = "btn">
          <a class="nav-link active" href="../index.php">About</a>
          </button>
        </li>
        <li class="nav-item container-fluid">
          <button class = "btn">
            <a class="nav-link active" href="vendors.php">Vendors</a>
          </button>
        </li>
        <li class="nav-item container-fluid">
          <button class = "btn">
          <a class="nav-link active" href="contact.php">Contact</a>
          </button>
        </li>
        <li id = "selected" class="nav-item container-fluid">
          <button class = "btn">
          <a class="nav-link active" href="products.php">Products</a>
          </button>
        </li>
        <li class="nav-item container-fluid">
          <button class = "btn">
          <a class="nav-link active" href="history.php">History</a>
          </button>
        </li>
        <li class="nav-item container-fluid">
          <button class = "btn">
          <a class="nav-link active" href="project_gallery.php">Project Gallery</a>
          </button>
        </li>
      </ul>
    </div>
    <div>
        <button class = "btn" id="admin">
        <a class="nav-link active"
        <?php
          if(isset($_SESSION["adminname"])){
            $name = $_SESSION["adminname"];
            echo "href='update.php'> Admin: $name";
          }else{
            echo 'href="admin.php"> Admin';
          }
          ?>
        </a>
    </div>
  </div>
  </nav>
</div>
<div id = "grayline">
  <p>no display</p>
</div>
<div id = "header" class = "jumbotron">
    <p><strong>Bonded Materials Company</strong></h1>
</div>
    <div id="nav_queries">
      <div id="top_select">
        <nav class="col-sm-3 col-4 navbar-collapse" id="categorySpy">
          <ul class="nav nav-pills flex-row" id ="display_nav">
            <li class='nav-item top_selectq'>
              <a class='nav-link active' href='#bs' id="category">Categories</a>
            </li>
            <li class='nav-item top_selectq'>
              <a class='nav-link nonactive' href='#bs' id="vendor">Vendors</a>
            </li>
          </ul>
        </nav>
      </div>
      <hr class="orange">
      <br>
      <br>
      <div id="bottom_select">
        <nav class="col-sm-3 col-4 navbar-collapse" id="categorySpy">
          <div class = "category">
            <ul class="nav nav-pills flex-column" id ="display_nav">
              <?php
                echo "<li class='nav-item ajaxQ' id='$first_category'>
                        <a class='nav-link active' href='#bs' id='hi'>$first_category</a>
                      </li>";
                while($category_info = mysqli_fetch_array($category_result)){
                  echo "<li class='nav-item ajaxQ' id='$category_info[0]'>
                          <a class='nav-link nonactive' href='#bs'>$category_info[0]</a>
                        </li>";
                }
              ?>
            </ul>
          </div>
          <div class = "vendor" style = "display: none;">
            <ul class="nav nav-pills flex-column" id ="display_nav">
            <?php
              echo "<li class='nav-item ajaxQ' id='$first_vendor'>
                      <a class='nav-link active' href='#bs' id='hi'>$first_vendor</a>
                    </li>";
              while($vendor_info = mysqli_fetch_array($vendor_result)){
                echo "<li class='nav-item ajaxQ' id='$vendor_info[0]'>
                        <a class='nav-link nonactive' href='#bs'>$vendor_info[0]</a>
                      </li>";
              }
            ?>
            </ul>
          </div>
        </nav>
      </div>
    </div>
    <div class="col-sm-6 col-6 center">
      <div id = "querycontainer">

      </div>
    </div>
    <div class="sidenav">
      <div id ="info">
        <p id="featured_title"><strong>Featured Product</strong></p>
        <?php
          $result = mysqli_query($conn, "SELECT name, description, image_path, image_height, image_width, link FROM FEATURED_PRODUCT");
          $row = mysqli_fetch_array($result);
          //link to another page only if featured product link is provided
          if($row[5] == ""){
            echo "<p><u>$row[0]</u></p><p>$row[1]</p>";
          }else{
            echo "<a href='$row[5]' target='_blank'><p><u>$row[0]</u></p><p>$row[1]</p></a>";
          }
          echo "<img style = 'height: $row[3]px; width: $row[4]px;' src='$row[2]'>";
         ?>
       </div>
    </div>
    <div class = "footer">
      <p style = "color: white; font-weight: 400" id="hi"> © 2019 Bonded Materials Company <p>
    </div>
</body>
<script type="text/javascript">
  $(document).ready(function() {

      //initial query run when page is loaded
      query()

      //allow user to sort by product category or vendor
      $(".top_selectq").click(function(){
        $(this).siblings().find(".nav-link").removeClass("active").addClass("nonactive");
        $(this).find(".nav-link").addClass("active").removeClass("nonactive");
        var show = this.getElementsByTagName("a")[0].id;
        document.getElementsByClassName(show)[0].style.display = "block";
        var hide = document.querySelector(".nonactive").id;
        document.getElementsByClassName(hide)[0].style.display = "none";
        $(this).find(".nav-link").addClass("active").removeClass("nonactive");
        query();
      });

      //display inforation for each segment of a category or vendor
      $(".ajaxQ").click(function() {
        if(!$(this).find(".nav-link").hasClass("active")){
          $(this).siblings().find(".nav-link").removeClass("active").addClass("nonactive");
          $(this).find(".nav-link").addClass("active").removeClass("nonactive");
          query();
        }
      });

      //display new product data using AJAX query
      function query(){
        $("#querycontainer").html("<p style='text-align: center; margin-bottom: 3rem;'>Please wait...</p>");
        var data = {};
        var criteria = document.getElementById('top_select').getElementsByClassName('active')[0].id;
        data["criteria"] = criteria;
        var productCategory  = document.getElementsByClassName(criteria)[0].getElementsByClassName("active")[0].textContent;
        data["value"] = productCategory;
        $.ajax({    //create an ajax request to display.php
          type: "POST",
          data: data,
          url: "productQuery.php",
          dataType: "html",   //expect html to be returned
          success: function(response){
              $("#querycontainer").html(response);
          }
        });
      }
    });
</script>
</html>
