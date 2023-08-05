create database `Resilia`;
use `resilia`;
-- CRIA UMA TABELA DE CADASTRO PARA RECEBER DADOS DE ENDEREÇO.
CREATE TABLE `Cadastro` (
    `id_cadastro` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `RG` int not null,
    `CPF` int not null,
    `logradouro` VARCHAR(100) NOT NULL,
    `numero` INT NOT NULL,
    `cidade` VARCHAR(50) NOT NULL,
    `CEP` INT NOT NULL,
    `bairro` VARCHAR(50) NOT NULL,
    `UF` VARCHAR(2) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `telefone` int not null,
    `estado_civil` int not null
);

create table `facilitador`(
    `id_facilitadores` int AUTO_INCREMENT PRIMARY KEY not null;
    `nome_facilitador` VARCHAR(100) not null,
    `disciplina_facilitador` VARCHAR(50) not null,
    `sexo` VARCHAR(1) not null,
    `data_nasc` date not null,
    `id_cargo` int not null,
    `id_instituicao` int not null,
    `id_cadastro` int not null,
    `id_turma` int not null,
    foreign key (`id_cargo`) references `cargo` (`id_cargo`),
    foreign key (`id_instituicao`) references `instituicao` (`id_instituicao`),
    foreign key (`id_cadastro`) references `cadastro` (`id_cadastro`),
    foreign key (`id_turma`) references `turma` (`id_turma`)    
);

create table `estudante`(
    `id_estudante` int AUTO_INCREMENT PRIMARY key not null,
    `nome` VARCHAR(100) not null,
    `sexo` VARCHAR(1) not null,
    `data_nasc` date not null,
    `nome_mae` VARCHAR(100) not null,
    `nome_pai` VARCHAR(100) null,
    `id_curso` int not null,
    `id_instituicao` int not null,
    `id_cadastro` int not null,
    `id_turma` int not null,
    foreign key (`id_curso`) references `curso` (`id_curso`),
    foreign key (`id_instituicao`) references `instituicao` (`id_instituicao`),
    foreign key (`id_cadastro`) references `cadastro` (`id_cadastro`),
    foreign key (`id_turma`) references `turma` (`id_turma`)   
);

create table `turma`(
    `id_turma` int AUTO_INCREMENT PRIMARY key not null,
    `add_turma` VARCHAR(30) not null,
    `data_inicio` date not null,
    `data_termino` date not null,

    `id_modulo` int not null,
    `id_estudante` int not null,
    `id_facilitador` int not null,
    `id_curso` int not null,
    foreign key (`id_curso`) references `curso` (`id_curso`),
    foreign key (`id_facilitador`) references `facilitador` (`id_facilitador`),
    foreign key (`id_estudante`) references `estudante` (`id_estudante`),
    foreign key (`id_modulo`) references `modulo` (`id_modulo`)
);

create table `modulo`(
    `id_modulo` int AUTO_INCREMENT PRIMARY key not null,
    `modulo_1` VARCHAR(10) not null,
    `modulo_2` VARCHAR(10) not null,
    `modulo_3` VARCHAR(10) not null,
    `modulo_4` VARCHAR(10) not null,
    `modulo_5` VARCHAR(10) not null,
    `id_curso` int not null,
    `id_horario` int not null,
    foreign key (`id_curso`) references `curso` (`id_curso`),
    foreign key (`id_horario`) references `horario` (`Id_horario`)
);

create table `curso`(
    `id_curso` int AUTO_INCREMENT PRIMARY key not null,
    `nome_curso` VARCHAR(15) not null,
    `valor_curso` double not null,
    `id_estudante` int not null,
    `id_facilitador` int not null,
    `id_modulo` int not null,
    foreign key (`id_modulo`) references `modulo` (`id_modulo`),
    foreign key (`id_facilitador`) references `facilitador` (`id_facilitador`),
    foreign key (`id_estudante`) references `estudante` (`id_estudante`)
);

create table `financeiro` (
    `id_financeiro` int AUTO_INCREMENT PRIMARY key not null,
    `data_vencimento` date not null,
    `forma_pagamento` VARCHAR(30) not null,
    `pag_em_debito` double not null,
    `dias_atraso` int not null,
    `data_pagamento` date not null,
    `valor_parcela` double not null,
    `qnt_parcela` int not null,
    `id_estudante` int not null,
    `id_funcionario` int not null,
    foreign key (`id_estudante`) references `estudante` (`id_estudante`),
    foreign key (`id_funcionario`) references `funcionario` (`id_estudante`)
);

create table `nota`(
    `id_nota` int AUTO_INCREMENT PRIMARY key not null,
    `nota` decimal not null,
    `conceito` VARCHAR(20) not null,
    `id_estudante`int not null,
    `id_facilitador`int not null,
    foreign key (`id_estudante`) references `estudante` (`id_estudante`),
    foreign key (`id_facilitador`) references `facilitador` (`id_facilitador`),
);

create table `funcionario`(
    `id_funcionario` int AUTO_INCREMENT PRIMARY key not null,
    `nome_funcionario` VARCHAR(100) not null,
    `id_cargo` int not null,
    `id_cadastro` int not null,
    `id_instituicao` int not null,
    foreign key (`id_instituicao`) references `instituicao` (`id_instituicao`),
    foreign key (`id_cadastro`) references `cadastro` (`id_cadastro`)
);

create table `cargo`(
    `id_cargo` int AUTO_INCREMENT PRIMARY key not null,
    `nome_cargo` VARCHAR (100) not null,
    `id_funcionario` int not null,
    foreign key (`id_funcionario`) references `funcionario` (`id_estudante`)
);

create table `horario`(
    `id_horario` int AUTO_INCREMENT PRIMARY key not null,
    `data` date not null,
    `periodo` VARCHAR(50) not null,
    `hora_inicio` time not null,
    `hora_termino` time not null
);