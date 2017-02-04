<?php
  /*
    This is just to hold on to code I've seen around

    $friend = (isset($_POST['fID'])) ? $_POST['fID'] : '';
    $warrior = (isset($_POST['wID'])) ? $_POST['wID'] : '';

  */
  $friend = $_POST['fID'];
  $warrior = $_POST['wID'];
  $reason = $_POST['rsn'];
  $date = date('Y-m-d');

  $hostname = "localhost";
  $user = "root";
  $pass = "openears";
  $db = "openears_official";

  try {
    $dbCheck = new PDO('mysql:host=localhost;dbname=openears_official', $user, $pass);
  } catch (PDOException $e) {
      echo 'Connection failed: ' . $e->getMessage();
  }

  $params = array(':fID' => $friend, ':wID' => $warrior, ':rsn' => $reason, ':date' => $date);
  $paramsF = array(':fID' => $friend);
  $paramsW = array(':wID' => $warrior);


  $remove = $dbCheck->prepare('
    UPDATE pairing_record
       SET End_Reason = :rsn,
           Date_End = :date
     WHERE SID_Friend = :fID AND SID_Warrior = :wID');

  $remove->execute($params);

  $modifyF = $dbCheck->prepare('
    UPDATE person
    SET Num_Pairs = Num_Pairs - 1
    WHERE sid = :fID ');

  $modifyW = $dbCheck->prepare('
    UPDATE person
    SET Num_Pairs = Num_Pairs - 1
    WHERE sid = :wID ');


  $modifyF->execute($paramsF);
  $modifyW->execute($paramsW);

  echo "You sent me: friend-" . $friend . " and warrior-" . $warrior . " and reason-" . $reason . " and date-" . $date;
?>
