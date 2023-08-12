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
-- 4 selecione a porcentagem de estudantes com status de aprovado agrupados por turma. 
SELECT 
    nota.id_estudante,
    SUM(CASE
        WHEN nota.conceito = 'aprovado' THEN 1
        ELSE 0
    END) AS total_aprovados
FROM
nota
GROUP BY id_estudante;


SELECT COUNT(*) as total_aprovados FROM nota WHERE conceito = 'aprovado';

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
