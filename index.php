<?php

require __DIR__ . '/RestServer/RestServer.php';
require __DIR__ . '/controllers/TestController.php';
require __DIR__ . '/controllers/UserController.php';
require __DIR__ . '/controllers/FacultyController.php';
require __DIR__ . '/controllers/CourseController.php';
require __DIR__ . '/controllers/RatingController.php';
require __DIR__ . '/controllers/TopicController.php';

$server = new RestServer\RestServer('debug');
$server->addClass('TestController');
$server->addClass('UserController');
$server->addClass('FacultyController');
$server->addClass('CourseController');
$server->addClass('RatingController');
$server->addClass('TopicController');
$server->handle();