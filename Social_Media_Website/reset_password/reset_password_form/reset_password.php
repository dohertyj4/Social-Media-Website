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
<html>
<head>
	<title>Welcome to Wix Social!</title>
	<link rel="stylesheet" type="text/css" href="../../assets/css/register_style.css">
</head>
	<body>


		<div class="wrapper">

			<div class="login_box">

				<div class="login_header">
					<h1>Wix Social</h1>
				</div>

				<br>

				<form method="POST" class="fh5co-form animate-box" data-animate-effect="fadeIn">
					<h2>Forgot Password</h2>
					<div class="form-group">
					<?php if(in_array("<div class='alert alert-success' role='alert'>Your password has been successfully reset</div>", $success_array)) echo "<div class='alert alert-success' role='alert'>Your password has been successfully reset</div>";?>
					</div>
					<div class="form-group">
						<label for="email" class="sr-only">Enter new password here: </label>
						<input type="password" name="password" class="form-control" id="email" autocomplete="off">
					</div>
					<div class="form-group">
						<input type="submit" name="submit" value="Update Password" class="btn btn-primary">
						<br>
						<a href="../../register.php" id="goback" class="goback">Go back to registration page</a>
					</div>
				</form>

			</div>

		</div>


	</body>
</html>



