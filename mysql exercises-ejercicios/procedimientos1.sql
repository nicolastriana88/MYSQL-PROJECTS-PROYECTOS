create database consecionario; 
use consecionario;
drop table if exists carros;
create table carros( codigo int auto_increment, nombre varchar(40), placa varchar(30), 
color varchar(20), precio decimal, stock int, primary key(codigo));
insert into carros(codigo,nombre,placa,color,precio,stock) values (112, 'yamaha', 'wgo234', 'rojo', 40000, 2);
insert into carros(codigo,nombre,placa,color,precio,stock) values (113, 'toyota', 'win224', 'negro', 50000, 6);
insert into carros(codigo,nombre,placa,color,precio,stock) values (114, 'renault', 'zao289', 'negro', 20000, 7);
insert into carros(codigo,nombre,placa,color,precio,stock) values (115, 'wolsvagen', 'wga214', 'azul', 80000, 4);
insert into carros(codigo,nombre,placa,color,precio,stock) values (116, 'bmw', 'chin278', 'gris', 40000, 3);
insert into carros(codigo,nombre,placa,color,precio,stock) values (117, 'ferrari', 'pao199', 'gris', 45000, 8);
insert into carros(codigo,nombre,placa,color,precio,stock) values (118, 'mazda', 'was777', 'rojo', 28000, 5);

select * from carros;

drop procedure if exists Proc_carros_stock;
delimiter //
create procedure Proc_carros_stock() begin select * from carros
where stock<=4; end //
delimiter ;
call Proc_carros_stock();

drop procedure if exists Proc_carros_precio_bajos;
delimiter $$
use consecionario $$
create procedure Proc_carros_precio_bajos() begin select * from
carros where precio<=30000; end $$ delimiter ;
call Proc_carros_precio_bajos(); 


