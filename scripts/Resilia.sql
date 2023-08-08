create database `Resilia`;
use `resilia`;
-- CRIA UMA TABELA DE CADASTRO PARA RECEBER DADOS DE ENDEREÇO.
CREATE TABLE `Cadastro` (
    `id_cadastro` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `Nome` varchar(200) NOT NULL,
    `Sobrenome` varchar(200) NOT NULL,  
    `RG` int not null,
    `CPF` varchar(11) not null,
    `sexo` VARCHAR(1) not null,
    `data_nasc` date not null,
    `logradouro` VARCHAR(100) NOT NULL,
    `numero` INT NOT NULL,
    `cidade` VARCHAR(50) NOT NULL,
    `CEP` INT NOT NULL,
    `bairro` VARCHAR(50) NOT NULL,
    `UF` VARCHAR(2) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `telefone` int not null,
    `estado_civil` varchar(20) not null
);
-- CRIA UMA TABELA DE FACILITADOR 
create table `facilitador`(
    `id_facilitador` int AUTO_INCREMENT PRIMARY KEY not null,
    `disciplina_facilitador` VARCHAR(50) not null,
);
-- CRIA UMA TABELA DE ESTUDANTE 
create table `estudante`(
    `id_estudante` int AUTO_INCREMENT PRIMARY key not null,
    `nome_mae` VARCHAR(100) not null,
    `nome_pai` VARCHAR(100) null
);
-- CRIA UMA TABELA DE TURMA
create table `turma`(
    `id_turma` int AUTO_INCREMENT PRIMARY key not null,
    `add_turma` VARCHAR(30) not null,
    `data_inicio` date not null,
    `data_termino` date not null
);
-- CRIA UMA TABELA DE MODULO
create table `modulo`(
    `id_modulo` int AUTO_INCREMENT PRIMARY key not null,
    `modulo_1` VARCHAR(10) not null,
    `modulo_2` VARCHAR(10) not null,
    `modulo_3` VARCHAR(10) not null,
    `modulo_4` VARCHAR(10) not null,
    `modulo_5` VARCHAR(10) not null
);
-- CRIA UMA TABELA DE CURSO
create table `curso`(
    `id_curso` int AUTO_INCREMENT PRIMARY key not null,
    `nome_curso` VARCHAR(15) not null,
    `valor_curso` double not null
);
-- CRIA UMA TABELA DE FINANCEIRO
create table `financeiro` (
    `id_financeiro` int AUTO_INCREMENT PRIMARY key not null,
    `data_vencimento` date not null,
    `forma_pagamento` VARCHAR(30) not null,
    `pag_em_debito` double not null,
    `dias_atraso` int not null,
    `data_pagamento` date not null,
    `valor_parcela` double not null,
    `qnt_parcela` int not null
);
-- CRIA UMA TABELA DE NOTA
create table `nota`(
    `id_nota` int AUTO_INCREMENT PRIMARY key not null,
    `nota` decimal not null,
    `conceito` VARCHAR(20) not null
);
-- CRIA UMA TABELA DE FUNCIONARIO
create table `funcionario`(
    `id_funcionario` int AUTO_INCREMENT PRIMARY key not null
);
-- CRIA UMA TABELA DE CARGO
create table `cargo`(
    `id_cargo` int AUTO_INCREMENT PRIMARY key not null,
    `nome_cargo` VARCHAR (100) not null
);
-- CRIA UMA TABELA DE HORARIO 
create table `horario`(
    `id_horario` int AUTO_INCREMENT PRIMARY key not null,
    `data` date not null,
    `periodo` VARCHAR(50) not null,
    `hora_inicio` time not null,
    `hora_termino` time not null
);