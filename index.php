<?php
session_start();

spl_autoload_register(function ($class){
    $root = dirname(__FILE__);
    $file = $root . '/' . str_replace("\\",'/',$class) . '.php';
    if (is_readable($file)) {
        require $file;
    }
});

$router = new Core\Router();

$router->add('',['controller'=>'Home','action'=>'index','namespace'=>'Home']);
$router->add("{controller}/{action}",['namespace'=>'Home']);
// $router->add("{controller}/{action}");
// $router->add("admin/{controller}/{action}",['namespace'=>'Admin']);
// $router->add("{controller}/{id:\d+}/{action}");


$router->dispatch($_SERVER["QUERY_STRING"]);



?>