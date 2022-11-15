<?php
require_once './app/models/order.model.php';
require_once './app/views/api.view.php';

class OrderApiController {
    private $model;
    private $view;

    private $data;

    public function __construct() {
        $this->model = new OrderModel();
        $this->view = new ApiView();
        
        // lee el body del request
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    public function getOrders($params = null) {

       // ORDENA POR COLUMNA EN ORDEN ASC O DESC
        $filt = '';       
        if (key_exists('sort', $_GET)){
            $filt = $_GET['sort'];
            if (key_exists('order', $_GET)){
                $filt = $filt . ' '.$_GET['order'];
            }
            $filt = 'ORDER BY ' . $filt;
        } else {
            $filt = 'ORDER BY empresa';
        }

        // TRAE LOS PEDIDOS PENDIENTES/ENVIADOS
        if (key_exists('pending', $_GET)){           
            $filt = 'WHERE enviado=' . 0;
        } else if(key_exists('sending', $_GET )){
            $filt = 'WHERE enviado=' . 1;
        }
        
        $orders = $this->model->getAll($filt);
        $this->view->response($orders);
    }

    public function getOrder($params = null) {
        // obtengo el id del arreglo de params
        $id = $params[':ID'];
        $order = $this->model->get($id);

        // si no existe devuelvo 404
        if ($order)
            $this->view->response($order);
        else 
            $this->view->response("El pedido con el id=$id no existe", 404);
    }

    public function deleteOrder($params = null) {
        $id = $params[':ID'];

        $order = $this->model->get($id);
        if ($order) {
            $this->model->delete($id);
            $this->view->response($order);
        } else 
            $this->view->response("El pedido con el id=$id no existe", 404);
    }

    public function insertOrder($params = null) {
        $order = $this->getData();
        
        if (empty($order->id_cliente) || empty($order->fecha_pedido) || empty($order->forma_pago) || empty($order->detalle)) {
            $this->view->response("Complete los datos", 400);
        } else {
            $id = $this->model->insert($order->id_cliente, $order->fecha_pedido, $order->forma_pago, $order->detalle);
            $this->view->response("EL pedido se insertó con éxito con el id=$id", 201);
        }
    }

    public function updateOrder ($params = null){
        $n_order = $params[':ID'];
        $order=$this->model->get($n_order);       

        if ($order){
            $body=$this->getData();
            $customer=$body->id_cliente;
            $date=$body->fecha_pedido;
            $payment=$body->forma_pago;
            $detail=$body->detalle;
            $send=$body->enviado;
            $pedido=$this->model->update($customer, $date, $payment, $detail, $send, $n_order);
            $this->view->response("La orden id=$n_order fue actualizada con exito", 200);
        } else
        $this->view->response("La orden id=$n_order no existe", 404);
    }

    

}