<?php

/**

  * File: forgot.php

  *

  * @Desc: When user correctly submits email an email is sent with a secret link to change user password. Query is sent to database then deleted once user creates new password.

  * @Author:  Jack Doherty jdoherty@winslowtg.com

  * Date: 03/01/2019

  
  */

// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../PHPMailer/src/Exception.php';
require '../PHPMailer/src/PHPMailer.php';
require '../PHPMailer/src/SMTP.php';
require '../../config/connection_variable.php';

$success_array = array();

// Instantiation and passing `true` enables exceptions
$mail = new PHPMailer(true);

if(isset($_POST["email"])) {

    $emailTo = $_POST["email"];

    $code = uniqid(true);
    $query = mysqli_query($con, "INSERT INTO reset_password (code,email) VALUES('$code', '$emailTo')");

    if(!$query) {
        exit("Error");
    }

    $mail = new PHPMailer(true);

    try {
        //Server settings
        $mail->isSMTP();                                            // Set mailer to use SMTP
        $mail->Host       = 'smtp.gmail.com';  // Specify main and backup SMTP servers
        $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
        $mail->Username   = 'jjdjack123@gmail.com';                     // SMTP username
        $mail->Password   = '***';                               // SMTP password
        $mail->SMTPSecure = 'tls';                                  // Enable TLS encryption, `ssl` also accepted
        $mail->Port       = 587;                                    // TCP port to connect to

        //Recipients
        $mail->setFrom('jjdjack123@gmail.com', 'WTG_Tools');
        $mail->addAddress($emailTo);     // Add a recipient
        $mail->addReplyTo('no-reply@gmail.com ', 'No reply');

        // Content
        $url = "http://" . $_SERVER["HTTP_HOST"] . dirname($_SERVER["PHP_SELF"]) . "/reset_password.php?code=$code";
        $mail->isHTML(true);                                  // Set email format to HTML
        $mail->Subject = 'Password reset link';
        $mail->Body    = "<h1>You requested a password reset</h1>
                                Click <a href='$url'>This Link</a> to do so";
        $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

		$mail->send();
		array_push($success_array, "<div class='alert alert-success' role='alert'>Reset password link has been sent to your email</div>");
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }
}

 
?>


<!DOCTYPE html>
<html class="no-js">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Minimal and Clean Sign up / Login and Forgot Form by FreeHTML5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />

	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/style.css">

	<script src="js/modernizr-2.6.2.min.js"></script>


	</head>
	<body>

		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">

				</div>
			</div>
			<div class="row">

				<div class="col-md-4 col-md-offset-4">
					
					<form method="POST" class="fh5co-form animate-box" data-animate-effect="fadeIn">
						<h2>Forgot Password</h2>
						<div class="form-group">
						<?php if(in_array("<div class='alert alert-success' role='alert'>Reset password link has been sent to your email</div>", $success_array)) echo "<div class='alert alert-success' role='alert'>Reset password link has been sent to your email</div>";?>
						</div>
						<div class="form-group">
							<label for="email" class="sr-only">Email</label>
							<input type="email" name="email" class="form-control" id="email" placeholder="Email" autocomplete="off">
						</div>
						<div class="form-group">
							<input type="submit" name="submit" value="Send Email" class="btn btn-primary">
						</div>
					</form>

				</div>
			</div>
		</div>
	

	<script src="js/jquery.min.js"></script>

	<script src="js/bootstrap.min.js"></script>

	<script src="js/jquery.placeholder.min.js"></script>

	<script src="js/jquery.waypoints.min.js"></script>

	<script src="js/main.js"></script>

	</body>
</html>

