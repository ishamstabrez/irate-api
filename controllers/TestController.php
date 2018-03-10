<?php

use \RestServer\RestException;
require_once('db/dbconnect.php');

class TestController
{
  private $connection;
  public function __construct() {
    // Initiate Database connection
    $db = new DB();
    $this->connection = $db->getConnection();
  }

  /**
   * Returns a JSON string object to the browser when hitting the root of the domain
   *
   * @url GET /
   */
  public function test() {
    return "Hello World";
  }

  /**
   * Throws an error
   * 
   * @url GET /error
   */
  public function throwError() {
    throw new RestException(401, "Empty password not allowed");
  }
}