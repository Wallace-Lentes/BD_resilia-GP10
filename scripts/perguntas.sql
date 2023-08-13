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

-- pergunta 4 Selecione a porcentagem de estudantes com status de aprovado agrupados por turma. 
SELECT 
    nota.id_estudante,
    SUM(CASE
        WHEN nota.conceito = 'aprovado' THEN 1
        ELSE 0
    END) AS total_aprovados
FROM
nota
GROUP BY id_estudante;


--  pergunta 7 Listar todos os estudantes em uma turma específica.

select estudante.* from estudante where id_turma = 3;

-- pergunta 8 Contar o número de estudantes em um determinado curso.

    SELECT 
        COUNT(*) AS total_estudantes
    FROM
        estudante
    WHERE
        id_curso = 3;

-- pergunta 9 Calcular o valor total das parcelas pagas em um determinado período no financeiro.

    SELECT 
        SUM(valor_parcela) AS total_pago
    FROM
        financeiro
    WHERE
        data_pagamento BETWEEN '2020-03-08' AND '2022-11-30';

-- pergunta 10 -  Quais alunos estão com pagamento em dia e atrasado.    

    SELECT 
    estudante.id_estudante,
    cadastro.Nome, cadastro.Sobrenome AS Sobrenome,
    curso.nome_curso,
    CASE
        WHEN dias_atraso IS null THEN 'Em dia'
        ELSE 'atrasado'
    END AS situacao_pagamento
        FROM
    estudante 
        JOIN
    cadastro ON estudante.id_cadastro = cadastro.id_cadastro
        JOIN
    curso  ON estudante.id_curso = curso.id_curso
        LEFT JOIN
    financeiro  ON estudante.id_estudante = financeiro.id_estudante
        ORDER BY curso.nome_curso, estudante.id_estudante;