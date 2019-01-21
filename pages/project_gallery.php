<?php
include "AWS_connect.php";
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bonded Materials</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="../style-sheets/style_navbar.css">
  <link rel="stylesheet" href="../style-sheets/style_vendor.css">
  <link rel="stylesheet" href="../style-sheets/style_gallery.css">
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
        <li class="nav-item container-fluid">
          <button class = "btn">
          <a class="nav-link active" href="products.php">Products</a>
          </button>
        </li>
        <li  class="nav-item container-fluid">
          <button class = "btn">
          <a class="nav-link active" href="history.php">History</a>
          </button>
        </li>
        <li  id = "selected"  class="nav-item container-fluid">
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

<div class = "page-title">
  <h2>Browse through completed projects that used Bonded for materials, design, and contruction needs!</h2>
</div>
<div style = 'width: 40%; margin: 0 auto;'><hr class = 'orange'></div>
<br><br>

<?php
  $result = mysqli_query($conn, "SELECT name, description, gallery_path FROM GALLERY");
  while($row = mysqli_fetch_array($result)){

    echo "
    <h5>$row[0]</h5><br>
    ";

    echo "
    <div class = 'row'>
    <div class = 'site-photo col-sm-5'>
    <img class = 'site' src='$row[2]'>
    </div>
    ";

    echo "
    <div class = 'photo-description col-sm-4'>
    <p>$row[1]</p>
    </div>
    </div>
    ";

    echo "<div style = 'width: 40%; margin: 0 auto;'><hr class = 'orange'></div>
    <br><br>";
  }
 ?>

</body>
</html>
