create database dart_mysql;

CREATE TABLE dart_mysql.estado (
  id int not null primary key auto_increment,
  uf varchar(2),
  nome varchar(255)
);
CREATE TABLE dart_mysql.cidade (
  id int not null primary key auto_increment,
  id_uf int,
  nome varchar(255),
    FOREIGN KEY (id_uf)
      REFERENCES estado(id)
);​