use `resilia`;

-- INSERINDO CHAVE ESTRANGEIRA NA TABELA FUNCIONARIO
alter table `funcionario` add `id_materia` int not null, add foreign key (`id_materia`) references `materia` (`id_materia`);
alter table `funcionario` add `id_cadastro` int not null, add foreign key (`id_cadastro`) references `cadastro` (`id_cadastro`);

-- INSERINDO CHAVE ESTRANGEIRA NA TABELA ESTUDANTE
alter table `estudante` add `id_curso` int not null, add foreign key (`id_curso`) references `curso` (`id_curso`);
alter table `estudante` add `id_cadastro` int not null, add foreign key (`id_cadastro`) references `cadastro` (`id_cadastro`);

-- INSERINDO CHAVE ESTRANGEIRA NA TABELA TURMA
alter table `turma` add `id_curso` int not null, add foreign key (`id_curso`) references `curso` (`id_curso`);
alter table `turma` add `id_estudante` int not null, add foreign key (`id_estudante`) references `estudante` (`id_estudante`);
alter table `turma` add `id_modulo` int not null, add foreign key (`id_modulo`) references `modulo` (`id_modulo`);

-- INSERINDO CHAVE ESTRANGEIRA NA TABELA MODULO
alter table `modulo` add `id_horario` int not null, add foreign key (`id_horario`) references `horario` (`Id_horario`);

-- INSERINDO CHAVE ESTRANGEIRA NA TABELA CURSO
alter table `curso` add `id_modulo` int not null, add foreign key (`id_modulo`) references `modulo` (`id_modulo`);
alter table `curso` add `id_funcionario` int not null, add foreign key (`id_funcionario`) references `funcionario` (`id_funcionario`);

-- INSERINDO CHAVE ESTRANGEIRA NA TABELA FINANCEIRO
alter table `financeiro` add `id_estudante` int not null, add foreign key (`id_estudante`) references `estudante` (`id_estudante`);

-- INSERINDO CHAVE ESTRANGEIRA NA TABELA NOTA
alter table `nota` add `id_estudante` int not null, add foreign key (`id_estudante`) references `estudante` (`id_estudante`);





-- ordem de inserção de dados
-- 1 cadastro ok
-- 2 materia ok
-- 3 funcionario falta alguns cargos
-- 4 horario OK
-- 5 modulo OK
-- 6 curso OK
-- 7 turma OK
-- 8 estudante ?
-- 9 nota ?
-- 10 financeiro ok

