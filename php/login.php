<?php
session_start();

?>
<?php
 $conn = mysqli_connect("localhost","root","","webtechlecture");
 $role="";
if (isset($_POST["btnLogin"])) {
	# code...
	$username = $_POST["username"];
	$password = $_POST["password"];
	$query = "SELECT * FROM personnel_accounts WHERE username='$username' AND password='$password'";
	$result = mysqli_query($conn, $query);
	if (mysqli_num_rows($result) > 0) {
		# code...
		while ($row = mysqli_fetch_assoc($result)) {
			# code...
			if (($row["type"] == "Personnel")) {
				# code...
				//$_SESSION['LoginUser'] = $row["email"];
				$_SESSION['login'] = true;
				header('Location: ../material-dashboard/pages/viewinfo.php');
			}else{
				echo '<script type="text/javascript">'; 
				echo 'alert("Invalid Account!");'; 
				echo 'window.location.href = "../index.html";';
				echo '</script>';

			}
			
		}
	}else{
			echo '<script type="text/javascript">'; 
			echo 'alert("Invalid Account!");'; 
			echo 'window.location.href = "../index.html";';
			echo '</script>';
		
	}
}
?>