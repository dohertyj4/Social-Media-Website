<?php  
require 'config/config.php';
require 'reset_password/reset_password_form/forgot.php';
?>


<html>
<head>
	<title>Welcome to Brainstorm Social!</title>
	<link rel="stylesheet" type="text/css" href="assets/css/register_style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="assets/js/register.js"></script>
</head>
<body>


	<div class="wrapper">

		<div class="login_box">

			<div class="login_header">
				<h1>Brainstorm Social</h1>
				Reset your password below
            </div>
            
            <br>
            
            <div class="container">
			<div class="row">
				<div class="col-md-12 text-center">

				</div>
			</div>
					
            <form method="POST">
                <div class="form-group">
                <?php if(in_array("<div class='alert alert-success' role='alert'>Your password has been successfully reset</div>", $success_array)) echo "<div class='alert alert-success' role='alert'>Your password has been successfully reset</div>";?>
                </div>
                <div class="form-group">
                    <label for="email" class="sr-only">Email: </label>
                    <input type="email" name="email" class="form-control" id="email" autocomplete="off">
                </div>
                <div class="form-group">
                </div>
            </form>

				
			
		</div>



		</div>

	</div>


</body>
</html>