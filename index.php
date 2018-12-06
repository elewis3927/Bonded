<?php
include "./pages/AWS_connect.php";
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bonded Materials</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="./style-sheets/style_navbar.css">
  <link rel="stylesheet" href="./style-sheets/style_vendor.css">
  <link rel="stylesheet" href="./style-sheets/style_homepage.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
  <link rel="icon" href="../assets/logos/logo.png">
</head>
<body class= " mb-2 bg-light text-dark">
  <div style="background-color: grey; height: 55px;" class = "fixed-top">
  <nav class="navbar navbar-expand-sm fixed-top">
  <div id="logo">
      <img src= "./assets/logos/logo.png"  href="index.php" style="width:55px;">
  </div>
  <button class="navbar-toggler hidden-md-up pull-xs-right"
          data-target="#navB" data-toggle="collapse" type="button">
            ☰
        </button>
  <div class="collapse navbar-collapse" id ="navB" style="margin-bottom: .09%;">
      <ul class="navbar-nav navbar-right">
        <li id = "selected" class="nav-item container-fluid ">
          <button class = "btn">
          <a class="nav-link active" href="index.php">About</a>
          </button>
        </li>
        <li class="nav-item container-fluid">
          <button class = "btn">
            <a class="nav-link active" href="./pages/vendors.php">Vendors</a>
          </button>
        </li>
        <li class="nav-item container-fluid">
          <button class = "btn">
          <a class="nav-link active" href="./pages/contact.php">Contact</a>
          </button>
        </li>
        <li class="nav-item container-fluid">
          <button class = "btn">
          <a class="nav-link active" href="./pages/products.php">Products</a>
          </button>
        </li>
        <li  class="nav-item container-fluid">
          <button class = "btn">
          <a class="nav-link active" href="./pages/history.php">History</a>
          </button>
        </li>
        <li class="nav-item container-fluid">
          <button class = "btn">
          <a class="nav-link active" href="./pages/project_gallery.php">Project Gallery</a>
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
            echo "href='./pages/update.php'> Admin: $name";
          }else{
            echo 'href="./pages/admin.php"> Admin';
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

<div style = "width: 80%; margin: 0 auto;">
  <p id   =  "description" style  = "text-align: center; font-size: 2rem;">
  A locally owned company dedicated to serving
  Hawaii's material and construction needs since 1955</p>
  <div style = "width: 40%; margin: 0 auto;"><hr class = "orange"></div>
</div>

    <div class="containerHome" style="width: 80%; margin: 0 auto;">
      <div id="bondedCarousel" class="carousel slide" data-ride="carousel" style="width: 100%; height: 100%;">
        <ol class="carousel-indicators">
          <li data-target="#bondedCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#bondedCarousel" data-slide-to="1"></li>
        </ol>
      <div class="carousel-inner" style = "width: 100%;">
        <div class="carousel-item active">
          <img src="./assets/logos/plant.jpg" alt="First slide" style="">
        </div>
        <div class="carousel-item">
          <div class = "movie">
        <iframe  src="https://www.youtube.com/embed/9CvBlgvouLc"  allowfullscreen></iframe>
        </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#bondedCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#bondedCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
  </div>
  </div>

  <br>
    <div style = "width: 80%; margin: 0 auto;">
      <p id   =  "description" style  = "text-align: center; font-size: 1.3rem;">We are a leading manufacturer, distributor, and retailer of concrete
                restoration and tile-setting
              materials including: pre-bagged concrete,
              grouts, thinsets, waterproofing materials, admixtures, epoxies, sealers and much more.</p>
              <div style = "width: 40%; margin: 0 auto;"><hr class = "orange"></div>
              <br><br>
    </div>


    <div class = "featured" style = "margin: 2rem;">
      <div style = "width: 80%; margin: 0 auto;">
        <p id="featured_title" style="font-size: 2rem;"><strong>Featured Product:</strong></p>
        <?php
          $result = mysqli_query($conn, "SELECT name, description, image_path, image_height, image_width FROM FEATURED_PRODUCT");
          $row = mysqli_fetch_array($result);
          echo "<p><u>$row[0]</u></p><p>$row[1]</p>";
           ?>
           <div style= "margin: 0 auto; text-align: center;">
           <?php
           echo "<p>$row[2]</p>";
          echo "<img style = 'height: $row[3]px; width: $row[4]px;' src='./pages/$row[2]'>";
         ?>
       </div>
       </div>
       <br>
       <h4 style = "text-align: center;"> Browse our vast number of products
         <a href = "./pages/products.php" style = "color: blue; text-align: center;"> here!</a></h4>
       <div style = "width: 40%; margin: 0 auto;"><hr class = "orange"></div>
       <br><br>
    </div>

    <div style = "width: 85%; margin: 0 auto;">
      <p id="featured_title" style="font-size: 2rem;"><strong>Services We Provide:</strong></p>
      <h4 style = "text-align: center;">Bonded not only supplies construction products, but also provides
      many other services listed below:</h4>
      <div class = "services-list">
        <ul>
          <li>
            On site visits
          </li>
          <li>
            Bulk bag management
          </li>
          <li>
            Architectural engineering support
          </li>
          <li>
            Delivery with piggy back
          </li>
          <li>
            Custon concrete color matching
          </li>
        </ul>
      </div>
      <div style = "width: 40%; margin: 0 auto;"><hr class = "orange"></div>
    </div>
    <br>

    <div class = "events">
    <h2> <strong>Events:</strong></h2>
    <br>
    <?php
    $result = mysqli_query($conn, 'SELECT * FROM EVENT');
    if(mysqli_num_rows($result) != 0){
      echo "
      <table style='width:100%'>
    <tr>
      <th>Title</th>
      <th>Description</th>
      <th>Address</th>
      <th>Date</th>
      <th>Time</th>
    </tr>";
      while($row = mysqli_fetch_array($result)){
        echo"<tr>";
        for($i = 0; $i< mysqli_num_fields($result); $i++){
          if ($i == 0){
            echo "<td> " . $row[$i] . " </td>";
          }else if ($i == 1){
            echo "<td> " . $row[$i] . " </td>";
          }else if ($i == 2){
          echo "<td> " . $row[$i] . " </td>";
          }else if ($i == 3){
            echo "<td> " . $row[$i] . " </td>";
          }else if ($i == 4){
            echo "<td> " . $row[$i] . " </td>";
          }
        }
        echo "</tr>";
      }
}else{
  echo "<p>No events posted at this time</p>";
}
echo "</table>";
?>
<div style = "width: 40%; margin: 0 auto;"><hr class = "orange"></div>
</div>

<div>
  <h4 style = "text-align: center; margin: 1rem;"> If you have any questions or concerns contact us
    <a href = "./pages/contact.php" style = "color: blue; text-align: center;"> here!</a></h4>
    <br><br>
</div>
  <div class = "footer">
    <p style = "color: white; font-weight: 400"> © 2018 Bonded Materials Company <p>
  </div>

</body>
</html>
