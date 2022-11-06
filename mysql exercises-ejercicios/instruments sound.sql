
/* creacion base de datos */

drop database if exists instruments_sound;
create database instruments_sound;
use instruments_sound;

/* creacion tablas */

create table usuarios(identificacion int auto_increment, correo varchar (100) not null, nombre varchar(40) not null, apellidos varchar(40) not null,
 contraseña varchar (40) not null, estado char (2) not null, rol varchar (50), primary key(identificacion));
 
create table productos(codigo_producto int, nombre varchar (40), precio float, stock int, referencia varchar (100),primary key(codigo_producto));

create table compra(codigo_compra int,total_a_pagar float,primary key(codigo_compra)); /* trigger con esta tabla */ 

create table pedido(codigo_pedido int auto_increment, direccion varchar (50), fecha_p date, iva float,
precio_total float, forma_de_pago varchar (100), estado char(2),primary key(codigo_pedido));

/* insertar datos */

insert into usuarios(identificacion, correo, nombre,apellidos,contraseña,estado,rol) 
values (1000935825,'pepito@gmail.com', 'carlos','romero', 'carlos15', 0, 'admin');
insert into usuarios(identificacion, correo, nombre,apellidos,contraseña,estado,rol) 
values (1000935826,'gatos@gmail.com', 'maria','barrio', 'gatitosfelices', 1, 'usuario');
insert into usuarios(identificacion, correo, nombre,apellidos,contraseña,estado,rol) 
values (1000935827,'spiderman@gmail.com', 'peter','parker', 'spiderman18', 1, 'usuario');
insert into usuarios(identificacion, correo, nombre,apellidos,contraseña,estado,rol) 
values (1000935828,'agentesecreto@gmail.com', 'george','clooney', 'mision28', 1, 'usuario');
insert into usuarios(identificacion, correo, nombre,apellidos,contraseña,estado,rol) 
values (1000935829,'avengerh@gmail.com', 'bruce','banner', 'elhulk', 1, 'usuario');

insert into productos(codigo_producto,nombre,precio,stock,referencia)
values (111, 'guitarra_electrica', '3000000', 4, 'ge14');
insert into productos(codigo_producto,nombre,precio,stock,referencia)
values (112, 'bateria', '5000000', 2, 'ba44');
insert into productos(codigo_producto,nombre,precio,stock,referencia)
values (113, 'piano', '4000000', 4, 'pia88');
insert into productos(codigo_producto,nombre,precio,stock,referencia)
values (114, 'bajo', '2000000', 7, 'baj02');

insert into compra(codigo_compra,total_a_pagar) values (0001, 9500000);
insert into compra(codigo_compra,total_a_pagar) values (0002, 3500000);
insert into compra(codigo_compra,total_a_pagar) values (0003, 4700000);
insert into compra(codigo_compra,total_a_pagar) values (0004, 6500000);


insert into pedido(codigo_pedido,direccion,fecha_p,iva,precio_total,forma_de_pago,estado)
values (001, 'cra15calle11', '2022/11/17', 0.16, 9200000, 'daviplata', 1);
insert into pedido(codigo_pedido,direccion,fecha_p,iva,precio_total,forma_de_pago,estado)
values (002, 'cra20calle4', '2022/11/04', 0.16, 3200000, 'tarjeta de credito visa', 2);
insert into pedido(codigo_pedido,direccion,fecha_p,iva,precio_total,forma_de_pago,estado)
values (003, 'cra100calle8', '2022/12/01', 0.16, 4500000, 'nequi', 1);
insert into pedido(codigo_pedido,direccion,fecha_p,iva,precio_total,forma_de_pago,estado)
values (004, 'cra15calle9', '2022/11/20', 0.16, 6300000, 'efectivo', 1);


/* verficacion de datos */

show tables;

describe usuarios;
describe productos;
describe pedido;
describe compra;

/* comando select */

select * from usuarios;
select * from productos;
select * from pedido;
select * from compra;


select nombre,estado,rol from usuarios;

select nombre,precio from productos;
select nombre,stock from productos;

select direccion,estado from pedido;
select direccion,fecha_p, estado from pedido;


/* vistas */

drop view if exists vista_pedidos_pendientes;
create view vista_pedidos_pendientes as
select * from pedido
where estado =1;

select * from vista_pedidos_pendientes;


/* drop view if exists vista_compra_sencilla;


select * from vista_compra_sencilla
*/

drop view if exists vista_datos_usuarios;
create view vista_datos_usuarios as
select identificacion, correo, nombre,apellidos,contraseña from usuarios;
select * from vista_datos_usuarios;


/* funciones */ 

SELECT nombre, apellidos, CONCAT(nombre, ' ' ,apellidos) AS 'Nombre completo' FROM usuarios;

select max(precio) from productos;
 

/* procedimientos */

drop procedure if exists Proc_instrumentos_stock;
delimiter //
create procedure Proc_instrumentos_stock() begin select * from productos
where stock<=4; end //
delimiter ;
call Proc_instrumentos_stock();

drop procedure if exists Proc_instrumentos_precio_bajos;
delimiter $$
use instruments_sound $$
create procedure Proc_instrumentos_precio_bajos() begin select * from
productos where precio<=4000000; end $$ delimiter ;
call Proc_instrumentos_precio_bajos(); 

/* triggers */

drop trigger if exists before_compra_insert;  

delimiter //
 create trigger before_compra_insert
   before insert
   on compra
   for each row
 begin
   update productos set stock=productos.stock-new.stock
     where new.codigo_producto=productos.codigo_compra; 
 end //
 delimiter ;
 
 insert into compra(codigo_compra,total_a_pagar)
  values(005,230000); 
  
  
drop trigger if exists  actualizarPrecioProducto;
  
DELIMITER $$
CREATE TRIGGER actualizarPrecioProducto
BEFORE UPDATE ON productos
FOR EACH ROW
BEGIN
  IF NEW.precio <> OLD.precio
    THEN
      SET NEW.valor    = NEW.precio * 2;
  END IF ;
END$$
DELIMITER ;



