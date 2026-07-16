SELECT * FROM dbo.Pessoa; --Coleta todos os dados da tabela pessoa
SELECT nome, email, data_nasc 
    FROM dbo.Pessoa; -- Lista todos os nome, emails e datas de nascimento

SELECT nome, email, data_nasc FROM dbo.Pessoa ORDER BY id LIMIT 6 OFFSET 2; --Pega os primeiros dados a partir do 3 até o oitavo. OBS: PRECISO SABER O QUE O ORDER BY FAZ

SELECT nome, email, concat((data_nasc_max)-data_nasc) FROM dbo.Pessoa


-- Questão 15
SELECT AVG(valor_consulta) AS media_valores -- Calcula a média dos valores das consultas
    FROM Agendamento -- Utiliza a tabela de agendamentos, onde estão os valores das consultas

    -- Filtra apenas os agendamentos realizados no mês de dezembro
    WHERE EXTRACT(MONTH FROM dh_agenda) = 12;


-- Questão 16
SELECT nome, email, data_nasc -- Seleciona o nome, e-mail e data de nascimento da pessoa
    FROM dbo.Pessoa -- Começa pela tabela Pessoa

    JOIN Paciente -- Relaciona a pessoa com o cadastro de paciente
    ON Pessoa.cpf = Paciente.cpf_pessoa

    JOIN Agendamento -- Relaciona o paciente aos seus agendamentos
    ON Paciente.cpf_pessoa = Agendamento.cpf_paciente

    -- Compara o dia e o mês do nascimento com o dia e o mês da consulta
    WHERE EXTRACT(DAY FROM Pessoa.data_nasc) = EXTRACT(DAY FROM Agendamento.dh_consulta)
    AND EXTRACT(MONTH FROM Pessoa.data_nasc) = EXTRACT(MONTH FROM Agendamento.dh_consulta);


-- Questão 17
SELECT nome, email, cpf, descricao -- Seleciona o nome, e-mail, CPF e a descrição da especialidade
    FROM dbo.Pessoa

    JOIN Medico -- Relaciona a pessoa com o cadastro de médico
    ON Pessoa.cpf = Medico.cpf_pessoa

    JOIN MedicoEspecialidade -- Relaciona o médico às especialidades cadastradas
    ON Medico.cpf_pessoa = MedicoEspecialidade.cpf_medico

    JOIN Especialidade -- Relaciona o ID da especialidade para obter sua descrição
    ON MedicoEspecialidade.id_especialidade = Especialidade.id;


-- Questão 18
SELECT Pessoa.nome, -- Nome do médico
    COUNT(Agendamento.dh_consulta) AS quantidade_consultas -- Conta quantas consultas esse médico possui
    
    FROM Pessoa

    JOIN Medico -- Relaciona a pessoa com o cadastro de médico
    ON Pessoa.cpf = Medico.cpf_pessoa

    JOIN Agendamento -- Relaciona o médico às consultas agendadas
    ON Medico.cpf_pessoa = Agendamento.cpf_medico

    GROUP BY Pessoa.nome;