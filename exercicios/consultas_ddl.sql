CREATE TABLE  IF NOT EXISTS Pessoa(
    cpf char(11) PRIMARY KEY,
    email varchar(50) not NULL,
    nome varchar(150) not NULL,
    data_nasc date not NULL,
    endereco varchar(300) not NULL,
    telefone varchar(15) NULL,
    constraint Pessoa_UN unique(email, nome)
    
);

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
