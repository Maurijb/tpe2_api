# API REST para pedidos relaizados de clientes
La API maneja un CRUD de pedidos gestionados por parte del cliente interno de una organización
Version: 1.0
URL: localhost/tpe_api/api/v1/pedidos

## Endpoints API

- GET localhost/tpe_api/api/v1/pedidos 
Devuelve todos los pedidos realizados en formato JSON

- GET localhost/tpe_api/api/v1/pedidos/:ID
Devuelve un pedido según su ID en forta JSON, por ejemplo...
{
        "n_pedido": 98,
        "id_cliente": 49,
        "fecha_pedido": "2022-10-01",
        "forma_pago": "Credito",
        "detalle": "Botellas plasticas",
        "enviado": 0,
        "empresa": "Carregul "
    },

- DELETE localhost/tpe_api/api/v1/pedidos/:ID
Borra el pedido con el ID ingresado

- PUT localhost/tpe_api/api/v1/pedidos/:ID
Edita un pedido existente determinado por su ID
Campos a editar permitidos:
"id_cliente":
"fecha_pedido": 
"forma_pago":
"detalle": 

- POST localhost/tpe_api/api/v1/pedidos
Crear un nuevo pedido a partir de la siguiente información requerida:
"id_cliente":
"fecha_pedido": 
"forma_pago":
"detalle":

Por defecto el pedido se iniciará como NO enviado.

## Filtrado y Ordenamiento de los resultados

- GET localhost/tpe_api/api/v1/pedidos?sort=COLUMNA&order=ASC/DESC
Parametros "sort" y "order"
Permite filtrar por columnas y tanto en orden ascendente como descendente los resultados

COLUMNAS:
"n_pedido": 
"id_cliente": 
"fecha_pedido": 
"forma_pago": 
"detalle": 
"empresa": 


## Busqueda de pedidos enviados y no enviados (pendientes)

Parametros "sending" y "pending"

- GET localhost/tpe_api/api/v1/pedidos?sending
Permite distinguir los pedidos enviados

- GET localhost/tpe_api/api/v1/pedidos?pending
Permite distinguir los pedidos pendientes o NO enviados