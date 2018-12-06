<?php
include "AWS_connect.php";
// error messages
$username = $password = $adminLogErr = "";
$writeQ = false;

if (isset($_POST["authenticate"])){
  $username = mysqli_real_escape_string($conn, $_POST["username"]);
  $password = mysqli_real_escape_string($conn, $_POST["password"]);

  $result = mysqli_query($conn, "SELECT username FROM ADMIN WHERE username = '$username' AND password = '$password'");
  if(mysqli_num_rows($result) >0){
    session_start();
    $_SESSION['adminname'] = mysqli_fetch_array($result)[0];
    header("Location: update.php"); /* Redirect browser */
    exit();
  }else{
    $adminLogErr = "Incorrect Username or Password";
  }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bonded Materials</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="../style-sheets/style_navbar.css">
  <link rel="stylesheet" href="../style-sheets/style_admin.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
  <link rel="icon" href="../assets/logos/logo.png">
</head>
<body class= "mb-2 bg-light text-dark" data-spy="scroll" data-target="#categorySpy" data-offset="1">
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
        <button class = "btn" id="admin" style="  background-color: #808080;">
        <a class="nav-link active" style="color: white;"
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
<div id = "grayline">
  <p>no display</p>
</div>
<div id = "header" class = "jumbotron">
    <p><strong>Bonded Materials Company</strong></h1>
</div>
<div class="container">
  <div class = "section">
    <h3>Admin Login</h3><br>
    <fieldset>
    <form name="frmRegister" method="post" action="admin.php">
      <span class="error"><?php echo $adminLogErr;?></span>
      <legend for="username">Admin Username:
      <input type="text" name="username" value=""> </legend>
      <legend for="password">Admin Password:
      <input type="txt" name="password" value="" > </legend>
      <br>
      <p><input name = "authenticate" type="submit" value="Submit"/></p>
    </form></fieldset>
  </div>
</div>
</body>
</html>
