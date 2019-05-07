<?php
/**
 * written, tested, and debugged by: Christopher Cheng
 */

include 'base.php';

$SQL = initSQL();

if($_SERVER['REQUEST_METHOD']=="POST"){
	
	$lot = $_POST['lot'];
	$lpnum = $_POST['lpnum'];
	
	$sqlquery = "INSERT INTO qrcode (ParkingLot,LicensePlateNum) VALUES ('".$lot."','".$lpnum."');";
	$sqlresult = $SQL->query($sqlquery);
	if($sqlresult) {
		exit("post_success");
	} else {
		die("post_failure");
	}
	
} else if($_SERVER['REQUEST_METHOD']=="GET") {
	
	$lot = $_GET['lot'];
	
	$sqlquery = "SELECT * FROM qrcode WHERE ParkingLot='".$lot."';";
	$sqlresult = $SQL->query($sqlquery);
	if($sqlresult) {
		$row = $sqlresult->fetch_assoc();
		if($row) {
			$sqlquery = "DELETE FROM qrcode WHERE LicensePlateNum='".$row['LicensePlateNum']."';";
			$sqlresult = $SQL->query($sqlquery);
			exit($row['LicensePlateNum']);
		} else {
			exit("no_cars_found");
		}
	} else {
		die("get_failure");
	}
	
} else {
	die("invalid_request");
}

?>