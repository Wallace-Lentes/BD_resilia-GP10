use `resilia`;

-- ALTERA AS TEBELAS INSERINDO CHAVE ESTRANGEIRA

alter table `facilitador` add `id_cargo` int not null, add foreign key (`id_cargo`) references `cargo` (`id_cargo`);

alter table `facilitador` add `id_cadastro` int not null, add foreign key (`id_cadastro`) references `cadastro` (`id_cadastro`);

alter table `facilitador` add `id_turma` int not null, add foreign key (`id_turma`) references `turma` (`id_turma`);

alter table `estudante` add `id_curso` int not null, add foreign key (`id_curso`) references `curso` (`id_curso`);

alter table `estudante` add `id_cadastro` int not null, add foreign key (`id_cadastro`) references `cadastro` (`id_cadastro`);

alter table `estudante` add `id_turma` int not null, add foreign key (`id_turma`) references `turma` (`id_turma`);

alter table `turma` add `id_curso` int not null, add foreign key (`id_curso`) references `curso` (`id_curso`);

alter table `turma` add `id_facilitador` int not null, add foreign key (`id_facilitador`) references `facilitador` (`id_facilitador`);

alter table `turma` add `id_estudante` int not null, add foreign key (`id_estudante`) references `estudante` (`id_estudante`);

alter table `turma` add `id_modulo` int not null, add foreign key (`id_modulo`) references `modulo` (`id_modulo`);

alter table `modulo` add `id_curso`  int not null, add foreign key (`id_curso`) references `curso` (`id_curso`);

alter table `modulo` add `id_horario` int not null, add foreign key (`id_horario`) references `horario` (`Id_horario`);

alter table `curso` add `id_modulo` int not null, add foreign key (`id_modulo`) references `modulo` (`id_modulo`);

alter table `curso` add `id_facilitador` int not null, add foreign key (`id_facilitador`) references `facilitador` (`id_facilitador`);

alter table `curso` add `id_estudante` int not null, add foreign key (`id_estudante`) references `estudante` (`id_estudante`);

alter table `financeiro` add `id_estudante` int not null, add foreign key (`id_estudante`) references `estudante` (`id_estudante`);

alter table `financeiro` add `id_funcionario` int not null, add foreign key (`id_funcionario`) references `funcionario` (`id_funcionario`);

alter table `nota` add `id_estudante` int not null, add foreign key (`id_estudante`) references `estudante` (`id_estudante`);

alter table `nota` add `id_facilitador`  int not null, add foreign key (`id_facilitador`) references `facilitador` (`id_facilitador`);

alter table `funcionario` add `id_cadastro` int not null, add foreign key (`id_cadastro`) references `cadastro` (`id_cadastro`);

alter table `funcionario` add `id_cargo` int not null, add foreign key (`id_cargo`) references `cargo` (`id_cargo`);

alter table `cargo` add `id_funcionario` int not null, add foreign key (`id_funcionario`) references `funcionario` (`id_funcionario`);




























