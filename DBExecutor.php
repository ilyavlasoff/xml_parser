<?php
class DBExecutor {
  private $pdo;
  private static function GetConn($host, $port, $db, $username, $password): PDO {
    $dsn="pgsql:host={$host};port={$port};dbname={$db};user={$username};password={$password}";
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ];
        return new PDO($dsn, $username, $password, $options);
  }
  public function __construct($host, $port, $db, $username, $password) {
    $this->pdo = self::GetConn($host, $port, $db, $username, $password);
  }
  public function insertValues(string $tableName, array $data) {
    $colNames = implode(',', array_keys($data));
    $params = ':' . implode(',:', array_keys($data));
    $query = "INSERT INTO $tableName($colNames) VALUES ($params);";
    $expr = $this->pdo->prepare($query);
    $expr->execute($data);
    return $expr->rowCount();
  }
}
?>
