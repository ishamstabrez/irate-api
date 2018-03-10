<?php

use \RestServer\RestException;
require_once('db/dbconnect.php');

class FacultyController
{
  private $connection;
  public function __construct() {
    // Initiate Database connection
    $db = new DB();
    $this->connection = $db->getConnection();
  }

  private function getCourses($faculties) {
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

    for ($i=0; $i < count($faculties); $i++) {
      $faculties[$i]['courses'] = array();
      for ($j=0; $j < count($rels); $j++) { 
        if ($rels[$j]['FACULTY_ID'] === $faculties[$i]['FACULTY_ID']) {
          array_push($faculties[$i]['courses'], $rels[$j]['COURSE_ID']);
        }
      }
    }
    
    return $faculties;
  }

  /**
   * Gets the faculties by id or all faculty list
   *
   * @url GET /faculties
   */
  public function getFaculty() {
    // if (!isset($_SERVER['Authorization'])) {
    //   throw new RestException(401);
    // }
    $conn = $this->connection;
    $result = array();
    $sql = $conn->query("SELECT * FROM `faculty_master`");
    if ($sql->num_rows > 0) {
      while($rlt = $sql->fetch_assoc()){
        $result[] = $rlt;
      }
    } else {
      throw new RestException(204);
    }
    $faculties = $this->getCourses($result);
    return $faculties;
  }
}