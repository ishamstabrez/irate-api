<?php

use \RestServer\RestException;
require_once('db/dbconnect.php');

class CourseController
{
  private $connection;
  public function __construct() {
    // Initiate Database connection
    $db = new DB();
    $this->connection = $db->getConnection();
  }

  private function getFaculties($courses) {
    $conn = $this->connection;
    $rels = array();
    $query = $conn->query("SELECT * FROM `faculty_course_master`");
    if ($query->num_rows > 0) {
      while($rlt = $query->fetch_assoc()){
        $rels[] = $rlt;
      }
    } else {
      throw new RestException(204);
    }

    for ($i=0; $i < count($courses); $i++) {
      $courses[$i]['faculties'] = array();
      for ($j=0; $j < count($rels); $j++) { 
        if ($rels[$j]['COURSE_ID'] === $courses[$i]['COURSE_ID']) {
          array_push($courses[$i]['faculties'], $rels[$j]['FACULTY_ID']);
        }
      }
    }
    
    return $courses;
  }

  /**
   * Gets the courses by id or all course list
   *
   * @url GET /courses
   */
  public function getCourse() {
    $conn = $this->connection;
    $result = array();
    $sql = $conn->query("SELECT * FROM `course_master`");
    if ($sql->num_rows > 0) {
      while($rlt = $sql->fetch_assoc()){
        $result[] = $rlt;
      }
    } else {
      throw new RestException(204);
    }
    $courses = $this->getFaculties($result);
    return $courses;
  }
}