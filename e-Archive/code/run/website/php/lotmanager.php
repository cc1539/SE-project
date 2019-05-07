<?php

include 'base.php';

$SQL = initSQL();

if($_SERVER['REQUEST_METHOD']=="POST") {
	$sqlquery = '';
	$op = $_POST['op'];
	$name = $_POST['name'];
	switch($op) {
		case "add_lot":
			$sqlquery = "INSERT INTO parkinglots (ParkingLotName,HourlyRate) VALUES ('".$name."',3600);";
		break;
		case "remove_lot":
			$sqlquery = "DELETE FROM parkinglots WHERE ParkingLotName='".$name."';";
		break;
		case "set_rate":
			$sqlquery = "UPDATE parkinglots SET HourlyRate=".$_POST['rate']." WHERE ParkingLotName='".$name."';";
		break;
	}
	$sqlresult = $SQL->query($sqlquery);
	if($sqlresult) {
		exit("post_success");
	} else {
		die("post_failure");
	}
} else if($_SERVER['REQUEST_METHOD']=="GET") {
	// assume we want to get the rate
	
	$name = $_GET['name'];
	$sqlquery = "SELECT * FROM parkinglots WHERE ParkingLotName='".$name."';";
	$sqlresult = $SQL->query($sqlquery);
	
	if($sqlresult) {
		$row = $sqlresult->fetch_assoc();
		if($row) {
			exit($row['HourlyRate']);
		} else {
			die("parking_lot_not_found");
		}
	} else {
		die("get_failure");
	}
} else {
	die("invalid_request");
}

?>