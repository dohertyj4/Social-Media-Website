<?php

// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'reset_password/PHPMailer/src/Exception.php';
require 'reset_password/PHPMailer/src/PHPMailer.php';
require 'reset_password/PHPMailer/src/SMTP.php';
require 'config/connection_variable.php';

$success_array = array();

// Instantiation and passing `true` enables exceptions
$mail = new PHPMailer(true);

if(isset($_POST["forgot_password_button"])) {

    $emailTo = $_POST["forgot_password_email"];

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
        $mail->Password   = 'Chief1997@';                               // SMTP password
        $mail->SMTPSecure = 'tls';                                  // Enable TLS encryption, `ssl` also accepted
        $mail->Port       = 587;                                    // TCP port to connect to

        //Recipients
        $mail->setFrom('jjdjack123@gmail.com', 'Brainstorm Social');
        $mail->addAddress($emailTo);     // Add a recipient
        $mail->addReplyTo('no-reply@gmail.com ', 'No reply');

        // Content
        $url = "http://" . $_SERVER["HTTP_HOST"] . dirname($_SERVER["PHP_SELF"]) . "/reset_password/reset_password_form/reset_password.php?code=$code";
        $mail->isHTML(true);                                  // Set email format to HTML
        $mail->Subject = 'Password reset link';
        $mail->Body    = "<h1>You requested a password reset</h1>
                                Click <a href='$url'>This Link</a> to do so";
        $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

		$mail->send();
		array_push($success_array, "<span style='color: #14C800;'>Reset password link has been sent to your email!</span><br>");
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }
}

 
?>

