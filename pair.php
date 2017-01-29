<?php
  /*
    This is just to hold on to code I've seen around

    $friend = (isset($_POST['fID'])) ? $_POST['fID'] : '';
    $warrior = (isset($_POST['wID'])) ? $_POST['wID'] : '';

    try {
      $dbh = new PDO($hostname, $db, $user, $pass);
      foreach($dbh->query('SELECT * from FOO') as $row) {
          print_r($row);
      }
      $dbh = null;
    } catch (PDOException $e) {
      print "Error!: " . $e->getMessage() . "<br/>";
      die();
    }

    This is an example of a secure connection using PDO to establish a username
    $username = PDO::quote($_GET['username']);

   */

  $friend = $_POST['fID'];
  $warrior = $_POST['wID'];

  $hostname = "localhost";
  $user = "root";
  $pass = "openears";
  $db = "openears_official";

  try {
    $dbCheck = new PDO('mysql:host=localhost;dbname=openears_official', $user, $pass);
  } catch (PDOException $e) {
      echo 'Connection failed: ' . $e->getMessage();
  }


  $params = array(':fID' => $friend, ':wID' => $warrior);

  $conn = $dbCheck->prepare('
    SELECT * FROM pairing_record
    WHERE SID_Friend = :fID
    AND SID_Friend = :wID
    AND Date_End IS NOT NULL');


  $conn->execute($params);
  $number_of_rows = $conn->fetchColumn();

  
  if($number_of_rows > 0){
    // Injection in here
    echo("It works, and it exists");
  }
  else {
    echo("It works, and there aren't any!");
  }

  // This is the end of it
  //echo "You sent me " . $friend . " as the friend and " . $warrior . " as the warrior";
?>
