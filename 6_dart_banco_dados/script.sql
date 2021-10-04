create database dart_mysql;

create table dart_mysql.aluno (
  id int not null primary key auto_increment,
  nome varchar(200)
);

create table dart_mysql.conta_corrente (
  id int not null primary key auto_increment,
  saldo decimal (10,2)
);

create table dart_mysql.tira_dinheiro (
  id int not null primary key auto_increment,
  data_saque datetime default now()
);