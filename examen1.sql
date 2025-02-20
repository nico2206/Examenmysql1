CREATE database pizzeria;
use pizzeria;
create table cliente(
idcliente int primary key auto_increment,
nombre varchar(50),
telefono varchar(50),
direccion varchar(50)
);
create table ingrediente(
idingre int primary key auto_increment,
nombreingre varchar(50)
);
create table pizza(
idpizza int primary key auto_increment,
tamaño enum ("grande", "mediana", "pequeña") default ("mediana"),
precio varchar(50),
idingre int,
foreign key (idingre) references ingrediente(idingre)
);
CREATE table bebida(
idbebida int primary key auto_increment,
sabor varchar(50),
precio varchar(50)
);

create table pedido(
idpedido int primary key auto_increment,
horarecogida varchar(50),
idpizza int,
idbebida int,
foreign key (idpizza) references pizza(idpizza),
foreign key (idbebida) references bebida(idbebida)
);
CREATE table factura(
idpedido int,
idcliente int,
foreign key (idpedido) references pedido(idpedido),
foreign key (idcliente) references cliente(idcliente)
);

insert into ingrediente (nombreingre)
values ("peperonipollo"), ("carnes"), ("pollo"), ("salami"), ("pollosalchicha");

insert into pizza (tamaño, precio, idingre)
values ("grande", "100", 2);

insert into pizza (tamaño, precio, idingre)
values ("pequeña", "50", 1), ("mediana", "80", 3), ("grande", "120", 4);

insert into bebida (sabor, precio)
values ("manzana", "10"), ("pera", "12" ), ("durazno", "15");

insert into pedido (horarecogida, idpizza, idbebida)
values ("2:30", "1", "2"), ("3:25", "2", "2"), ("1:30", "3", "1");

insert into cliente (nombre, telefono, direccion)
values ("sebastian", "3124567862", "carrera 24 # 23-18"), ("diana", "3143546765", "carrera 3 #18-23"), ("sofia", "3267876765", "CARRERA 18 #12-32");

insert into factura (idpedido, idcliente)
values ("1", "2"), ("2", "1"), ("3", "3");


-- consultas.

-- 1. Registrar un nuevo cliente
insert into cliente (nombre, telefono, direccion)
values ("freddy", "3124523244", "carrera 28 # 26-16");

SELECT *
FROM cliente;

-- 2. Agregar un nuevo producto (pizza) al menu

insert into pizza (tamaño, precio, idingre)
values ("grande", "128", 3);

SELECT *
FROM pizza;

-- 3. Registrar una bebida en el menu
insert into bebida (sabor, precio)
values ("coca-cola", "20");
SELECT *
FROM bebida;

-- 4. Agregar un ingrediente a la base de datos
insert into ingrediente (nombreingre)
values ("vegetales");
SELECT *
FROM ingrediente;

-- 5. Crear un pedido para un cliente

insert into pedido (horarecogida, idpizza, idbebida)
values ("6:30", "4", "4");

SELECT *
FROM pedido;

-- 6. Consultar el detalle de un pedido (productos y sus ingredientes)

SELECT P.horarecogida, p.tamaño, p.precio
from pizza p
join pedido P on p.idpizza = P.idpizza;

-- 7. Consultar todos los pedidos de un cliente

select C.idcliente, C.nombre
from cliente C
join factura F on C.idcliente = C.idcliente 
where C.idcliente = 1;

-- 8. Listar todos los productos disponibles en el menú 

select I.nombreingre as Nombre, P.tamaño, P.precio
from pizza P
join ingrediente I on P.idingre = I.idingre;

-- 9. Listar todos los ingredientes disponibles para personalizar una pizza
SELECT *
From ingrediente;

-- 10 Buscar pizzas con un precio mayor a $100:
select I.nombreingre as Nombre, P.tamaño, P.precio
from pizza P
join ingrediente I on P.idingre = I.idingre
where P.precio > 100;

-- 11.Buscar pedidos programados para recogerse después de una hora específica


SELECT P.horarecogida, p.tamaño, p.precio
from pizza p
join pedido P on p.idpizza = P.idpizza
where P.horarecogida > 2;
































