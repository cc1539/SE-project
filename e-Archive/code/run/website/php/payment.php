<?php
/**
 * written, tested, and debugged by: Christopher Cheng
 */

$id = $_REQUEST['sessionid'];

include 'base.php';

$SQL = initSQL();

if($_SERVER['REQUEST_METHOD']=="POST") {
	
	// for now just set it to zero straight away without any cc verification
	$sqlquery = "UPDATE accounttable SET PayAmount=0 WHERE SessionID='".$id."';";
	$sqlresult = $SQL->query($sqlquery);

	if($sqlresult) {
		exit("payment_success");
	} else {
		die("payment_failure");
	}
	
} else if($_SERVER['REQUEST_METHOD']=="GET") {
	
	$sqlquery = "SELECT * FROM parkinglots WHERE ParkingLotName='Hypothetical Parking Lot 2B';";
	$sqlresult = $SQL->query($sqlquery);
	$rate = ($sqlresult->fetch_assoc()['HourlyRate'])/3600.;
	
	$expression = "TimeDiff(now(),LatestEnterTime)*".$rate;
	$sqlquery = "SELECT ".$expression." FROM accounttable WHERE SessionID='".$id."';";
	
	$sqlresult = $SQL->query($sqlquery);
	
	if($sqlresult) {
		exit($sqlresult->fetch_assoc()[$expression]);
	} else {
		die("get_failure");
	}
	
} else {
	die("invalid_method");
}

?>