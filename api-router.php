<?php
require_once './libs/Router.php';
require_once './app/controllers/order-api.controller.php';


$router = new Router();


$router->addRoute('pedidos', 'GET', 'OrderApiController', 'getOrders');
$router->addRoute('pedidos/:ID', 'GET', 'OrderApiController', 'getOrder');
$router->addRoute('pedidos/:ID', 'DELETE', 'OrderApiController', 'deleteOrder');
$router->addRoute('pedidos', 'POST', 'OrderApiController', 'insertOrder');
$router->addRoute('pedidos/:ID', 'PUT', 'OrderApiController', 'updateOrder');



$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);