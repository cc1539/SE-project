<?php

include 'base.php';

if($_SERVER['REQUEST_METHOD']=="POST") {
	
	$SQL = initSQL();
	verifySessionID($SQL);
	
	$username = $_POST['username'];
	
	$start_date = $_POST['start_date'];
	$start_time = $_POST['start_time'];
	$end_date = $_POST['end_date'];
	$end_time = $_POST['end_time'];
	
	$res_spot = $_POST['reservation_spot'];
	$sqlquery  = "UPDATE accounttable SET ";
	
	if($res_spot==null) {
		$sqlquery .= "ReservationBegin=NULL, ";
		$sqlquery .= "ReservationEnd=NULL, ";
		$sqlquery .= "ReservationLot=NULL ";
	} else {
		$sqlquery .= "ReservationBegin=CAST('".$start_date." ".$start_time.".00.' AS datetime), ";
		$sqlquery .= "ReservationEnd=CAST('".$end_date." ".$end_time.".00.' AS datetime), ";
		$sqlquery .= "ReservationLot='Hypothetical Parking Lot 2B #".$res_spot."' ";
	}
	$sqlquery .= "WHERE Username='".$username."';";
	
	$sqlresult = $SQL->query($sqlquery);
	
	if($sqlresult) {
		exit("set_success");
	} else {
		die("set_failure");
	}
	
} else if($_SERVER['REQUEST_METHOD']=="GET") {
	
	$SQL = initSQL();
	verifySessionID($SQL);
	
	if(isset($_GET['username'])) {
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
			echo '"begin":"'.$row['ReservationBegin'].'",';
			echo '"end":"'.$row['ReservationEnd'].'",';
			echo '"lot":"'.$row['ReservationLot'].'"}';
			
		}
	} else {
		
		$sqlquery  = "SELECT * FROM accounttable;";
		
		$sqlresult = $SQL->query($sqlquery);
		if(!$sqlresult) {
			die("get_failure");
		} else {
			
			echo "[";
			while($row = $sqlresult->fetch_assoc()) {
				echo '{';
				echo '"begin":"'.$row['ReservationBegin'].'",';
				echo '"end":"'.$row['ReservationEnd'].'",';
				echo '"lot":"'.$row['ReservationLot'].'"},';
			}
			echo ",-1]";
			
		}
		
	}
	
} else {
	
	die("excuse me wut");
	
}

?>