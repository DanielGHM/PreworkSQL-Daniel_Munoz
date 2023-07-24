/*
Ejercicio 1
1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto).
*/
CREATE TABLE IF NOT EXISTS clientes(
id SERIAL PRIMARY KEY,
nombre varchar(255) not null,
email varchar(255)
);

/*
2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".*/

insert into clientes(id,nombre,email)
values(1,'Juan','Juan@example.com');

/*
3. Actualizar el email del cliente con id=1 a "juan@gmail.com".
*/
update clientes set email = 'Juan@gmail.com' where id = 1;

/*
4. Eliminar el cliente con id=1 de la tabla "Clientes".*/
delete from clientes where id = 1;
/*
5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero).
*/
CREATE TABLE IF NOT EXISTS pedidos(
id SERIAL PRIMARY KEY,
cliente_id int not null,
producto varchar(255) not null,
cantidad int not null,
constraint fk_cli FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
/*
6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.
*/
insert into pedidos(id,cliente_id,producto,cantidad)
values(1,1,'Camisa',2);
/*
7. Actualizar la cantidad del pedido con id=1 a 3.
*/
update pedidos set cantidad = 3 where id = 1;
/*
8. Eliminar el pedido con id=1 de la tabla "Pedidos".
*/
delete from pedidos where id = 1;
/*
9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal).
*/
CREATE TABLE IF NOT EXISTS productos(
  id SERIAL PRIMARY KEY,
  nombre varchar(255) not null,
  precio decimal not null
)
/*
10. Insertar varios productos en la tabla "Productos" con diferentes valores.
*/
insert into productos(nombre,precio)
values('Camisa',20);
insert into productos(nombre,precio)
values('Pantalon',35);
insert into productos(nombre,precio)
values('Corbata',10);
insert into productos(nombre,precio)
values('Chaqueta',100);

/*
11. Consultar todos los clientes de la tabla "Clientes".
*/
Select * from clientes;
/*
12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los
clientes correspondientes.*/
select a.*,b.nombre from pedidos as a left join clientes as b on a.cliente_id = b.id;
/*
13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.
*/
Select * from productos where precio > 50;
/*
14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o
igual a 5.
*/
Select * from pedidos where cantidad > 5;
/*
15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A".*/
Select * from clientes where nombre LIKE 'A%';
/*
Ejercicios 2
16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos
realizados por cada cliente.
*/
select a.nombre,count( b.id ) from clientes as a left join pedidos as b on a.id = b.cliente_id
group by a.nombre ;
/*
17. Realizar una consulta que muestre el nombre del producto y la cantidad total de
pedidos de ese producto.
*/
select a.nombre,count( b.id ) from productos as a left join pedidos as b on a.nombre = b.producto
group by a.nombre ;
/*
18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.
*/
Alter TABLE Pedidos
ADD COLUMN FECHA DATE;
/*
19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla
"Productos" en la columna "producto".
*/
Alter Table pedidos add id_product int References productos(id)

update pedidos set cantidad = 3 where id = 1;

UPDATE pedidos SET id_product = productos.id 
FROM productos 
WHERE productos.nombre = pedidos.producto

/*
20. Realizar una consulta que muestre los nombres de los clientes, los nombres de
los productos y las cantidades de los pedidos donde coincida la clave externa.
*/
select a.nombre as cliente,c.nombre  as producto,b.cantidad from clientes as a 
inner join pedidos as b on a.id = b.cliente_id
inner join productos as c on b.id_product = c.id;