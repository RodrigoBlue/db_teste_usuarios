create database Loja;
use Loja;
drop database loja;

create table Aluno(
idAluno INT AUTO_INCREMENT,
PRIMARY KEY(idAluno),
nomeAluno VARCHAR(50),
CPFAluno INT,
idadeAluno INT,
sexoAluno VARCHAR(1),
datanascAluno DATE
);


create table Produto(
id_produto INT auto_increment,
PRIMARY KEY(id_produto),
nome_produto varchar(50)
);

alter table Produto modify column id_produto varchar(80);
alter table produto add setor_produto VARCHAR(50);
alter table produto add id_produto int auto_increment primary key;
alter table produto drop column id_produto;

insert into produto (nome_produto, setor_produto) values ('arroz','nao perecivel'),('feijao','nao perecivel') , ('leite','laticinio'), ('queijo','laticinio'
), ('farinha', 'nao perecivel');

select * from produto;

select * from produto order by nome_produto;

select nome_produto from produto order by nome_produto desc;

select nome_produto, id_produto from produto where id_produto = '1';

select id_produto
from produto
where id_produto > 3
union
select id_produto
from produto
where id_produto < 4;


-------------------------------------------------
-- privileges users
drop user celso@192.168.0.104 ;
create user Mary@localhost;  
create user John@localhost;
create user Silas@localhost identified by '123456';
create user silas identified by '123456' 
create user 'celso'@'192.168.0.104' identified by '123456';
Create user Carlos@'%200.10.133.121';

grant insert, update, delete
on Loja.* to 'Mary'@'localhost';
grant insert, update, delete
on Loja.* to  'John'@'localhost';

grant all privileges on loja.* to Silas@localhost;
grant create user on loja.* to  Silas@localhost with grant option;
grant insert, delete on Loja.* to Silas@localhost;
revoke insert, update on Loja.* from Silas@localhost;
revoke delete, insert on produto from Silas@localhost;
revoke 
grant all privileges on Loja.Produto to 'Silas'@'localhost';
revoke insert, delete, create on Loja.Produto from 'Silas'@'localhost';
grant insert, delete on loja.produto to 'Silas'@'localhost';

grant all privileges on Loja.* to Carlos@'%200.10.133.121';
revoke all on Loja.* from Carlos@'%200.10.133.121';


show grants for Carlos@'%200.10.133.121';
show grants for Mary@localhost;
show grants for John@localhost;
show grants for Silas@localhost;

select user, host from mysql.user;
select user from mysql.user;
flush privileges;


