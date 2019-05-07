<?php
/**
 * written, tested, and debugged by: Christopher Cheng
 */

// this file should only be accessible to the backend software
// that detects a car and recognizes its license plate number.

include 'base.php';

if($_SERVER['REQUEST_METHOD']=="POST") {
	
	$SQL = initSQL();
	
	function getAccountID($SQL) {
		
		$sqlquery = "SELECT AccountID FROM accounttable WHERE LicensePlateNum='".$_POST['lpnum']."';";
		$sqlresult = $SQL->query($sqlquery);
		if(!$sqlresult) {
			die("post_failure");
		}
		
		$row = $sqlresult->fetch_assoc();
		if($sqlresult->fetch_assoc()) {
			die("db_compromised");
		}
		
		return $row['AccountID'];
	}
	
	if($_POST['activity']=="enter") {
		
		$accountid = getAccountID($SQL);
		
		$parking_lot = "Hypothetical Parking Lot 2B";
		$parking_spot = $_POST['spot'];
		
		$sqlquery = "SELECT * FROM parkinfo WHERE AccountID='".$accountid."';";
		$sqlresult = $SQL->query($sqlquery);
		if($sqlresult) {
			if($sqlresult->fetch_assoc()) {
				die("already_entered");
			}
		} else{
			die("post_failure");
		}
		
		$sqlquery = "UPDATE accounttable SET LatestEnterTime=now(),ParkingLotName='".$parking_lot."' WHERE AccountID='".$accountid."';";
		$sqlresult = $SQL->query($sqlquery);
		if(!$sqlresult) {
			die("time_log_failure");
		}
		
		$sqlquery  = "INSERT INTO parkinfo (ParkingLot,ParkingSpot,AccountID) ";
		$sqlquery .= "VALUES ('".$parking_lot."',".$parking_spot.",".$accountid.");";
		$sqlresult = $SQL->query($sqlquery);
		if($sqlresult) {
			exit("post_success");
		} else {
			die("post_failure");
		}
		
	} else if($_POST['activity']=="leave") {
		
		$accountid = getAccountID($SQL);
		
		$sqlquery = "SELECT * FROM parkinglots WHERE ParkingLotName='Hypothetical Parking Lot 2B';";
		$sqlresult = $SQL->query($sqlquery);
		$rate = ($sqlresult->fetch_assoc()['HourlyRate'])/3600.;
		
		$sqlquery = "UPDATE accounttable SET PayAmount=PayAmount+TimeDiff(now(),LatestEnterTime)*".$rate.",ParkingLotName=NULL WHERE AccountID=".$accountid.";";
		$sqlresult = $SQL->query($sqlquery);
		if(!$sqlresult) {
			die("time_log_failure");
		}
		
		$parking_lot = "Hypothetical Parking Lot 2B";
		$sqlquery  = "DELETE FROM parkinfo WHERE AccountID='".$accountid."';";
		$sqlresult = $SQL->query($sqlquery);
		if($sqlresult) {
			exit("post_success");
		} else {
			die("post_failure");
		}
		
	}
	
} else if($_SERVER['REQUEST_METHOD']=="GET") {
	
	$SQL = initSQL();
	
	$parking_lot = "Hypothetical Parking Lot 2B";
	$sqlquery = "SELECT * FROM parkinfo WHERE ParkingLot='".$parking_lot."';";
	$sqlresult = $SQL->query($sqlquery);
	
	if($sqlresult) {
		echo "[";
		while($row=$sqlresult->fetch_assoc()) {
			echo '{"id":'.$row['AccountID'].',"spot":'.$row['ParkingSpot'].'},';
		}
		echo "-1]";
	} else {
		die("empty");
	}
	
} else {
	
	die("only POST and GET requests allowed");
	
}

?>