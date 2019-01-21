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
  <link rel="stylesheet" href="../style-sheets/style_history.css">
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
        <li  id="selected" class="nav-item container-fluid">
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
  <div class="container-fluid" id = "display" style="margin-top: 2rem;">
      <div id = "cont" class="col-sm-8" style="width: 75%;">
        <div id="company">
          <h1><span id = "underline">The Company</span></h1>
          <br>
          <p>BOMAT Holding . is a locally owned manufacturer and distributor of building materials for the construction, restoration, building maintenance and waterproofing industries.
            BOMAT Holding ., a Hawaii corporation founded in 1987, is the result of a merger between two established construction industry leaders- Bonded Materials Company and QUIKRETE® of Hawaii, Inc. Donald G. Deer, Chairman and Chief Executive Officer of BOMAT Holding  previously owned both Bonded Materials Company and QUIKRETE® of Hawaii, Inc. before the two were merged into one entity. Bonded Materials Company was founded in 1955 and QUIKRETE® of Hawaii, Inc. in 1980.
            <br><br>Bonded Materials Company, a d.b.a. of BOMAT Holding . services our customers from three sales offices. Our Dealer sales office located in Campbell Industrial Park in Kapolei, our Kalihi sales office near downtown Honolulu, and Kona sales office on the Big Island of Hawaii near the Kona airport.
            <br><br>Don Deer was the driving force behind the company's growth and development since 1969. He was a straightforward and progressive leader who had a reputation for honesty, loyalty and fair play.
            <br><br>Jeff Deer and Brian Deer worked in the business with their father Don. Jeff, the principal owner and President of Bonded Materials Company, oversees all the companies activities and has been working with the company since 1975. Brian, also an owner, has been with the company full time since 1985 and currently serves as corporate Secretary / Treasurer and oversees the Kalihi operation.</p>
          <hr>
          <br><br>
        </div>
        <div id="commitment">
          <h1><span id = "underline">The Commitment</span></h1>
          <br>
          <p>The management of Bonded Materials Company have three fundamental and absolute commitments:</p>
         <ol>
            <li>To always seek to give our customers value by helping them improve their productivity through the intelligent use of our products and services;</li><br>
            <li> To provide attractive work opportunities for all company representatives by ensuring that they are treated fairly and given opportunities for personal growth;</li><br>
            <li>To earn an attractive and above average rate of return for it’s shareholders.</li>
          </ol>
          <hr><br><br>
        </div>
        <div id="business">
          <h1><span id = "underline">The Business</span></h1>
          <br>
          <p>BOMAT Holding ., was created for the purpose of consolidating purchases, preparing financial reports, vendor payments, payroll, taxes, and other single company functions. As both a manufacturer and distributor, BOMAT Holding . markets and invoices its materials under the names of Bonded Materials Company and PRO-PAK. <br><br></p>
          <div id="propak">
            <img id = "logo" src= "../assets/history/history_4.jpg" style = "width: 100%">
          </div>
          <p><br><br>Bonded Materials Company (Bonded) is the corporation's construction products distributor of quality building materials. Materials include waterproofing systems, caulks and sealants, concrete admixtures, patching materials, decorative coatings and wall finishes, plaster, grout, concrete coloring, packaged concrete, clear sealers, epoxies and adhesives. Bonded supplies and services all types of contractors - general, remodeling, waterproofing, masonry, flooring & ceramic tile, plastering, painting, electrical and mechanical. It also provides materials and services to concrete producers, government, the armed services, and the hotel, property management, hospital, industrial and agricultural industries.
          <br><br>Bonded sells directly to the end user, whether they are a contractor, architect, engineer, or homeowner. Sales are generated over the counter at the Kalihi, Kona, and Campbell Industrial Park sales offices and can also be delivered directly to the customer's desired location. Many of our products are sold on a competitive basis where the quality of material, salesmanship, delivery and service are of prime consideration.
          <br><br>PRO-PAK is the corporation's manufacturer of both dry packaged and liquid based construction materials. It manufactures QUIKRETE® CEMENT MIXES (a nationally recognized brand of packaged cement mixes), expansion type construction grouts, concrete patching materials, concrete coloring, plaster, masonry mortars, thinset mortars and colored grouts for ceramic tile, liquid bonding adhesives, liquid admixtures, and clear sealers. More than 60% of the corporation's sales come from products manufactured right here in Hawaii.<br><br>PRO-PAK sells only on a wholesale basis through an established dealer network including Walmart & Kmart stores. The QUIKRETE® product line is sold island wide through approximately forty home improvement outlets, building supply centers and hardware stores such as The Home Depot, City Mill, Ace Hardware Stores, Lowes, and True Value Hardware Stores. These QUIKRETE® dealers generate the bulk of the QUIKRETE® business by stocking and promoting the products. For products other than QUIKRETE®, Bonded Materials Company is the major in-house vendor of goods manufactured by PRO-PAK, which are proving to be a widely accepted fast growing array of products.</p>
          <hr>
          <br>
        </div>
      </div>
  </div>
  <div class="sidenav" style="margin-top: 2rem; width: 40%;">
    <div id ="Notinfo">
      <div class= "vImage">
        <img id = "logo" src= "../assets/history/history_1.jpg" class = "oldImages" >
      </div>
      <div class= "vImage">
        <img id = "logo" src= "../assets/history/history_2.jpg" class = "oldImages">
      </div>
    </div>
  </div>
  <div class = "footer">
    <p style = "color: white; font-weight: 400"> © 2019 Bonded Materials Company <p>
  </div>
</body>
</html>
