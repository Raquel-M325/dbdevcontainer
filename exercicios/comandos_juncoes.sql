-- Questão 1
SELECT nome, email, crm -- Seleciona o nome e e-mail da pessoa e o CRM do médico
FROM Pessoa -- Começa pela tabela Pessoa, onde estão nome e email

JOIN Medico -- Relaciona a pessoa com o cadastro de médico
ON Pessoa.cpf = Medico.cpf_pessoa;



-- Questão 2
SELECT nome, email, senha -- Seleciona o nome e e-mail da pessoa e a senha do paciente
FROM Pessoa -- Começa pela tabela Pessoa, onde estão nome e email

JOIN Paciente -- Relaciona a pessoa com o cadastro de paciente
ON Pessoa.cpf = Paciente.cpf_pessoa;



-- Questão 3
SELECT crm, descricao -- Seleciona o CRM do médico e a descrição da especialidade
FROM Medico -- Começa pela tabela Médico, onde está o CRM

JOIN MedicoEspecialidade -- Relaciona o médico com as especialidades cadastradas
ON Medico.cpf_pessoa = MedicoEspecialidade.cpf_medico

JOIN Especialidade -- Busca a descrição da especialidade pelo seu ID
ON MedicoEspecialidade.id_especialidade = Especialidade.id;