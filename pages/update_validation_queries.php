<?php
  //determine whether a file was submitted for upload
  function fileExists($data_or_sds){
    if(empty($_FILES)) {
        return false;
    }
    if(!file_exists($_FILES["$data_or_sds"]["tmp_name"])){
        return false;
    }
    return true;
  }

  function upload($file, $target_file, $upload_type){
    if (move_uploaded_file($file, $target_file)) {
    } else {
        echo "Sorry, there was an error uploading your $upload_type file. ";
    }
  }

  // error messages
  $notifyErr = $notifySuccess = $pNameErr = $pDescriptionErr = $deleteErr = $sdsErr = $categoryErr =  "";
  $pVendorErr = $sql = $featuredErr = $imageInfoErr= $featuredDescErr = $dimensionErr = $eventNameErr = "";
  $eventDescriptionErr = $eventDateErr = $eventTimeErr = $eventLocationErr = $pLinkErr = "";
  $eventackErr = $ackErr = $data_file_sql = $sds_file_sql = $dataLink = $pictureUploadErr ="";
  $deleteAdminErr = $ackAdminErr = $usernameErr = $eventdeleteErr = $passwordErr = $sdsLink ="";
  $cChartUploadErr = $cChartLinkErr = $cChartLinkQ = $cChartLink = "";
  $galleryNameErr = $galleryDescriptionErr = $galleryInfoErr = $galleryEvent= $gallaryackErr = "";

  if ($_SERVER["REQUEST_METHOD"] == "POST"){
    $writeQ = $featuredQ = $deleteQ = $eventdeleteQ = $sdsLinkQ = false;
    $eventQ = $addAdminQ = $deleteAdminQ = $dataLinkQ = false;
    $addGalleryQ = $deleteGalleryQ = $product_picture_upload= false;

    if (!empty($_POST['addProduct'])){
      $writeQ = true;
      if (empty($_POST["pName"])) {
        $pNameErr = "Product name required";
        $writeQ = false;
      }else {
        $pName = str_replace('\'', "", $_POST["pName"]);
        //check that product name is unique
        $exists_result = mysqli_query($conn, "SELECT * FROM PRODUCT WHERE name = '$pName'");
        if(mysqli_num_rows($exists_result)>0){
          $pNameErr = "Product name must be unique";
          $writeQ = false;
        }
      }
      if(empty($_POST["vendor"])){
        $pVendorErr = "Vendor Required";
        $writeQ = false;
      }else{
        $vendor = str_replace('\'', "", $_POST["vendor"]);
      }
      if (empty($_POST["pDescription"])) { // if the field element name is empty
        $pDescriptionErr = "Product description required";
        $writeQ = false;
      } else {
        $pDescription = str_replace('\'', "", $_POST["pDescription"]);
      }
      if (empty($_POST["category"])){
        $categoryErr = "Product category required";
        $writeQ = false;
      }else {
        $category = str_replace('\'', "", $_POST["category"]);
      }
      if(!empty($_POST["sdsLink"])){
        $sdsLinkQ = true;
        $sdsLink = $_POST["sdsLink"];
      }
      if(!empty($_POST["dataLink"])){
        $dataLinkQ = true;
        $dataLink = $_POST["dataLink"];
      }
      if(!empty($_POST["cChartLink"])){
        $cChartLinkQ = true;
        $cChartLink = $_POST["cChartLink"];
      }
      if(fileExists("pictureUpload")){
        //upload the new product picture
        $path = $_FILES['pictureUpload']['name'];
        $ext = pathinfo($path, PATHINFO_EXTENSION);
        if(!($ext == "jpg" || $ext == "png")){
          $pictureUploadErr = "File must be .png or .jpg";
          $writeQ = false;
        }else{
          $product_picture_upload = true;
          $picture_file = '../assets/product_pictures/'.$_POST["pName"].".$ext";
          upload($_FILES["pictureUpload"]["tmp_name"], $picture_file, $ext);
        }
      }
    }

    if (!empty($_POST['changeFeature'])){
      $featuredQ = true;
      $image_upload = false;
      if(empty($_POST["fp_description"])){
        $featuredQ = false;
        $featuredErr = "Choose a product to feature";
      }else{
        $featured = $_POST["featured_name"];
      }
      if(empty($_POST["fp_description"])){
        $featuredDescErr = "Featured product description required";
        $featuredQ = false;
      } else {
        $featuredDesc = $_POST["fp_description"];
      }

      if(fileExists("featured_image")){
        $image_upload = true;
        $path = $_FILES['featured_image']['name'];
        $ext = pathinfo($path, PATHINFO_EXTENSION);
        if(!($ext == "jpg" || $ext == "png")){
          $imageInfoErr = "File must be .png or .jpg";
          $writeQ = false;
        }else if(empty($_POST["image_height"]) || empty($_POST["image_width"])) {
          $imageInfoErr = "Image height, width, and file type required";
          $featuredQ = false;
        }else{
          //delete old featured image
          $files = glob('../assets/featured_image/*'); // get all file names
          foreach($files as $file){ // iterate files
            if(is_file($file)) unlink($file); // delete file
          }
          //upload the new featured image
          $featured_file = '../assets/featured_image/featured_image'.".$ext";
          upload($_FILES["featured_image"]["tmp_name"], $featured_file, $ext);
          // move_uploaded_file($_FILES["featured_image"]["tmp_name"], $featured_file);
          $image_height = $_POST["image_height"];
          $image_width = $_POST["image_width"];
        }
      }
    }

    if (!empty($_POST['addGallery'])){
      $addGalleryQ = true;
      $gallery_image_upload = false;
      if(empty($_POST["galleryDescription"])){
        $addGalleryQ  = false;
        $galleryDescriptionErr = "Please enter a Description";
      }else{
        $galleryDescription = str_replace('\'', "", $_POST["galleryDescription"]);
      }
      if(empty($_POST["galleryName"])){
        $galleryNameErr = "Please enter a name";
        $addGalleryQ = false;
      } else {
        $galleryName = str_replace('\'', "", $_POST["galleryName"]);
      }
    }

    if (!empty($_POST['deleteGallery'])){
      $deleteGalleryQ  = true;
      if(empty($_POST["galleryDelete"])){
        $gallerydeleteErr = "Choose an gallery item to delete";
        $deleteGalleryQ = false;
      }else{
        if(isset($_POST['acknowledgeGalleryEvent'])){
          $galleryEvent = $_POST["galleryDelete"];
        }else{
          $gallaryackErr = "Please acknowledge your gallary deletion";
          $deleteGalleryQ  = false;
        }
      }
    }

    if (!empty($_POST['deleteProduct'])){
      $deleteQ = true;
      if(empty($_POST["delete"])){
        $deleteErr = "Choose a product to delete";
        $deleteQ = false;
      }else{
        if(isset($_POST['acknowledge'])){
          $delete = $_POST["delete"];
          //delete old product image
          $files = glob('../assets/product_pictures/'.$_POST["delete"].'*');
          foreach($files as $file){ // iterate files
            if(is_file($file)) unlink($file); // delete file
          }
        }else{
          $ackErr = "Please acknowledge your product deletion";
          $deleteQ = false;
        }
      }
    }

    if (!empty($_POST['deleteEvent'])){
      $eventdeleteQ  = true;
      if(empty($_POST["eventDelete"])){
        $eventdeleteErr = "Choose an event to delete";
        $eventdeleteQ = false;
      }else{
        if(isset($_POST['acknowledgeEvent'])){
          $deleteEvent = $_POST["eventDelete"];
        }else{
          $eventackErr = "Please acknowledge your event deletion";
          $eventdeleteQ  = false;
        }
      }
    }

    if (!empty($_POST['createEvent'])){
      $eventQ = true;
      if (empty($_POST["eventName"])) {
        $eventNameErr = "Event name required";
        $eventQ = false;
      } else {
        $eventName = str_replace('\'', "", $_POST["eventName"]);
      }
      if (empty($_POST["eventDescription"])) {
        $eventDescriptionErr = "Event description required";
        $eventQ = false;
      } else {
        $eventDescription = str_replace('\'', "", $_POST["eventDescription"]);
      }
      if (empty($_POST["eventLocation"])) {
        $eventLocationErr = "Event location required";
        $eventQ = false;
      } else {
        $eventLocation = str_replace('\'', "", $_POST["eventLocation"]);
      }
      if (empty($_POST["eventDate"])) {
        $eventDateErr = "Event date required";
        $eventQ = false;
      } else {
        $eventDate = str_replace('\'', "", $_POST["eventDate"]);
      }
      if (empty($_POST["eventTime"])) {
        $eventTimeErr = "Event time required";
        $eventQ = false;
      } else {
        $eventTime = str_replace('\'', "", $_POST["eventTime"]);
      }
    }

    if (!empty($_POST['addAdmin'])){
      $addAdminQ = true;
      if(empty($_POST["adminUsername"])){
        $usernameErr = "Enter a username";
        $addAdminQ = false;
      }else{
        $username = str_replace('\'', "", $_POST["adminUsername"]);
      }
      if(empty($_POST["adminPassword"])){
        $passwordErr = "Enter a password";
        $addAdminQ = false;
      }else{
        $password = str_replace('\'', "", $_POST["adminPassword"]);
      }
    }

    if (!empty($_POST['deleteAdmin'])){
      $deleteAdminQ = true;
      if(empty($_POST["deleteAdminSelect"])){
        $deleteAdminErr = "Choose an Admin to delete";
        $deleteAdminQ = false;
      }else{
        if(isset($_POST['acknowledgeAdmin'])){
          $deleteAdmin = $_POST["deleteAdminSelect"];
        }else{
          $ackAdminErr = "Please acknowledge your deletion";
          $deleteAdminQ = false;
        }
      }
    }

    if ($writeQ == true){
      // SQl Injection Prevention
      $pName = mysqli_real_escape_string($conn, $pName);
      $pDescription = mysqli_real_escape_string($conn, $pDescription);
      $category = mysqli_real_escape_string($conn, $category);
      $vendor = mysqli_real_escape_string($conn, $vendor);
      $sdsLink = mysqli_real_escape_string($conn, $sdsLink);
      $dataLink = mysqli_real_escape_string($conn, $dataLink);
      $sql = "INSERT INTO PRODUCT (name, description, category, vendor) VALUES ('$pName', '$pDescription', '$category', '$vendor');";
    }

    if ($eventQ == true){
      $eventName = mysqli_real_escape_string($conn, $eventName);
      $eventDescription = mysqli_real_escape_string($conn, $eventDescription);
      $eventDate = mysqli_real_escape_string($conn, $eventDate);
      $eventTime = mysqli_real_escape_string($conn, $eventTime);
      $eventLocation = mysqli_real_escape_string($conn, $eventLocation);
      $sql .= "INSERT INTO EVENT (name, description, location, day, specifiedtime)
      VALUES ('$eventName', '$eventDescription', '$eventLocation', '$eventDate', '$eventTime')";
    }

    // if they want to update featured product, change featured attribute to field with specified name
    if ($featuredQ == true){
      $featured = mysqli_real_escape_string($conn, $featured);
      $description = mysqli_real_escape_string($conn, $featuredDesc);
      mysqli_query($conn, "DELETE FROM FEATURED_PRODUCT WHERE fid > 0");
      $sql .= "INSERT INTO FEATURED_PRODUCT (name, description, image_path, image_height, image_width) VALUES ('$featured', '$description'";
      if($image_upload){
        $sql .= ", '../assets/featured_image/featured_image.$ext', $image_height, $image_width)";
      }else{
        $sql .= ", null, null, null)";
      }
    }

    if ($deleteQ == true){
      $delete = mysqli_real_escape_string($conn, $delete);
      $result = mysqli_query($conn, "SELECT pid FROM PRODUCT WHERE name = '$delete';");
      $id = mysqli_fetch_row($result);
      echo $id[0];
      mysqli_query($conn, "DELETE FROM PRODUCT_IMAGE WHERE product_id = $id[0];");
      $sql .= "DELETE FROM PRODUCT WHERE pid = $id[0]";
    }

    if ($eventdeleteQ == true){
      $deleteEvent = mysqli_real_escape_string($conn, $deleteEvent);
      $result = mysqli_query($conn, "SELECT eid FROM EVENT WHERE name = '$deleteEvent';");
      $id = mysqli_fetch_row($result);
      $sql .= "DELETE FROM EVENT WHERE eid = $id";
    }

    //execute query for product data/sds/color chart file(s) if necessary
    if ($addGalleryQ == true){
      $galleryName = mysqli_real_escape_string($conn, $galleryName);
      $galleryDescription = mysqli_real_escape_string($conn, $galleryDescription);
      $last_gallery_id = mysqli_fetch_row(mysqli_query($conn, "SELECT MAX(gid) FROM GALLERY"));
      if(fileExists("gallery_image")){
        $ext = pathinfo($_FILES["gallery_image"]["name"], PATHINFO_EXTENSION);
        $gallery_target_file = "../assets/gallery_photos/$last_gallery_id.$ext";
        upload($gallery_target_file, $_FILES["gallery_image"], "data");
        $data_file_sql = "INSERT INTO GALLERY(name, description, gallery_path)
        VALUES ('$galleryName', '$galleryDescription', '$gallery_target_file');";
        if(!mysqli_query($conn, $data_file_sql)) {
          echo "Error: ". mysqli_error($conn);
        }
      }
    }

    if ($deleteGalleryQ == true){
      $galleryEvent  = mysqli_real_escape_string($conn, $galleryEvent);
      $result = mysqli_query($conn, "SELECT gid FROM GALLERY WHERE name = '$galleryEvent';");
      $id = mysqli_fetch_row($result);
      mysqli_query($conn, "DELETE FROM GALLERY WHERE gid = $id");
    }

    if ($addAdminQ == true){
      $username = mysqli_real_escape_string($conn, $username);
      $password = mysqli_real_escape_string($conn, $password);
      $result = mysqli_query($conn, "SELECT aid FROM ADMIN WHERE username = '$username';");
      if(mysqli_num_rows($result) == 0){
        $sql .= "INSERT INTO ADMIN (username, password) VALUES ('$username', '$password')";
      }else{
        $addAdminQ = false;
        $usernameErr = "Username already taken";
      }
    }

    if ($deleteAdminQ == true){
      $deleteAdmin = mysqli_real_escape_string($conn, $deleteAdmin);
      $result = mysqli_query($conn, "SELECT aid FROM ADMIN WHERE username = '$deleteAdmin';");
      $id = mysqli_fetch_row($result);
      $sql .= "DELETE FROM ADMIN WHERE aid = $id;";
    }

    if ($writeQ || $eventQ || $featuredQ || $deleteQ || $addAdminQ || $deleteAdminQ
    || $eventdeleteQ || $addGalleryQ || $deleteGalleryQ){
      $notifySuccess = "<p class = 'success'>Success!</p><br><br>";
      if($sql != ""){
        //execute main query string
        if(!mysqli_query($conn, $sql)){
          echo "Error: ". mysqli_error($conn);
        }else{
          //get the id of the last inserted product
          $result = mysqli_query($conn, "SELECT MAX(pid) FROM PRODUCT");
          $inserted_id = mysqli_fetch_row($result);

          if($writeQ){
             if($dataLinkQ){
              $data_file_sql .= "INSERT INTO PRODUCT_IMAGE (name, image_path, product_id)
              VALUES('data', '$dataLink', $inserted_id)";
              if(!mysqli_query($conn, $data_file_sql)) {
                echo "Error: ". mysqli_error($conn);
              }
            }
            if($sdsLinkQ){
              $sds_file_sql .= "INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES('sds', '$sdsLink', $inserted_id)";
              if(!mysqli_query($conn, $sds_file_sql)) {
                echo "Error: ". mysqli_error($conn);
              }
            }
            if($cChartLinkQ){
              $cChart_sql = "INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES('color chart', '$sdsLink', $inserted_id)";
              if(!mysqli_query($conn, $cChart_sql)) {
                echo "Error: ". mysqli_error($conn);
              }
            }
            if($product_picture_upload){
              // $ext = pathinfo($_FILES["dataFileToUpload"]["name"], PATHINFO_EXTENSION);
              // $data_target_file = "./assets/data/$inserted_id.$ext";
              // upload($data_target_file, $_FILES["dataFileToUpload"], "data");
              $data_file_sql = "INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES ('picture', '$picture_file', $inserted_id)";
              if(!mysqli_query($conn, $data_file_sql)) {
                echo "Error: ". mysqli_error($conn);
              }
            }
          }
        }
      }
    }else{
      $notifyErr = "<p class = 'error2'>Error</p><br><br>";
    }
  }
?>
