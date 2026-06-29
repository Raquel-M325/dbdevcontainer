CREATE TABLE IF NOT EXISTS Pessoa(
    cpf CHAR(11) PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    nome VARCHAR(150) NOT NULL,
    data_nasc DATE NOT NULL,
    endereco VARCHAR(300) NOT NULL,
    telefone VARCHAR(15),
    CONSTRAINT Pessoa_UN UNIQUE(email, nome)
);

INSERT INTO Pessoa (nome, email, cpf, data_nasc, endereco, telefone)
VALUES
('Pedro I', 'pp@email.com', '002', '1479-01-10', 'R. Vasco', NULL),
('Pedro II', 'ps@email.com', '003', '1516-02-10', 'R. Flamengo', '5501'),
('D João VI', 'dj@email.com', '001', '1415-12-01', 'R. Portugal', NULL),
('JJ Xavier', 'jj@email.com', '004', '1746-11-12', 'R. Minas', '5502');

-- Atualizar a data de nascimento de D João VI
UPDATE Pessoa
SET data_nasc = '1416-12-01'
WHERE nome = 'D João VI';

-- Atualizar o telefone e o e-mail de Pedro I
UPDATE Pessoa
SET telefone = '5503',
    email = 'pf@email.com'
WHERE nome = 'Pedro I';

-- Adicionar o dígito 9 no início de todos os telefones
UPDATE Pessoa
SET telefone = CONCAT('9', telefone)
WHERE telefone IS NOT NULL;

SELECT
    nome,
    TO_CHAR(data_nasc, 'DD-MM-YYYY') AS data_nascimento
FROM Pessoa;


CREATE TABLE IF NOT EXISTS Paciente(
    cpf_pessoa CHAR(11) PRIMARY KEY REFERENCES Pessoa(cpf),
    senha varchar(20) not NULL,
    plano_saude boolean not NULL DEFAULT FALSE

);

CREATE TABLE IF NOT EXISTS Medico(
    crm varchar(10) UNIQUE NOT NULL,
    cpf_pessoa char(11) NOT NULL,
    CONSTRAINT Medico_Pessoa_FK FOREIGN KEY(cpf_pessoa) REFERENCES Pessoa(CPF)
);
    

CREATE TABLE IF NOT EXISTS Agendamento(
    cpf_pessoa char(11) NOT NULL,
    dh_agenda timestamp NOT NULL,
    valor_consulta float NOT NULL,
    dh_consulta timestamp PRIMARY KEY,
    cpf_medico char(11) not null PRIMARY KEY,
    cpf_paciente char(11) not null PRIMARY KEY,
    CONSTRAINT Agendamento_Paciente_FK FOREIGN KEY(cpf_paciente) REFERENCES Paciente(cpf_pessoa),
    CONSTRAINT Agendamento_Medico_FK FOREIGN KEY(cpf_medico) REFERENCES Medico(cpf_pessoa) 
);

CREATE TABLE IF NOT EXISTS Especialidade(
    id int PRIMARY KEY,
    descricao varchar(300) NOT NULL
);

CREATE TABLE IF NOT EXISTS MedicoEspecialidade(
    cpf_medico char(11) PRIMARY KEY,
    id_especialidade int PRIMARY KEY,
    CONSTRAINT MedicoEspecialidade_Medico_FK FOREIGN KEY(cpf_medico) REFERENCES Medico(cpf_pessoa),
    CONSTRAINT MedicoEspecialidade_Especialidade_FK FOREIGN KEY(id_especialidade) REFERENCES Especialidade(id)
);