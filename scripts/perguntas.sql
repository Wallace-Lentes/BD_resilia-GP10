-- pergunta 1: Selecionar a quantidade de estudantes cadastrados.
select count(id_estudante) from estudante;

-- pergunta 2: Selecionar quais facilitadores atuam em mais de uma turma.

SELECT DISTINCT
    cadastro.nome,
    cadastro.Sobrenome,
    contagem.id_funcionario,
    funcionario_cargo.id_cadastro,
    contagem.total_turmas
FROM
    (SELECT 
        id_funcionario, COUNT(id_funcionario) total_turmas
    FROM
        turma
    GROUP BY id_funcionario) contagem
        JOIN
    funcionario_cargo ON funcionario_cargo.id_cadastro = contagem.id_funcionario
        LEFT JOIN
    cadastro ON funcionario_cargo.id_cadastro = cadastro.id_cadastro
WHERE
    total_turmas > 1;

-- pergunta 3: Criar uma view que selecione a porcentagem de estudantes com status de evasão agrupados por turma.

CREATE VIEW ViewPorcentagemEvasao AS
    SELECT 
        id_turma,
        COUNT(CASE
            WHEN status = 'inativo' THEN 1
            ELSE NULL
        END) AS total_inativos,
        COUNT(*) AS total_alunos,
        (COUNT(CASE
            WHEN status = 'inativo' THEN 1
            ELSE NULL   
        END) / COUNT(*)) * 100 AS porcentagem_inativos
    FROM
        estudante
    GROUP BY id_turma;

-- pergunta 4: selecione a porcentagem de estudantes com status de aprovado. 

CREATE VIEW ViweAprovados AS
    SELECT 
        COUNT(nota.id_estudante) AS total_alunos,
        SUM(CASE
            WHEN nota.conceito = 'aprovado' THEN 1
            ELSE 0
        END) AS total_aprovados,
        (SUM(CASE
            WHEN nota.conceito = 'aprovado' THEN 1
            ELSE 0
        END) / COUNT(nota.id_estudante)) * 100 AS porcentagem_aprovados
    FROM
        nota;

-- Pergunta 5: obter informações sobre os alunos, seus cursos e suas notas.

CREATE VIEW ViewInformacaoAlunosNotasTurmas AS
    SELECT 
        estudante.id_estudante,
        cadastro.Nome,
        cadastro.sobrenome AS sobrenome,
        curso.nome_curso,
        nota.nota
    FROM
        estudante 
            JOIN
        cadastro ON estudante.id_cadastro = cadastro.id_cadastro
            JOIN
        curso  ON estudante.id_curso = curso.id_curso
            JOIN
        nota  ON estudante.id_estudante = nota.id_estudante
    ORDER BY curso.nome_curso , estudante.id_estudante;



