<?php

include 'base.php';

if($_SERVER['REQUEST_METHOD']=="POST") {
	
	$SQL = initSQL();
	$id = verifySessionID($SQL);
	
	// we are logging out
	$sqlquery = "UPDATE accounttable SET SessionID='' WHERE AccountID='".$id."';";
	$sqlresult = $SQL->query($sqlquery);
	
	if($sqlresult) {
		exit("logout_success");
	} else {
		die("logout_failure");
	}
	
} else if($_SERVER['REQUEST_METHOD']=="GET") {
	
	$SQL = initSQL();
	
	// we are logging in, so generate a new session id
	
	function rand_str($len) {
		$palette = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$str = '';
		for($i=0;$i<$len;$i++) {
			$str .= $palette[rand(0,strlen($palette)-1)];
		}
		return $str;
	}
	
	$username = $_GET['username'];
	$sessionid = rand_str(64);
	$sqlquery = "UPDATE accounttable SET SessionID='".$sessionid."' WHERE Username='".$username."';";
	$sqlresult = $SQL->query($sqlquery);
	
	if($sqlresult) {
		exit($sessionid);
	} else {
		die("login_failure");
	}
	
} else {
	
	die("excuse me wut");
	
}

?>