<?php

function initSQL() {
	
	$server = "remotemysql.com";
	$dbname = "Vneao4rF2A";
	$sqluser = "Vneao4rF2A";
	$sqlpass = "r1Futn7r47";
	$SQL = new mysqli($server,$sqluser,$sqlpass,$dbname);
	
	if($SQL->connect_error) {
		die("Failed to access MySQL database: " . $SQL->connect_error);
	}
	
	return $SQL;
}

function verifySessionID($SQL) {
	if(isset($_REQUEST['sessionid'])) {
		$sqlquery = "SELECT * FROM accounttable WHERE SessionID='".$_REQUEST['sessionid']."';";
		$sqlresult = $SQL->query($sqlquery);
		if($sqlresult) {
			$account = $sqlresult->fetch_assoc();
			if($sqlresult->fetch_assoc()) {
				die("db_compromised");
			}
			return $account['AccountID'];
		} else {
			die("Access Denied");
		}
	} else {
		die("Access Denied");
	}
}

?>