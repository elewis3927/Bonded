<?php include "AWS_connect.php";
session_start();
if(!isset($_SESSION["adminname"])){
  unset($_SERVER);
  unset($_POST);
  header("Location: admin.php"); /* Redirect browser */
  exit();
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
    <link rel="stylesheet" href="../style-sheets/style_update.css">
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
            <a class="nav-link active" href="project_gallery.php">Project Gallery</a>
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
        <button class="btn" id="admin">
          <a class="nav-link active" href="unset.php">
          <?php echo "Logout: ".$_SESSION['adminname']; ?>
          </a>
        </button>
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
    <div class="container">
      <?php include "update_validation_queries.php"; ?>
      <div class = "section">
        <?php echo $notifyErr;
              echo $notifySuccess?>
      </div>
      <div id="create" class = "section">
        <fieldset>
          <h3 class="action_title"> Create a Product </h3>
          <form name="addProduct" method="post"
          action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" enctype="multipart/form-data">
            <div class = "form-group">



              <span class="error"> <?php echo $pNameErr;?></span><br>
              <legend for="pName">Product Name:
                <input type="text" name="pName" value=""> </legend>
              <span class="error"> <?php echo $categoryErr;?></span>
              <legend for="category">Product Category:
                <input type="txt" name="category" value=""> </legend>
              <span class="error"> <?php echo $pVendorErr;?></span>
              <legend for="category">Product Vendor:
                <input type="txt" name="vendor" value=""> </legend>
              <span class="error"> <?php echo $pDescriptionErr;?></span><br>
              <textarea rows ="3" cols = "30" type="text" name="pDescription" placeholder= "Product Description" style = "font-size: 14px;"></textarea><br><br>

<!-- buggy code for saving sds/data files as files rather than links-->
<!--
              <span class="error"> <?php echo $dataFileErr;?></span>
              <legend for="dataFileToUpload">Data File:
                <input type="file" name="dataFileToUpload" id="dataFileToUpload"></legend>
              <span class="error"> <?php echo $sdsFileErr;?></span>
              <legend for="sdsFileToUpload">SDS File:
                <input type="file" name="sdsFileToUpload" id="sdsFileToUpload"></legend>
              <span class="error"> <?php echo $cChartUploadErr;?></span>
              <legend for="cChartToUpload">Color Chart:
                <input type="file" name="cChartToUpload" id="cChartToUpload"></legend>

              <p style="margin: 3% auto;"> OR </p> -->

              <span class="error"> <?php echo $pLinkErr;?></span>
              <legend for="dataLink">Link to Data File:
                <input type="text" name="dataLink" id="dataLink"></legend>
              <span class="error"> <?php echo $pLinkErr;?></span>
              <legend for="sdsLink">Link to SDS File:
                <input type="text" name="sdsLink" id="sdsLink"></legend>
              <span class="error"> <?php echo $cChartLinkErr;?></span>
              <legend for="cChartLink">Link to Color Chart:
                <input type="text" name="cChartLink" id="cChartLink"></legend>

            </div><br>
            <input type="submit" name = "addProduct" value="Submit"/><br><br>
            <hr class = "orange"><br>
          </form>





        </fieldset>
      </div>
      <div id="delete" class = "section">
        <fieldset id = "formtype">
          <h3 class = "action_title"> Delete a Product</h3><br>
          <form name="deleteProduct" method="post"
          action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
          <span class="error"> <?php echo $deleteErr;?></span>
            <div>
              <!--display all products in a dropdown menu-->
              <select name="delete">
                <option disabled selected value> -- -- </option>
                <?php
                  $result = mysqli_query($conn, "SELECT DISTINCT name FROM PRODUCT ORDER BY name ASC");
                  while($row = mysqli_fetch_array($result)){
                    echo "<option value='$row[0]'>$row[0]</option>";
                  }
                ?>
              </select><br>
              <span class="error"> <?php echo $ackErr;?></span><br>
              <legend for="acknowledge" style="text-align: center">Yes, I want to delete this product
              <input type="checkbox" name="acknowledge" style="width: 4%;" value=".jpg"/>
              <br><br></legend>
              <input name="deleteProduct" type="submit" value="Submit"/><br><br>
              <hr class = "orange"><br>
            </div>
          </form>
        </fieldset>
      </div>
      <div id="featured" class = "section">
        <fieldset>
          <h3 class ="action_title"> Change the Featured Product </h3><br>
          <form name="changeFeature" method="post"
          action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" enctype="multipart/form-data">
          <span class="error"> <?php echo $featuredErr;?></span>
            <div>
              <select name="featured_name">
                <option disabled selected value> -- -- </option>
                <!--display all products in a dropdown menu-->
                <?php
                  $result = mysqli_query($conn, "SELECT DISTINCT name FROM PRODUCT ORDER BY name ASC") or die("<br/><br/>".mysql_error());
                  echo mysqli_fetch_array($result);
                  while($row = mysqli_fetch_array($result)){
                    echo "<option value='$row[0]'>$row[0]</option>";
                  }
                ?>
              </select><br>
              <span class="error"> <?php echo $featuredDescErr;?></span><br>
              <textarea rows ="3" cols = "30" type="text" name="fp_description" placeholder= "Product Description" style = "font-size: 14px;"></textarea><br><br>
              <legend for="data"> Product Image
                <input type="file" name="featured_image" id="featured_image"></legend>
              <span class="error"> <?php echo $imageInfoErr;?></span><br>
              <legend for="featured_type" style='text-align: center'>Image File Type:
              <input type="radio" id="jpg" name="featured_type" style="width: 4%;" value=".jpg"/>
              <label for= "jpg">.jpg</label>
              <input type="radio" id="png" name="featured_type" style="width: 5%;" value=".png"/>
              <label for="png">.png</label></legend>
              <legend for="data">Image Height (px)
                <input type="text" name="image_height" value = ""></legend>
              <legend for="data">Image Width (px)
                <input type="text" name="image_width" value = ""></legend>
                <p style='font-size: 12px;'>(suggested: height ~200px, width ~160px)</p><br>
              <input name="changeFeature" type="submit" value="Submit"/><br><br>
              <hr class = "orange"><br>
            </div>
          </form>
        </fieldset>
      </div>
      <div id="event" class = "section">
        <fieldset>
          <h3 class="action_title">Add an Event</h3><br>
          <form name="createEvent" method="post"
          action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
            <div>
              <span class="error"> <?php echo $eventNameErr;?></span>
              <legend for="eventName">Event Name:
                <input type="txt" name="eventName" value=""> </legend>
              <span class="error"> <?php echo $eventDescriptionErr;?></span>
              <legend for="eventDescription">Event Description:
                <input type="txt" name="eventDescription" value=""> </legend>
              <span class="error"> <?php echo $eventLocationErr;?></span>
              <legend for="eventLocation">Event Location:
                <input type="txt" name="eventLocation" value=""> </legend>
              <span class="error"> <?php echo $eventDateErr;?></span>
              <legend for="eventDate">Event Date:
                <input type="txt" name="eventDate" value=""> </legend>
              <span class="error"> <?php echo $eventTimeErr;?></span>
              <legend for="eventTime">Event Time:
                <input type="txt" name="eventTime" value=""> </legend>
            </div><br>
            <input name="createEvent" type="submit" value="Submit"/><br><br>
            <hr class = "orange"><br>
          </form>
        </fieldset>
      </div>

      <div id="eventDelete" class = "section">
        <fieldset id = "formtype">
          <h3 class = "action_title"> Delete an Event</h3><br>
          <form name="deleteEvent" method = "post"
          action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
          <span class="error"> <?php echo $eventdeleteErr;?></span>
            <div>
              <!--display all products in a dropdown menu-->
              <select name="eventDelete">
                <option disabled selected value> -- -- </option>
                <?php
                  $result = mysqli_query($conn, "SELECT DISTINCT name FROM EVENT ");
                  while($row = mysqli_fetch_array($result)){
                    echo "<option value='$row[0]'>$row[0]</option>";
                  }
                ?>
              </select><br>
              <span class="error"> <?php echo $eventackErr;?></span><br>
              <legend for="acknowledgeEvent" style="text-align: center">Yes, I want to delete this event
              <input type="checkbox" name="acknowledgeEvent" style="width: 4%;"/>
              <br><br></legend>
              <input name="deleteEvent" type="submit" value="Submit"/><br><br>
              <hr class = "orange"><br>
            </div>
          </form>
        </fieldset>
      </div>

      <div id="addAdmin" class = "section">
        <fieldset>
          <h3 class="action_title">Add an Admin User</h3><br>
          <form name="addAdmin" method="post"
          action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
            <div>
              <span class="error"> <?php echo $usernameErr;?></span>
              <legend for="adminUsername">Username:
                <input type="txt" name="adminUsername" value=""> </legend>
              <span class="error"> <?php echo $passwordErr;?></span>
              <legend for="adminPassword">Password:
                <input type="txt" name="adminPassword" value=""> </legend>
            </div><br>
            <input name="addAdmin" type="submit" value="Submit"/><br><br>
            <hr class = "orange"><br>
          </form>
        </fieldset>
      </div>
      <div id="deleteAdmin" class = "section">
        <fieldset id = "formtype">
          <h3 class = "action_title"> Delete an Admin User</h3><br>
          <form name="deleteAdmin" method="post"
          action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
          <span class="error"> <?php echo $deleteAdminErr;?></span>
            <div>
              <!--display all admin in a dropdown menu-->
              <select name="deleteAdminSelect">
                <option disabled selected value> -- -- </option>
                <?php
                  $currentAdmin = $_SESSION['adminname'];
                  $result = mysqli_query($conn, "SELECT DISTINCT username FROM ADMIN WHERE username != '$currentAdmin' ORDER BY username ASC");
                  while($row = mysqli_fetch_array($result)){
                    echo "<option value='$row[0]'>$row[0]</option>";
                  }
                ?>
              </select><br>
              <span class="error"> <?php echo $ackAdminErr;?></span><br>
              <legend for="acknowledge" style="text-align: center">Yes, I want to delete this admin
              <input type="checkbox" name="acknowledgeAdmin" style="width: 4%;"/>
              <br><br></legend>
              <input name="deleteAdmin" type="submit" value="Submit"/><br><br>
              <hr class = "orange"><br>
            </div>
          </form>
        </fieldset>
      </div>
      <div id="addGallery" class = "section">
        <fieldset>
          <h3 class="action_title"> Add new gallery photo and description </h3>
          <form name="addGallery" method="post"
          action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" enctype="multipart/form-data">
            <div class = "form-group">
              <span class="error"> <?php echo $galleryNameErr;?></span><br>
              <legend for="galleryName">Photo Name:
                <input type="text" name="galleryName" value=""> </legend>
              <span class="error"> <?php echo $galleryDescriptionErr;?></span><br>
              <textarea rows ="3" cols = "30" type="text" name="galleryDescription" placeholder= "Gallery Description" style = "font-size: 14px;"></textarea><br><br>
              <legend for="data"> Gallery Image
                <input type="file" name="gallery_image" id="gallery_image"></legend>
            </div><br>
            <input type="submit" name = "addGallery" value="Submit"/><br><br>
            <hr class = "orange"><br>
          </form>
        </fieldset>
      </div>

      <div id="galleryDelete" class = "section">
        <fieldset id = "formtype">
          <h3 class = "action_title"> Delete an Gallery Item</h3><br>
          <form name="deleteGallery" method = "post"
          action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
          <span class="error"> <?php echo $eventdeleteErr;?></span>
            <div>
              <!--display all products in a dropdown menu-->
              <select name="galleryDelete">
                <option disabled selected value> -- -- </option>
                <?php
                  $result = mysqli_query($conn, "SELECT DISTINCT name FROM GALLERY");
                  while($row = mysqli_fetch_array($result)){
                    echo "<option value='$row[0]'>$row[0]</option>";
                  }
                ?>
              </select><br>
              <span class="error"> <?php echo $gallaryackErr;?></span><br>
              <legend for="acknowledgeGalleryEvent" style="text-align: center">Yes, I want to delete this photo
              <input type="checkbox" name="acknowledgeGalleryEvent" style="width: 4%;"/>
              <br><br></legend>
              <input name="deleteGallery" type="submit" value="Submit"/><br><br>
              <hr class = "orange"><br>
            </div>
          </form>
        </fieldset>
      </div>

    </div>
  </div>
  </div>
    <div class="sidenav">
      <div id ="info">
        <p id="featured_title"><strong>Featured Product</strong></p>
        <?php
          $result = mysqli_query($conn, "SELECT name, description, image_path, image_height, image_width FROM FEATURED_PRODUCT");
          $row = mysqli_fetch_array($result);
          echo "<p><u>$row[0]</u></p><p>$row[1]</p>";
          echo "<img style = 'height: $row[3]px; width: $row[4]px;' src='$row[2]'>";
         ?>
       </div>
    </div>
    <div class = "footer">
      <p style = "color: white; font-weight: 400"> © 2018 Bonded Materials Company <p>
    </div>
  </body>
</html>
