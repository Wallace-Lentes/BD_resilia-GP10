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
create table `materia`(
    `id_materia` int AUTO_INCREMENT PRIMARY KEY not null,
    `nome_disciplina` VARCHAR(50) not null
);
-- CRIA UMA TABELA DE ESTUDANTE 
create table `estudante`(
    `id_estudante` int AUTO_INCREMENT PRIMARY key not null,
    `nome_mae` VARCHAR(100) not null,
    `nome_pai` VARCHAR(100) null,
    `status` VARCHAR(30)
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
    `nome` varchar(30)
);
-- CRIA UMA TABELA DE CURSO
create table `curso`(
    `id_curso` int AUTO_INCREMENT PRIMARY key not null,
    `nome_curso` VARCHAR(100) not null,
    `valor_curso` double not null
);
-- CRIA UMA TABELA DE FINANCEIRO
create table `financeiro` (
    `id_financeiro` int AUTO_INCREMENT PRIMARY key not null,
    `data_vencimento` date not null,
    `forma_pagamento` VARCHAR(30) not null,
    `dias_atraso` int not null,
    `data_pagamento` date not null,
    `valor_parcela` double not null,
    `num_da_parcela` int not null
);
-- CRIA UMA TABELA DE NOTA
create table `nota`(
    `id_nota` int AUTO_INCREMENT PRIMARY key not null,
    `nota` decimal null,
    `data` date null,
    `conceito` VARCHAR(20) null
);
-- CRIA UMA TABELA DE FUNCIONARIO E CARGO
create table `funcionario_cargo`(
    `id_funcionario` int AUTO_INCREMENT PRIMARY key not null,
    `cargo` varchar(100) not null
);

-- CRIA UMA TABELA DE HORARIO 
create table `horario`(
    `id_horario` int AUTO_INCREMENT PRIMARY key not null,
    `data` date not null,
    `periodo` VARCHAR(50) not null,
    `hora_inicio` time not null,
    `hora_termino` time not null
);