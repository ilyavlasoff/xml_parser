<?php
require_once('Parser.php');
require_once('DBExecutor.php');
$path = './samples';
try {
  $dir = dir($path);
  while(($filename = $dir->read()) !== false) {
    if ($filename === '.' | $filename === '..') continue;
    try {
      $items = Parser::parseFiletoArray($path . '/' . $filename, ['channel'], 'item');
    }
    catch (Exception $ex) {
      echo "Parsing error: file $filename cannot be parsed as XML<br>";
      continue;
    }
    /*ДОБАВИТЬ ДАННЫЕ ДЛЯ ПОДКЛЮЧЕНИЯ*/
    $dbexec = new DBExecutor(/*host*/, /*port*/, /*database name*/, /*user name*/, /*password*/);
    foreach ($items as $item) {
      $dbexec->insertValues(substr($filename, 0, strlen($filename) - 4), $item);
    }
    echo "File $filename parsed!<br>";
  }
  $dir->close();
}
catch(Exception $ex) {
  echo "Error occured: {$ex->getMessage()}";
}
?>
