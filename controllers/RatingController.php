<?php

use \RestServer\RestException;
require_once('db/dbconnect.php');

class RatingController
{
  private $connection;
  public function __construct() {
    // Initiate Database connection
    $db = new DB();
    $this->connection = $db->getConnection();
  }

  /**
   * Gets the ratings for topics
   *
   * @url GET /ratings
   */
  public function getRating() {
    $conn = $this->connection;
    $result = array();
    $sql = $conn->query("SELECT * FROM `rating_master`");
    if ($sql->num_rows > 0) {
      while($rlt = $sql->fetch_assoc()){
        $result[] = $rlt;
      }
    } else {
      throw new RestException(204);
    }
    return $result;
  }

  /**
   * Insert ratings per topic
   *
   * @url POST /ratings
   */
  public function setRating() {
    $conn = $this->connection;
    // Validate properties
    $errors = array();
    if(!isset($_POST['faculty_id'])){
      $obj = array("field"=>"faculty_id", "message"=>"Please select faculty!");
      array_push($errors, $obj);
    }
    if(!isset($_POST['course_id'])){
      $obj = array("field"=>"course_id", "message"=>"Please select a course!");
      array_push($errors, $obj);
    }
    if(!isset($_POST['topic_id'])){
      $obj = array("field"=>"topic_id", "message"=>"Please select a topic!");
      array_push($errors, $obj);
    }
    if(!isset($_POST['rating'])){
      $obj = array("field"=>"rating", "message"=>"Rating must be greater than 0!");
      array_push($errors, $obj);
    }

    if(count($errors) > 0){
      throw new RestException(500);
    }

    $user_id = $_POST['user_id'];
    $faculty_id = $_POST['faculty_id'];
    $faculty_name = $_POST['faculty_name'];
    $course_id = $_POST['course_id'];
    $course_name = $_POST['course_name'];
    $topic_id = $_POST['topic_id'];
    $rating = $_POST['rating'];
    $date = date('Y-m-d');

    $query = "INSERT INTO `rating_master` (
                                          `USER_ID`, 
                                          `FACULTY_ID`, 
                                          `FACULTY_NAME`, 
                                          `COURSE_ID`, 
                                          `COURSE_NAME`,
                                          `TOPIC_ID`,
                                          `RATING`,
                                          `R_DATE`
                                          ) 
                                          VALUES (
                                                  '$user_id', 
                                                  '$faculty_id', 
                                                  '$faculty_name', 
                                                  '$course_id', 
                                                  '$course_name',
                                                  '$topic_id',
                                                  '$rating',
                                                  '$date'
                                                  )";
    $sql = $conn->query($query);
    if ($sql === TRUE) {
      $result = array();
      $result['USER_ID'] = $user_id;
      $result['FACULTY_ID'] = $faculty_id;
      $result['FACULTY_NAME'] = $faculty_name;
      $result['COURSE_ID'] = $course_id;
      $result['COURSE_NAME'] = $course_name;
      $result['TOPIC_ID'] = $topic_id;
      $result['RATING'] = $rating;
      $result['R_DATE'] = $date;
      return $result;
    } else {
      throw new RestException(500);
    }
  }
}