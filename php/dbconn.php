<?php
$link = mysqli_connect("localhost", "root", "", "webtech_finals");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}