create database crypto
default character set utf8mb4
collate utf8mb4_general_ci;

/* varbinary é um tipo de dado do mysql usada para armazenar dados, imagens ou arquivos binarios criptografados. guarda bytes em vez de texto*/
use crypto;
CREATE TABLE usuario(
codigo int  primary key auto_increment,
nome varchar(30) not null,
senha varbinary(120) not null
) engine = Innodb default charset = utf8mb4; 
insert  into usuario values (default,'Diego',aes_encrypt('2709', 'D'));
insert into usuario values(default,'Henrique',aes_encrypt('2709','H'));

select nome, aes_decrypt(senha,'D') from usuario;
delete from usuario
where codigo = 3;
select * from usuario;


create table usuarios2(
id int not null auto_increment,
nome varchar(30) not null ,
nascimento date,
sexo enum('M','F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(50) default 'Brasil',
primary key(id)
)engine = Innodb charset = utf8mb4;
drop table usuarios2;

insert into usuarios2 values(default,'Diego', '2006-09-27','M','80.3','1.71',default);
insert into usuarios2 values(default,'Henrique','2006-09-27','M','81.50','1.80',default);
