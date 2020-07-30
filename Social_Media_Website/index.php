<?php 
include("includes/header.php");

if(isset($_POST['post'])){

		$post = new Post($con, $userLoggedIn);
		$post->submitPost($_POST['post_text'], 'none');

}



 ?>
	<div class="user_details column">
		<a href="<?php echo $userLoggedIn; ?>">  <img src="<?php echo $user['profile_pic']; ?>"> </a>

		<div class="user_details_left_right">
			<a href="<?php echo $userLoggedIn; ?>">
			<?php 
			echo $user['first_name'] . " " . $user['last_name'];

			 ?>
			</a>
			<br>
			<?php echo "Posts: " . $user['num_posts']. "<br>"; 
			echo "Likes: " . $user['num_likes'];

			?>
		</div>

	</div>

	<div class="main_column column">
		<form class="post_form" action="index.php" method="POST" enctype="multipart/form-data">
			<textarea name="post_text" id="post_text" placeholder="Enter your message here"></textarea>
			<input type="submit" name="post" class="btn btn-primary btn-lg" value="Post">
			<hr>

		</form>

		<div class="posts_area"></div>

		<?php 
			$post = new Post($con, $userLoggedIn);
			$post->loadPosts();
		?>

	</div>

	<div class="user_details_trends column">

		<h4>Popular Topics</h4>

		<div class="trends">
			<?php 
			$query = mysqli_query($con, "SELECT * FROM trends ORDER BY hits DESC LIMIT 9");

			foreach ($query as $row) {
				
				$word = $row['title'];
				$word_dot = strlen($word) >= 14 ? "..." : "";

				$trimmed_word = str_split($word, 14);
				$trimmed_word = $trimmed_word[0];

				echo "<div style'padding: 1px'>";
				echo $trimmed_word . $word_dot;
				echo "<br></div><br>";


			}

			?>
		</div>


	</div>




	</div>
</body>
</html>