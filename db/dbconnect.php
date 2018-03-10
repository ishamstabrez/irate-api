<?php
define('SERVER', 'localhost');
define('USERNAME', 'root');
define('PASSWORD', '');
define('DATABASE', 'irate');

class DB {
  private $connection;
  function __construct(){
    $this->connection = mysqli_connect(SERVER, USERNAME, PASSWORD, DATABASE);
    if (mysqli_connect_errno()) {
      throw new Exception("Connection failed", mysqli_connect_errno());
    }
  }

  function getConnection() {
      return $this->connection;
  }
}
?>