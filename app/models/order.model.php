<?php

class OrderModel {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_orders;charset=utf8', 'root', '');
    }

    public function getAll($filt) {
       
        $query = $this->db->prepare("SELECT myorder.*, customer.empresa as empresa FROM myorder JOIN customer ON myorder.id_cliente = customer.id_cliente $filt ");
        $query->execute();

        $orders = $query->fetchAll(PDO::FETCH_OBJ); 
        
        return $orders;
    }

    public function get($id) {
        $query = $this->db->prepare("SELECT * FROM myorder WHERE n_pedido = ?");
        $query->execute([$id]);
        $order = $query->fetch(PDO::FETCH_OBJ);
        
        return $order;
    }

    public function insert($id, $date, $payment, $detail) {
        $query = $this->db->prepare("INSERT INTO myorder (id_cliente, fecha_pedido, forma_pago, detalle, enviado) VALUES (?, ?, ?, ?, ?)");
        $query->execute([$id, $date, $payment, $detail, false]);

        return $this->db->lastInsertId();
    }

    function delete($id) {
        $query = $this->db->prepare('DELETE FROM myorder WHERE n_pedido = ?');
        $query->execute([$id]);
    }

    public function finalize($id) {
        $query = $this->db->prepare('UPDATE myorder SET enviado = 1 WHERE n_pedido = ?');
        $query->execute([$id]);
       
    }

    public function update($customer, $date, $payment, $detail, $send, $n_order){
        $query = $this->db->prepare('UPDATE myorder SET id_cliente = ?, fecha_pedido = ?, forma_pago = ?, detalle = ?, enviado = ? WHERE n_pedido = ?');
        $query->execute([$customer, $date, $payment, $detail, $send, $n_order]);
        
    }
}
