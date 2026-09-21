<?php 

$host = "127.0.0.1"; 
$port = 80801; 

$socket = socket_create(AF_INET, SOCK_STREAM, 0) or die('Not create'); 
$connect = socket_connect($socket, $host, $port) or die('not connect'); 

$msg  ="hello sarmad from admin i am user"; 
socket_write($socket, $msg, strlen($msg)); 

?>