<?php

use \RestServer\RestException;
require_once('db/dbconnect.php');

class TopicController
{
  private $connection;
  public function __construct() {
    // Initiate Database connection
    $db = new DB();
    $this->connection = $db->getConnection();
  }
  /**
   * Gets the list of topics
   *
   * @url GET /topics
   */
  public function getTopic() {
    $conn = $this->connection;
    $result = array();
    $sql = $conn->query("SELECT * FROM `topic_master`");
    if ($sql->num_rows > 0) {
      while($rlt = $sql->fetch_assoc()){
        $result[] = $rlt;
      }
    } else {
      throw new RestException(204);
    }
    return $result;
  }
}