<?php

include 'base.php';

if($_SERVER['REQUEST_METHOD']=="POST") {
	
	$SQL = initSQL();
	$id = verifySessionID($SQL);
	
	$sqlquery = "UPDATE accounttable SET ";
	if(isset($_POST['fname'])) { $sqlquery .= "FirstName='"			.$_POST['fname']."',"; }
	if(isset($_POST['lname'])) { $sqlquery .= "LastName='"			.$_POST['lname']."',"; }
	if(isset($_POST['atype'])) { $sqlquery .= "AccountType='"		.$_POST['atype']."',"; }
	if(isset($_POST['ccnum'])) { $sqlquery .= "CrecitCardNum='"		.$_POST['ccnum']."',"; }
	if(isset($_POST['eaddr'])) { $sqlquery .= "EmailAddress='"		.$_POST['eaddr']."',"; }
	if(isset($_POST['haddr'])) { $sqlquery .= "HomeAddress='"		.$_POST['haddr']."',"; }
	if(isset($_POST['lpnum'])) { $sqlquery .= "LicensePlateNum='"	.$_POST['lpnum']."',"; }
	if(isset($_POST['mname'])) { $sqlquery .= "MiddleName='"		.$_POST['mname']."',"; }
	if(isset($_POST['passw'])) { $sqlquery .= "Password='"			.$_POST['passw']."',"; }
	if(isset($_POST['rsveb'])) { $sqlquery .= "ReservationBegin=CAST('"	.$_POST['rsveb']."' AS datetime),"; }
	if(isset($_POST['rsvee'])) { $sqlquery .= "ReservationEnd=CAST('"	.$_POST['rsvee']."' AS datetime),"; }
	if(isset($_POST['rsvel'])) { $sqlquery .= "ReservationLot='"	.$_POST['rsvel']."',"; }
	$sqlquery .= "AccountID=".$id.""; // this line does nothing
	$sqlquery .= " WHERE AccountID=".$id.";";
	
	$sqlresult = $SQL->query($sqlquery);
	if(!$sqlresult) {
		die("post_failure");
	} else {
		exit("post_success");
	}
	
} else if($_SERVER['REQUEST_METHOD']=="GET") {
	
	$SQL = initSQL();
	$id = verifySessionID($SQL);
	
	if(isset($_GET['accountid'])) {
		$id = $_GET['accountid'];
	}
	
	$sqlquery  = "SELECT * FROM accounttable WHERE AccountID=".$id.";";
	
	$sqlresult = $SQL->query($sqlquery);
	if(!$sqlresult) {
		die("get_failure");
	} else {
		
		$row = $sqlresult->fetch_assoc();
		if($sqlresult->fetch_assoc()) {
			die("db_compromised");
		}
		
		echo '{';
		echo '"uname":"'.$row['Username'].'",';
		echo '"fname":"'.$row['FirstName'].'",';
		echo '"lname":"'.$row['LastName'].'",';
		echo '"haddr":"'.$row['HomeAddress'].'",';
		echo '"eaddr":"'.$row['EmailAddress'].'",';
		echo '"lpnum":"'.$row['LicensePlateNum'].'",';
		echo '"atype":"'.$row['AccountType'].'",';
		echo '"ccnum":"'.$row['CreditCardNum'].'",';
		echo '"mname":"'.$row['MiddleName'].'",';
		echo '"passw":"'.$row['Password'].'",';
		echo '"rsveb":"'.$row['ReservationBegin'].'",';
		echo '"rsvel":"'.$row['ReservationLot'].'",';
		echo '"rsvee":"'.$row['ReservationEnd'].'"}';
		
	}
	
} else {
	
	die("only POST and GET requests allowed");
	
}

?>