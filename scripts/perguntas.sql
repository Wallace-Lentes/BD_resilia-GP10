-- pergunta 1: Selecionar a quantidade de estudantes cadastrados.
select count(id_estudante) from estudante;

-- pergunta 2: Selecionar quais facilitadores atuam em mais de uma turma.
    SELECT 
    id_funcionario, COUNT(id_funcionario) soma
FROM
    turma
GROUP BY id_funcionario
HAVING soma > 1