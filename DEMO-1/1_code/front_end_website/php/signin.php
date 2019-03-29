<?php

function transmit_valid_input($data) {
	if($data!==trim($data)) { return false; }
	if($data!==stripslashes($data)) { return false; }
	if($data!==htmlspecialchars($data)) { return false; }
	return $data;
}

$user = transmit_valid_input($_REQUEST['username']);
$pass = transmit_valid_input($_REQUEST['password']);
if(!$user || !$pass) {
	exit("invalid_chars");
}

$server = "localhost";
$dbname = "id8888855_accounts";
$sqluser = "id8888855_root";
$sqlpass = "a1d5m3i5n";
$SQL = new mysqli($server,$sqluser,$sqlpass,$dbname);

if($SQL->connect_error) {
	# attempt alternative credentials
	$sqluser = "root";
	$sqlpass = "";
	$SQL = new mysqli($server,$sqluser,$sqlpass,$dbname);
}

if($SQL->connect_error) {
	exit("Failed to access MySQL database: " . $SQL->connect_error);
}

$sqlquery = "SELECT * FROM accounttable WHERE
	Username='" . $user . "' AND
	Password='" . $pass . "';";

$sqlresult = $SQL->query($sqlquery);

if(!$sqlresult) {
	exit("invalid_query_2");
}

if($sqlresult->num_rows==0) {
	exit("account_not_found");
} else if($sqlresult->num_rows==1) {
	
	function rand_str($len) {
		$palette = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$str = '';
		for($i=0;$i<$len;$i++) {
			$str .= $palette[rand(0,strlen($palette)-1)];
		}
		return $str;
	}
	
	$sessionid = rand_str(255);
	$sqlquery = "UPDATE accounttable SET SessionID='".$sessionid."' WHERE Username='".$user."';";
	$sqlresult = $SQL->query($sqlquery);
	
	exit("account_found " . $sessionid);
	
} else {
	exit("db_compromised");
}

?>