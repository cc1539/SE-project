<?php

function transmit_valid_input($data) {
	if($data!==trim($data)) { return false; }
	if($data!==stripslashes($data)) { return false; }
	if($data!==htmlspecialchars($data)) { return false; }
	return $data;
}

$user = transmit_valid_input($_REQUEST['username']);
$pass = transmit_valid_input($_REQUEST['password']);
$pass2 = transmit_valid_input($_REQUEST['repeat_password']);
if(!$user || !$pass || !$pass2) {
	exit("invalid_chars");
}
if($pass!=$pass2) {
	exit("pass_nomatch");
}

include 'base.php';

$SQL = initSQL();

$sqlquery = "SELECT * FROM accounttable WHERE
	Username='" . $user . "';";
$sqlresult = $SQL->query($sqlquery);

if(!$sqlresult) {
	exit("query_failed_0");
}

if($sqlresult->num_rows==0) {
	
	$sqlquery = "INSERT INTO accounttable
		(Username,Password,AccountType) VALUES
		('".$user."','".$pass."','BASIC');";
	$sqlresult = $SQL->query($sqlquery);
	
	$SQL->close();
	
	if($sqlresult) {
		exit("account_created");
	} else {
		exit("query_failed_1");
	}
	
} else if($sqlresult->num_rows==1) {
	$SQL->close();
	exit("account_already_exists");
} else {
	$SQL->close();
	exit("db_compromised");
}

?>