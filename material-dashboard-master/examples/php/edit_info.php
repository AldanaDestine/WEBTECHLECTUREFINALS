<?php
// Include config file
require_once "dbconn.php";
 
// Define variables and initialize with empty values
$firstName = $lastName = $address = $email = $pnumber = $roomNumber = "";
$firstName_err = $lastName_err = $address_err = $email_err = $pnumber_err = $roomNumber_err = "";

 
// Processing form data when form is submitted
if(isset($_POST["tenantID"]) && !empty($_POST["tenantID"])){
    // Get hidden input value
    $tenantID = $_POST["tenantID"];
    
    $input_fname = trim($_POST["firstName"]);
    if(empty($input_fname)){
        $firstName_err = "Please enter a name.";
    } elseif(!filter_var($input_fname, FILTER_VALIDATE_REGEXP, array("options"=>array("regexp"=>"/^[a-zA-Z\s]+$/")))){
        $firstName_err = "Please enter a valid name.";
    } else{
        $firstName = $input_fname;
    }
    
    $input_lname = trim($_POST["lastName"]);
    if(empty($input_lname)){
        $lastName_err = "Please enter a name.";
    } elseif(!filter_var($input_lname, FILTER_VALIDATE_REGEXP, array("options"=>array("regexp"=>"/^[a-zA-Z\s]+$/")))){
        $lastName_err = "Please enter a valid name.";
    } else{
        $lastName = $input_lname;
    }
    $input_address = trim($_POST["address"]);
    if(empty($input_address)){
        $address_err = "Please enter an address.";
    } else{
        $address = $input_address;
    }
   
    $input_email = trim($_POST["email"]);
    if(empty($input_email)){
        $email_err = "Please enter a name.";
    } else{
        $email = $input_email;
    }

    $input_pnumber = trim($_POST["pnumber"]);
    if(empty($input_pnumber)){
        $pnumber_err = "Please enter a number.";
    } else{
        $pnumber = $input_pnumber;
    }
    $input_roomNumber = trim($_POST["roomNumber"]);
    if(empty($input_roomNumber)){
        $roomNumber_err = "Please enter a room number.";
    } else{
        $roomNumber = $input_roomNumber;
    }
    
    // Check input errors before inserting in database
    if(empty($firstName_err) && empty($lastName_err) && empty($address_err) && empty($email_err) &&empty($pnumber_err)&&empty($roomNumber_err)){
        // Prepare an update statement
        $sql = "UPDATE tenantinfo SET firstName=?, lastName=?, address=?, email=?, pnumber=?, roomNumber=? WHERE tenantID=?";
         
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssssssi", $param_fname, $param_lName, $param_address, $param_email,  $param_pnumber, $param_roomNumber, $param_tenantID);
            
            // Set parameters
            $param_fname = $firstName;
            $param_lName = $lastName;


            $param_address = $address;
            $param_email = $email;
            $param_pnumber = $pnumber;
            $param_roomNumber = $roomNumber;
            $param_tenantID = $tenantID;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                //echo " Records updated successfully. Redirect to landing page";
                header("location: ../viewinfo.php");

                exit();
            } else{
                echo "Something went wrong. Please try again later.". mysqli_error($link);

            }
        }
                             // Close statement
        mysqli_stmt_close($stmt);
    }
    
    // Close connection
    mysqli_close($link);
} else{
    // Check existence of id parameter before processing further
    if(isset($_GET["tenantID"]) && !empty(trim($_GET["tenantID"]))){
        // Get URL parameter
        $tenantID =  trim($_GET["tenantID"]);
        
        // Prepare a select statement
        $sql = "SELECT * FROM tenantinfo WHERE tenantID = ?";
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "i", $param_tenantID);
            
            // Set parameters
            $param_tenantID = $tenantID;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                $result = mysqli_stmt_get_result($stmt);
    
                if(mysqli_num_rows($result) == 1){
                    /* Fetch result row as an associative array. Since the result set
                    contains only one row, we don't need to use while loop */
                    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
                    
                    // Retrieve individual field value
                $firstName = $row["firstName"];
                $lastName = $row["lastName"];
                $address = $row["address"];
                $email = $row["email"];
                $pnumber = $row["pnumber"];
                $roomNumber = $row["roomNumber"];
                } else{
                    // URL doesn't contain valid id. Redirect to error page
                    echo "error!";
                    exit();
                }
                
            } else{
                echo "Oops! Something went wrong. Please try again later.". mysqli_error($link);
            }
        }
        
        // Close statement
        mysqli_stmt_close($stmt);
        
        // Close connection
        mysqli_close($link);
    }
      else{
        // URL doesn't contain id parameter. Redirect to error page
        echo "Oops! Something went wrong. Please try again later.";
        exit();
    }
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Record</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        .wrapper{
            width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header">
                        <h2>Update Record</h2>
                    </div>
                    <p>Please edit the input values and submit to update the record.</p>
                    <form action="<?php echo htmlspecialchars(basename($_SERVER['REQUEST_URI'])); ?>" method="post">
                        <div class="form-group <?php echo (!empty($firstName_err)) ? 'has-error' : ''; ?>">
                            <label>First Name</label>
                            <input type="text" name="firstName" class="form-control" value="<?php echo $firstName; ?>">
                            <span class="help-block"><?php echo $firstName_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($lastName_err)) ? 'has-error' : ''; ?>">
                            <label>Last Name</label>
                            <input type="text" name="lastName" class="form-control" value="<?php echo $lastName; ?>">
                            <span class="help-block"><?php echo $lastName_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($user_type_err)) ? 'has-error' : ''; ?>">
                            <label style="color: black;">Address</label>
                            <input type="text" name="address" class="form-control" value="<?php echo $address; ?>">
                            <span class="help-block"><?php echo $address_err;?></span>
                            
                        </div>
                        <div class="form-group <?php echo (!empty($email_err)) ? 'has-error' : ''; ?>">
                            <label>Email</label>
                            <input type="text" name="email" class="form-control" value="<?php echo $email; ?>">
                            <span class="help-block"><?php echo $email_err;?></span>
                        </div>

                        
                        <div class="form-group <?php echo (!empty($pnumber_err)) ? 'has-error' : ''; ?>">
                            <label>Phone Number</label>
                            <input type="text" name="pnumber" class="form-control" value="<?php echo $pnumber; ?>">
                            <span class="help-block"><?php echo $pnumber_err;?></span>
                        </div>

                        <div class="form-group <?php echo (!empty($status_err)) ? 'has-error' : ''; ?>">
                            <label>Room Number</label>
                            <<input type="text" name="roomNumber" class="form-control" value="<?php echo $roomNumber; ?>">
                            <span class="help-block"><?php echo $roomNumber_err;?></span>
                        </div>
                        
                        <div class="modal-footer">
                                <input type="hidden" name="tenantID" value="<?php echo $tenantID; ?>"/>
                              <input type="submit" class="btn btn-primary" value="Submit">
                        <a href="../viewinfo.php" class="btn btn-default">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>