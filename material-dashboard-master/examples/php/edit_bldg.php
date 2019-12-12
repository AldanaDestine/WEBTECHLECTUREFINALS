<?php
// Include config file
require_once "dbconn.php";
 
// Define variables and initialize with empty values
$roomNumber = $roomRemarks = $status = "";
$roomNumber_err = $roomRemarks_err = $status_err = "";

 
// Processing form data when form is submitted
if(isset($_POST["roomID"]) && !empty($_POST["roomID"])){
    // Get hidden input value
    $roomID = $_POST["roomID"];
    
    $input_status = trim($_POST["status"]);
    if(empty($input_status)){
        $status_err = "Please select a status.";
    } else{
        $status = $input_status;
    }
    $input_roomRemarks = trim($_POST["roomRemarks"]);
    if(empty($input_roomRemarks)){
        $roomRemarks_err = "Please enter a remarks.";
    } else{
        $roomRemarks = $input_roomRemarks;
    }
    
    // Check input errors before inserting in database
    if(empty($roomNumber_err) && empty($roomRemarks_err) && empty($status_err)){
        // Prepare an update statement
        $sql = "UPDATE bldginfo SET roomNumber=?, roomRemarks=?, status=? WHERE roomID=?";
         
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "sssi", $param_roomNumber, $param_roomRemarks, $param_status, $param_roomID);
            
            // Set parameters
            $param_roomNumber = $roomNumber;
            $param_roomRemarks = $roomRemarks;
            $param_status = $status;
            $param_roomID = $roomID;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                //echo " Records updated successfully. Redirect to landing page";
                header("location: ../viewbldg.php");

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
    if(isset($_GET["roomID"]) && !empty(trim($_GET["roomID"]))){
        // Get URL parameter
        $roomID =  trim($_GET["roomID"]);
        
        // Prepare a select statement
        $sql = "SELECT * FROM bldginfo WHERE roomID = ?";
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "i", $param_roomID);
            
            // Set parameters
            $param_roomID = $roomID;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                $result = mysqli_stmt_get_result($stmt);
    
                if(mysqli_num_rows($result) == 1){
                    /* Fetch result row as an associative array. Since the result set
                    contains only one row, we don't need to use while loop */
                    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
                    
                    // Retrieve individual field value
                $roomNumber = $row["roomNumber"];
                $roomRemarks = $row["roomRemarks"];
                $status = $row["status"];
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
                            <label>Status:</label>
                            <select name = "status">
                            <option>Vacant</option>
                            <option>Occupied</option>
                        </select>
                            <span class="help-block"><?php echo $status_err;?></span>
                                                    
                        </div>
                        <div class="form-group <?php echo (!empty($lastName_err)) ? 'has-error' : ''; ?>">
                            <label>Remarks</label>
                            <input type="text" name="roomRemarks" class="form-control" value="<?php echo $roomRemarks; ?>">
                            <span class="help-block"><?php echo $roomRemarks_err;?></span>
                        </div>

                        <div class="modal-footer">
                                <input type="hidden" name="roomID" value="<?php echo $roomID; ?>"/>
                              <input type="submit" class="btn btn-primary" value="Submit">
                        <a href="../viewbldg.php" class="btn btn-default">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>