<?php 

require '../../config/connection_variable.php';

$success_array = array();

if(!isset($_GET["code"])) {
    exit("Can't find page");
}

$code = $_GET["code"];

$getEmailQuery = mysqli_query($con, "SELECT email FROM reset_password WHERE code='$code'");

if(mysqli_num_rows($getEmailQuery) == 0) {
    exit("Can't find page");
}

if(isset($_POST["password"])) {
$pw = $_POST["password"];
$pw = md5($pw);

$row = mysqli_fetch_array($getEmailQuery);
$email = $row["email"];

$query = mysqli_query($con, "UPDATE users SET password='$pw' WHERE email='$email'");

array_push($success_array, "<div class='alert alert-success' role='alert'>Your password has been successfully reset</div>");

if($query) {
    $query = mysqli_query($con, "DELETE FROM reset_password WHERE code='$code'");
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
						<?php if(in_array("<div class='alert alert-success' role='alert'>Your password has been successfully reset</div>", $success_array)) echo "<div class='alert alert-success' role='alert'>Your password has been successfully reset</div>";?>
						</div>
						<div class="form-group">
							<label for="email" class="sr-only">Email</label>
							<input type="password" name="password" class="form-control" id="email" placeholder="New password" autocomplete="off">
						</div>
						<div class="form-group">
							<input type="submit" name="submit" value="Update Password" class="btn btn-primary">
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