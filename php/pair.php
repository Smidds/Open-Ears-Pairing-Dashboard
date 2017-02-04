<?php
  /*
    This is just to hold on to code I've seen around

    $friend = (isset($_POST['fID'])) ? $_POST['fID'] : '';
    $warrior = (isset($_POST['wID'])) ? $_POST['wID'] : '';

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
  $paramsF = array(':fID' => $friend);
  $paramsW = array(':wID' => $warrior);

  $addition = $dbCheck->prepare('
    INSERT INTO pairing_record
    (SID_Friend, SID_Warrior, Date_Start, Date_End)
    VALUES (:fID, :wID, now(), NULL)');

  $modifyF = $dbCheck->prepare('
    UPDATE person
    SET Friend_Is_Paired = 1
    WHERE sid = :fID ');

  $modifyW = $dbCheck->prepare('
    UPDATE person
    SET Warrior_Is_Paired = 1
    WHERE sid = :wID ');

  $addition->execute($params);
  $modifyF->execute($paramsF);
  $modifyW->execute($paramsW);

  echo "Successfully updated!";
?>
