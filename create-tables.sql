CREATE TABLE marca (
	id BIGINT IDENTITY (1, 1) NOT NULL,
	descricao VARCHAR (100) NOT NULL,
	CONSTRAINT pk_marca PRIMARY KEY (id),
	CONSTRAINT uq_marca UNIQUE (descricao)
);

CREATE TABLE modelo (
	id BIGINT IDENTITY (1, 1) NOT NULL,
	descricao VARCHAR (100) NOT NULL,
	id_marca BIGINT NOT NULL,
	CONSTRAINT pk_modelo PRIMARY KEY (id),
    CONSTRAINT fk_modelo_marca FOREIGN KEY (id_marca) REFERENCES marca (id),
	CONSTRAINT uq_modelo UNIQUE (descricao)
);

CREATE TABLE automovel (
	id BIGINT IDENTITY (1, 1) NOT NULL,
	placa VARCHAR (10) NOT NULL,
	numero_portas INT NOT NULL,
	tipo_combustivel VARCHAR (20) NOT NULL,
	quilometragem INT NOT NULL,
	cor VARCHAR (30) NOT NULL,
	ano INT NOT NULL,
	chassi VARCHAR (50) NOT NULL,
	valor_locacao NUMERIC (8, 2) NOT NULL,
    id_modelo BIGINT NOT NULL,
	CONSTRAINT pk_automovel PRIMARY KEY (id),
    CONSTRAINT fk_automovel_modelo FOREIGN KEY (id_modelo) REFERENCES modelo (id),
	CONSTRAINT uq_automovel UNIQUE (chassi)
);

CREATE TABLE cliente (
	id BIGINT IDENTITY (1, 1) NOT NULL,
	cpf_cnpj VARCHAR (15) NOT NULL,
	nome VARCHAR (100) NOT NULL,
	email VARCHAR (50) NOT NULL,
	end_logradouro VARCHAR (100) NOT NULL,
	end_numero INT NOT NULL,
	end_complemento VARCHAR (100),
	end_bairro VARCHAR (100) NOT NULL,
	end_cep VARCHAR (10) NOT NULL,
	end_localidade VARCHAR (100) NOT NULL,
	end_uf VARCHAR (2) NOT NULL,
	pontuacao BIGINT NOT NULL,
	CONSTRAINT pk_cliente PRIMARY KEY (id),
	CONSTRAINT uq_cliente UNIQUE (cpf_cnpj)
);

CREATE TABLE telefone (
	numero VARCHAR (15) NOT NULL,
	id_cliente BIGINT NOT NULL,
	CONSTRAINT pk_telefone PRIMARY KEY (numero, id_cliente),
	CONSTRAINT fk_telefone_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id),
	CONSTRAINT uq_telefone UNIQUE (numero)
);

CREATE TABLE locacao (
	id BIGINT IDENTITY (1, 1) NOT NULL,
	data_locacao DATE NOT NULL,
	data_devolucao DATE,
	quilometragem INT,
	valor NUMERIC (8, 2)NOT NULL,
    id_automovel BIGINT NOT NULL,
    id_cliente BIGINT NOT NULL,
	CONSTRAINT pk_locacao PRIMARY KEY (id),
    CONSTRAINT fk_locacao_automovel FOREIGN KEY (id_automovel) REFERENCES automovel (id),
    CONSTRAINT fk_locacao_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id)
);