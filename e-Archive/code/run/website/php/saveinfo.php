<?php
/**
 * written, tested, and debugged by: Christopher Cheng
 */

include 'base.php';

if($_SERVER['REQUEST_METHOD']=="POST") {
	
	$SQL = initSQL();
	$id = verifySessionID($SQL);
	
	function transmit_valid_input($data) {
		//if($data!==trim($data)) { return false; }
		//if($data!==stripslashes($data)) { return false; }
		//if($data!==htmlspecialchars($data)) { return false; }
		return $data;
	}
	
	$firstName = transmit_valid_input($_POST['fname']);
	$lastName = transmit_valid_input($_POST['lname']);
	$homeAddress = transmit_valid_input($_POST['haddr']);
	$emailAddress = transmit_valid_input($_POST['eaddr']);
	$licensePlateNum = transmit_valid_input($_POST['lpnum']);
	$creditCardNum = transmit_valid_input($_POST['ccnum']);
	
	// verify input
	/*
	if(!ctype_alnum($licensePlateNum)) {
		die("invalid_license_plate");
	}
	if(!filter_var($emailAddress,FILTER_VALIDATE_EMAIL)) {
		die("invalid_email_address");
	}
	*/
	
	$sqlquery  = "UPDATE accounttable SET ";
	$sqlquery .= "FirstName='".$firstName."',";
	$sqlquery .= "LastName='".$lastName."',";
	$sqlquery .= "HomeAddress='".$homeAddress."',";
	$sqlquery .= "EmailAddress='".$emailAddress."',";
	$sqlquery .= "LicensePlateNum='".$licensePlateNum."',";
	$sqlquery .= "CreditCardNum='".$creditCardNum."'";
	$sqlquery .= " WHERE AccountID=".$id.";";
	
	$sqlresult = $SQL->query($sqlquery);
	if(!$sqlresult) {
		die("post_failure");
	} else {
		exit("post_success");
	}
	
} else if($_SERVER['REQUEST_METHOD']=="GET") {
	
	$SQL = initSQL();
	verifySessionID($SQL);
	
	$username = $_GET['username'];
	
	$sqlquery  = "SELECT * FROM accounttable WHERE Username='".$username."';";
	
	$sqlresult = $SQL->query($sqlquery);
	if(!$sqlresult) {
		die("get_failure");
	} else {
		
		$row = $sqlresult->fetch_assoc();
		if($sqlresult->fetch_assoc()) {
			die("db_compromised");
		}
		
		echo '{';
		echo '"fname":"'.$row['FirstName'].'",';
		echo '"lname":"'.$row['LastName'].'",';
		echo '"haddr":"'.$row['HomeAddress'].'",';
		echo '"eaddr":"'.$row['EmailAddress'].'",';
		echo '"lpnum":"'.$row['LicensePlateNum'].'",';
		echo '"ccnum":"'.$row['CreditCardNum'].'"}';
		
	}
	
} else {
	
	die("excuse me wut");
	
}

?>