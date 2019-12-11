<?php
session_start();

?>
<?php
 $conn = mysqli_connect("localhost","root","","webtech_finals");
 $role="";
if (isset($_POST["btnLogin"])) {
	# code...
	$email = $_POST["email"];
	$password = $_POST["password"];
	$query = "SELECT * FROM users WHERE email='$email' AND password='$password'";
	$result = mysqli_query($conn, $query);
	if (mysqli_num_rows($result) > 0) {
		# code...
		while ($row = mysqli_fetch_assoc($result)) {
			# code...
			if (($row["user_type"] == "Super Admin") && ($row["status"] == "Active")) {
				# code...
				//$_SESSION['LoginUser'] = $row["email"];
				$_SESSION['login'] = true;
				header('Location: ../pages/super_admin/dashboard.php');
			}else if(($row["user_type"] == "Admin")  && ($row["status"] == "Active")){
				$_SESSION['login'] = true;
				header('Location: ../pages/admin_user/dashboard.php');
			}else if(($row["user_type"] == "Client")  && ($row["status"] == "Active")){
				// $_SESSION['LoginUser'] = $row["email"];
				// header('Location: user.php');
				$_SESSION['login'] = true;
				header('Location: ../pages/client_user/client-home.php');
			}else{
				echo '<script type="text/javascript">'; 
				echo 'alert("Invalid Account!");'; 
				echo 'window.location.href = "../index.php";';
				echo '</script>';

			}
			
		}
	}else{
			echo '<script type="text/javascript">'; 
			echo 'alert("Invalid Account!");'; 
			echo 'window.location.href = "../index.php";';
			echo '</script>';
		
	}
}
?>