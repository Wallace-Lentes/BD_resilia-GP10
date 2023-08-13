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

    -- pergunta 5 -Porcentagem de aprovados por turma

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

    -- pergunta 6: Top 15 melhores notas alunos.

    CREATE VIEW ViewTop15MelhoresNotas AS
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
        curso ON estudante.id_curso = curso.id_curso
            JOIN
        nota ON estudante.id_estudante = nota.id_estudante
    ORDER BY nota.nota DESC
    LIMIT 15;
    
-- pergunta 10: Qual a porcetagem de alunos com pagamento em dia e atraso.

    CREATE VIEW PorcentegemSituacaoDePagamento AS
    SELECT 
        COUNT(*) AS total_alunos,
        SUM(CASE
            WHEN situacao_pagamento = 'Atrasado' THEN 1
            ELSE 0
        END) AS total_atrasados,
        SUM(CASE
            WHEN situacao_pagamento = 'Em dia' THEN 1
            ELSE 0
        END) AS total_em_dia,
        (SUM(CASE
            WHEN situacao_pagamento = 'Atrasado' THEN 1
            ELSE 0
        END) / COUNT(*)) * 100 AS porcentagem_atrasados,
        (SUM(CASE
            WHEN situacao_pagamento = 'Em dia' THEN 1
            ELSE 0
        END) / COUNT(*)) * 100 AS porcentagem_em_dia,
        ((SUM(CASE
            WHEN situacao_pagamento = 'Atrasado' THEN 1
            ELSE 0
        END) + SUM(CASE
            WHEN situacao_pagamento = 'Em dia' THEN 1
            ELSE 0
        END)) / COUNT(*)) * 100 AS porcentagem_total
    FROM
        (SELECT 
            estudante.id_estudante,
                cadastro.Nome AS nome_estudante,
                curso.nome_curso,
                CASE
                    WHEN dias_atraso IS NULL THEN 'Em dia'
                    ELSE 'Atrasado'
                END AS situacao_pagamento
        FROM
            estudante
        JOIN cadastro ON estudante.id_cadastro = cadastro.id_cadastro
        JOIN curso ON estudante.id_curso = curso.id_curso
        LEFT JOIN financeiro ON estudante.id_estudante = financeiro.id_estudante) AS subquery;