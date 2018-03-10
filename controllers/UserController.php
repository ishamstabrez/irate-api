<?php

use \RestServer\RestException;
require_once('db/dbconnect.php');

class UserController
{
  private $connection;
  public function __construct() {
    // Initiate Database connection
    $db = new DB();
    $this->connection = $db->getConnection();
  }

  /**
   * Check if user exists
   * If user exists check if password is correct
   */
  private function validateUser ($user = null, $password = null) {
    $conn = $this->connection;
    $result = array();
    $userquery = "SELECT * FROM `user_master` WHERE `USER_NAME`='$user'";
    $sql = $conn->query($userquery);
    if ($sql->num_rows > 0) {
      $obj = mysqli_fetch_object($sql);
      $vars = get_object_vars($obj);
      if ($vars['PASSWORD'] === $password) {
        $result['status'] = 200;
        $result['message'] = 'Ok';
      } else {
        $result['status'] = 302;
        $result['message'] = 'Incorrect password';
      }
    } else {
      $result['status'] = 404;
      $result['message'] = "Not found";
    }
    return $result;
  }

  private function validateEmail ($email = null) {
    $conn = $this->connection;
    $result = array();
    $query = "SELECT * FROM `user_master` WHERE `EMAIL_ID`='$email'";
    $sql = $conn->query($query);
    if ($sql->num_rows > 0) {
      $result['status'] = 200;
      $result['message'] = "Email exists.";
    } else {
      $result['status'] = 404;
      $result['message'] = "Not found";
    }
    return $result;
  }

  /**
   * Logs in a user with the given username and password POSTed. Though true
   * REST doesn't believe in sessions, it is often desirable for an AJAX server.
   *
   * @url POST /login
   */
  public function login() {
    $conn = $this->connection;
    $username = $_POST['username'];
    $password = md5($_POST['password']);
    $check = $this->validateUser($username, $password);
    if ($check['status'] === 200) {
      $query = "SELECT * FROM `user_master` WHERE `USER_NAME`='$username' AND `PASSWORD`='$password'";
      $sql = $conn->query($query);
      if($sql->num_rows > 0){
        $obj = mysqli_fetch_object($sql);
      }
    } else {
      if ($check['status'] === 404) {
        $message = "Incorrect username";
      }
      if ($check['status'] === 302) {
        $message = "Incorrect password";
      }
      throw new RestException(400, $message);
    }
    return $obj;
  }

  /**
   * Saves a user to the database
   *
   * @url POST /register
   */
  public function register() {
    $conn = $this->connection;
    $user_name = $_POST['user_name'];
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $email = $_POST['email'];
    $mobile = $_POST['mobile'];
    $password = md5($_POST['password']);

    $validate = $this->validateUser($user_name, $password);
    if ($validate['status'] !== 404) {
      throw new RestException(400, "Username already exists");
    }

    $validateEmail = $this->validateEmail($email);
    if ($validateEmail['status'] !== 404) {
      throw new RestException(400, "Email already exists");
    }

    $query = "INSERT INTO `user_master` (`USER_ID`,`USER_NAME`,`U_FIRST_NAME`,`U_LAST_NAME`,`EMAIL_ID`,`MOB_NO`,`PASSWORD`)";
    $query = $query . " VALUES (NULL,'$user_name','$first_name','$last_name','$email','$mobile','$password')";

    $sql = $conn->query($query);
    if ($sql === TRUE) {
      $obj = array();
      $user_id = $conn->insert_id;
      $userquery = "SELECT * FROM `user_master` WHERE `USER_ID`='$user_id'";
      $userfetch = $conn->query($userquery);
      if($userfetch->num_rows > 0){
        $obj = mysqli_fetch_object($userfetch);
      }
      return $obj;
    } else {
      throw new RestException(500);
    }
  }

  /**
   * Gets the user by id or current user
   *
   * @url GET /users
   * @url GET /users/$id
   */
  public function getUser($id = null) {
    $conn = $this->connection;
    $result = array();
    $sql = $conn->query("SELECT * FROM `user_master`");
    if($sql->num_rows > 0){
      while($rlt = $sql->fetch_assoc()){
        $result[] = $rlt;
      }
    } else {
      throw new RestException(204);
    }
    return $result;
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