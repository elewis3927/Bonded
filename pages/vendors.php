<?php
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
      <img src= "../assets/logos/logo.png"  href="../index.php" style="width:55px;">
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
        <li id = "selected" class="nav-item container-fluid">
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
 <div class = "cont">
   <div id = "vendors">
      <h2><span id = "underline">Check out who we work with!</span></h2>
      <div class="row">
        <div class= "vImage"><a href="http://www.scofield.com/">
          <img id = "logo" src= "../assets/logos/scofield.jpg" ></a></div>
        <div class= "vImage"><a href="https://www.quikrete.com">
          <img id = "logo" src= "../assets/logos/quickreet.png"></a></div>
        <div class= "vImage"><a href="http://www.mapei.com/US-EN/default.asp">
          <img id = "logo" src= "../assets/logos/mapei.jpg"></a></div>
      </div>

      <div class="row">
        <div class=" vImage"><a href="http://sinakcorp.com/">
          <img id = "logo" src= "../assets/logos/sinak.png" ></a></div>
        <div class=" vImage"><a href="http://www.daytonsuperior.com/brands/chemicals/unitex">
          <img id = "logo" src= "../assets/logos/unitex.jpg"></a></div>
        <div class=" vImage"><a href="https://consumer.dow.com/">
          <img id = "logo" src= "../assets/logos/dow_corning.png"></a></div>
      </div>

      <div class="row">
        <div class=" vImage"><a href="http://www.tnemec.com/">
          <img id = "logo" src= "../assets/logos/tnemec.jpeg" ></a></div>
        <div class=" vImage"><a href="https://www.cortecvci.com/index2.php">
          <img id = "logo" src= "../assets/logos/cortec.jpg"></a></div>
        <div class=" vImage"><a href="https://grace.com/en-us">
          <img id = "logo" src= "../assets/logos/grace.jpg"></a></div>
      </div>

      <div class="row">
        <div class=" vImage"><a href="https://glaze-n-seal.com/">
          <img id = "logo" src= "../assets/logos/glazenseal.jpg" ></a></div>
        <div class=" vImage"><a href="https://chapinmfg.com/">
          <img id = "logo" src= "../assets/logos/chapin.jpg"></a></div>
        <div class=" vImage"><a href="https://www.daviscolors.com/">
          <img id = "logo" src= "../assets/logos/davis_colors.jpg"></a></div>
      </div>

      <div class="row">
        <div class=" vImage"><a href="https://www.krafttool.com/">
          <img id = "logo" src= "../assets/logos/kraft_tool_co.png" ></a></div>
        <div class=" vImage"><a href="http://desertbrand.com/">
          <img id = "logo" src= "../assets/logos/desert.gif"></a></div>
        <div class=" vImage"><a href="https://www.reefindustries.com/armorlon.php">
          <img id = "logo" src= "../assets/logos/reef.png"></a></div>
      </div>

      <div class="row">
        <div class=" vImage"><a href="https://www.basf.com/us/en.html">
          <img id = "logo" src= "../assets/logos/basf.jpg" ></a></div>
        <div class=" vImage"><a href="http://www.increte.com/">
          <img id = "logo" src= "../assets/logos/increte.jpg" ></a></div>
        <div class=" vImage"><a href="http://www.lehighwhitecement.com/Pages/home.aspx">
          <img id = "logo" src= "../assets/logos/lehigh.jpg"></a></div>
      </div>

      <div class="row">
        <div class=" vImage"><a href="https://www.emseal.com/">
          <img id = "logo" src= "../assets/logos/emseal.jpg"></a></div>
        <div class=" vImage"><a href="http://www.beadcrete.com/">
          <img id = "logo" src= "../assets/logos/beadcrete.png"></a></div>
        <div class=" vImage"><a href="http://www.liquiblack.com/">
          <img id = "logo" src= "../assets/logos/liquiblack.jpg"></a></div>
      </div>
    </div>
</div>
<div class = "footer">
  <p style = "color: white; font-weight: 400"> © 2018 Bonded Materials Company <p>
</div>
</body>
</html>
