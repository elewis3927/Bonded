<?php
require '../vendor/autoload.php'; // If you're using Composer (recommended)
include 'AWS_connect.php';
include 'sendgridConnect.php';
session_start();
//strings to hold errors, displayed if there is an error with the field
$contact_first_name_error = $contact_last_name_error = $contact_company_error = "";
$contact_email_error = $contact_phone_error = $contact_message_error = "";
$contact_sent_error = $contact_sent_success = $notifySuccess = $notifyErr = "";

$app_first_name_error = $app_last_name_error = $app_document_error=  "";
$select_app_type_error = $app_sent_error = $app_sent_success = "";

//determine whether a file was uploaded
function fileUploaded(){
  if(empty($_FILES)) {
      return false;
  }
  if(!file_exists($_FILES["application"]["tmp_name"])){
      return false;
  }
  return true;
}

if(isset($_POST["app_first_name"])){
  $error_free = true;
  if(strlen($_POST['app_first_name']) == 0){
    $app_first_name_error= "Enter first name";
    $error_free = false;
  }
  if(strlen($_POST['app_last_name']) == 0){
    $app_last_name_error = "Enter last name";
    $error_free = false;
  }
  if(!fileUploaded()){
    $app_document_error = "Upload your application";
    $error_free = false;
  }else{
    //only allow pdf files to be uploaded
    $imageFileType = strtolower(pathinfo($_FILES["application"]["name"],PATHINFO_EXTENSION));
    if($imageFileType != "pdf"){
      $app_document_error = "Application must be a pdf";
      $error_free = false;
    }
  }
  if(!isset($_POST["job_type"])){
    $select_app_type_error = "Select an application type";
    $error_free = false;
  }
  if($error_free){
    $subject_string = $_POST["job_type"]." Application: ".$_POST['app_last_name'].", ".$_POST['app_first_name'];
    $message_string = $_POST['app_first_name']." ".$_POST['app_last_name']." submitted a job application.";
    $email = new \SendGrid\Mail\Mail();
    $email->setFrom("zackrossman10@gmail.com", "Bonded Applicant");
    // $email->addTo("zrossman20@cmc.edu", "Example User");
    $email->addTo("bondedmaterialsco@gmail.com", "Bonded Admin");
    $email->setSubject($subject_string);
    $email->addContent("text/plain", $message_string);

    $att1 = new SendGrid\Mail\Attachment();
    $att1->setContent(base64_encode(file_get_contents($_FILES["application"]["tmp_name"])));
    $att1->setType("application/pdf");
    $appName = $_POST['app_last_name'].$_POST['app_first_name']."application.pdf";
    $att1->setFilename($appName);
    $att1->setDisposition("attachment");
    $email->addAttachment( $att1);
    $sendgrid = new \SendGrid($apiKey);
    // $sendgrid = new \SendGrid(getenv('SENDGRID_API_KEY'));
    try {
      $response = $sendgrid->send($email);
      if($response->statusCode() == 202){
        $notifySuccess = "<p class = 'success'>Application Submitted</p><br>";
      }else{
        $notifyErr = "<p class = 'error2'>Failed to Submit Application</p><br>";

      }
      // print_r($response->headers());
      // print $response->body() . "\n"; // SendGrid specific errors are found here
    } catch (Exception $e) {
      // echo 'Caught exception: ',  $e->getMessage(), "\n";
      $notifyErr = "<p class = 'error2'>Failed to Submit Application</p><br>";
    }
  }else{
    $notifyErr = "<p class = 'error2'>Error</p><br>";
  }
}

if(isset($_POST["contact"])){
  $error_free = true;
  if(strlen($_POST['con_first_name']) == 0){
    $contact_first_name_error = "Enter first name";
    $error_free = false;
  }
  if(strlen($_POST['con_last_name']) == 0){
    $contact_last_name_error = "Enter last name";
    $error_free = false;
  }
  if(strlen($_POST['con_company']) == 0){
    $contact_company_error = "Enter company name";
    $error_free = false;
  }
  if(!filter_var($_POST['con_email'], FILTER_VALIDATE_EMAIL)){
    $contact_email_error = "Enter valid email";
    $error_free = false;
  }
  if(strlen($_POST['con_phone']) < 10){
    $contact_phone_error = "Enter valid phone number";
    $error_free = false;
  }
  if(strlen($_POST['con_message']) == 0){
    $contact_message_error = "Enter a message";
    $error_free = false;
  }
  if($error_free){
    $message_string = "First Name: ".$_POST['con_first_name']."\n\n";
    $message_string .= "Last Name:  ".$_POST['con_last_name']."\n\n";
    $message_string .= "Company: ".$_POST['con_company']."\n\n";
    $message_string .= "Email: ".$_POST['con_email']."\n\n";
    $message_string .= "Phone: ".$_POST['con_phone']."\n\n";
    $message_string .= "Message: ".$_POST['con_message']."\n\n";
    $subject_string = "Customer Contact: ".$_POST['con_first_name']." ".$_POST['con_last_name'];
    $email = new \SendGrid\Mail\Mail();
    $email->setFrom("zackrossman10@gmail.com", "Bonded Customer");
    $email->addTo("bondedmaterialsco@gmail.com", "Bonded Admin");
    $email->setSubject($subject_string);
    $email->addContent("text/plain", $message_string);
    $sendgrid = new \SendGrid($apiKey);

    // $sendgrid = new \SendGrid(getenv('SENDGRID_API_KEY'));
    try {
      $response = $sendgrid->send($email);
      if($response->statusCode() == 202){
        $notifySuccess = "<p class = 'success'>Message Sent</p><br>";
      }else{
        $notifyErr = "<p class = 'error2'>Failed to Send Message</p><br><br>";
      }
    // print_r($response->headers());
    // print $response->body() . "\n"; // SendGrid specific errors are found here
    } catch (Exception $e) {
      // echo 'Caught exception: ',  $e->getMessage(), "\n";
      $notifyErr = "<p class = 'error2'>Failed to Send Message</p><br><br>";
    }
  }else{
    $notifyErr = "<p class = 'error2'>Error</p><br><br>";
  }
}

//reset post array
$_POST = array();

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bonded Materials</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="../style-sheets/style_navbar.css">
  <link rel="stylesheet" href="../style-sheets/style_contact.css">
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
        <li id = "selected" class="nav-item container-fluid">
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
<div id="notify" style="width: 100%">
  <?php echo $notifyErr;
        echo $notifySuccess?>
</div>

<div class = "instructions" style="margin: 2rem;">
<h3>We're always looking for new employees!</h3>
<p style="text-align: left">Want to apply? Find info and application forms below -- find more details on the application process <a href = "../assets/jobApps/bondedAppInstructions.pdf"> <b>here <b></a>.<p>
</div>
<div class = "container">
  <div class = "section" style = "width: 50%;">
    <h2><span id = "underline">Submit an Application</strong></h2><br>
      <form id = "app_form" method = "post" enctype="multipart/form-data">
        <span class = 'error'><?php echo $app_first_name_error?></span>
        <legend for="app_first_name">First Name:
        <input type="text" name="app_first_name"> </legend>
        <span class = 'error'><?php echo $app_last_name_error?></span>
        <legend for="app_last_name">Last Name:
        <input type="text" name="app_last_name"> </legend>
        <span class = 'error'><?php echo $app_document_error;?></span>
        <legend for="sds">Application:
        <input type="file" name="application" id="application"></legend>
        <span class = 'error'><?php echo $select_app_type_error;?></span>
        <legend for="job_type" id = "app_type">Application Type:
        <input type="radio" id="General" value = "General" name="job_type" style="width: 4%;"/>
        <label for= "general">General</label>
        <input type="radio" id="Driver" value = "Driver" name="job_type" style="width: 5%;"/>
        <label for="driver">Driver</label></legend><br>
        <input id = "submit" type = "submit" name = "application">
      </form>
      <br></br>
  </div>
  <div class = "section" style="margin-top: 1%">
    <div id = "application_info">
      <h4><u>Job Information</u></h4>
      <p style = "color:orange;" ><a href="../assets/jobApps/driver_posting.pdf" download><strong>CDL-B Info </strong></a><p>
      <p style = "color:orange;" ><a href="../assets/jobApps/warehouse_posting.pdf" download><strong>Warehouse Info</strong></a></p>
      <p style = "color:orange;" ><a href="../assets/jobApps/inside_sales_posting.pdf" download><strong>Sales Info</strong></a></p>
      <h4 id = "extra_margin"><u>Job Applications</u></h4>
      <p style = "color:orange;" ><a href="../assets/jobApps/general_employment_app.pdf" download><strong>General App</strong></a></p>
      <p style="color:orange;"><a href="../assets/jobApps/driver_employment_app.pdf" download><strong>Driver App </strong></a></p>
    </div>
  </div>
</div>
<hr style="width: 50%">
<br>
<div class = "container">
  <div class = "section" style="width: 50%;">
    <h2><span id = "underline">Leave us a message</span></h2><br>
      <form id = "contact_form" method = "post" action="contact.php">
        <span class = 'error'><?php echo $contact_first_name_error?></span>
        <legend for="con_first_name">First Name:
        <input type="text" name="con_first_name"> </legend>
        <span class = 'error'><?php echo $contact_last_name_error?></span>
        <legend for="con_last_name">Last Name:
        <input type="text" name="con_last_name"> </legend>
        <span class = 'error'><?php echo $contact_company_error?></span>
        <legend for="con_company">Company:
        <input type="text" name="con_company"> </legend>
        <span class = 'error'><?php echo $contact_email_error?></span>
        <legend for="con_email">Email:
        <input type="text" name="con_email"> </legend>
        <span class = 'error'><?php echo $contact_phone_error?></span>
        <legend id="phone" for="con_phone">Phone:
        <input type="text" name="con_phone"> </legend>
        <span class = 'error'><?php echo $contact_message_error?></span><br>
        <legend id="message" type="text" for="con_message">
        <textarea rows ="5" cols = "30" name="con_message" placeholder= "Message" style = "font-size: 14px;"></textarea></legend><br>
        <input id = "submit" type = "submit" name ="contact" style="margin-right: 8%;">
      </form>
  </div>
  <div class = "section" style="margin-top: 1%;">
    <div id = "contact_info">
      <h4><u>Distribution Centers</u></h4>
      <strong><p style="color:orange;"> Kalihi, Hawaii <p/></strong>
      <p>  150 Puuhale Rd. <br> Honolulu, HI 96819 <br> ph:(808) 832-1155</p>
      <strong><p style="color:orange;"> Kona, Hawaii</p></strong>
      <p>73-5568 Maiau St. <br> Bay 2 & 3, Kailua-Kona, Hawaii 96740 <br> ph:(808) 326-2477 </p>
      <br><h4><u>Manufacturing Center</u></h4>
      <strong><p style="color:orange;"> Kapolei, Hawaii <p/></strong>
      <p>  91-400 Komohana St. <br> Kapolei, HI 96707 <br> ph:(808) 673-2000</p>
  </div>
</div>
<br><br><br>
<div class = "footer">
  <p style = "color: white; font-weight: 400"> © 2018 Bonded Materials Company <p>
</div>
</body>
</html>
