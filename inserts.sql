--Marca
INSERT INTO marca (descricao)
VALUES ('Volkswagen');

INSERT INTO marca (descricao)
VALUES ('Fiat');

--Modelo
INSERT INTO modelo (descricao, id_marca)
VALUES ('Gol Trend G7 1.0', 1);

INSERT INTO modelo (descricao, id_marca)
VALUES ('Saveiro Tropper G6 1.6', 1);

INSERT INTO modelo (descricao, id_marca)
VALUES ('Uno Drive 1.0', 2);

INSERT INTO modelo (descricao, id_marca)
VALUES ('Moby Easy 1.0', 2);

--Automóvel
INSERT INTO automovel (placa, numero_portas, tipo_combustivel, quilometragem, cor, ano, chassi, valor_locacao, id_modelo)
VALUES ('DSE8785', 4, 'Flex', 12584, 'Branco', 2019, 'SFDD54545FVC65844', 210.00, 1);

INSERT INTO automovel (placa, numero_portas, tipo_combustivel, quilometragem, cor, ano, chassi, valor_locacao, id_modelo)
VALUES ('FRT8874', 2, 'Flex', 18654, 'Prata', 2014, 'U34ODI8987DT68757', 280.00, 2);

INSERT INTO automovel (placa, numero_portas, tipo_combustivel, quilometragem, cor, ano, chassi, valor_locacao, id_modelo)
VALUES ('JQK7685', 4, 'Flex', 5687, 'Preto', 2019, 'HF9876G9T34AOP765', 190.00, 3);

INSERT INTO automovel (placa, numero_portas, tipo_combustivel, quilometragem, cor, ano, chassi, valor_locacao, id_modelo)
VALUES ('OTD8563', 2, 'Flex', 14602, 'Cinza', 2020, 'OPI876DF987612D04', 180.00, 4);

--Cliente
INSERT INTO cliente (cpf_cnpj, nome, email, end_logradouro, end_numero, end_complemento, end_bairro, end_cep, end_localidade, end_uf, pontuacao)
VALUES ('98587854521', 'José Almeida dos Santos', 'j.a.santos@gmail.com', 'Rua Nove de Julho', 855, '', 'Jardim das Araras', '14858035', 'São Paulo', 'SP', 0);

INSERT INTO cliente (cpf_cnpj, nome, email, end_logradouro, end_numero, end_complemento, end_bairro, end_cep, end_localidade, end_uf, pontuacao)
VALUES ('77344660000114', 'Seguradora Alfa', 'contato@seguradoraalfa.com.br', 'Rua Comendados Francisco Braga', 1895, '', 'Jardim Nova Aliança', '14987003', 'Ribeirao Preto', 'SP', 0);

--Telefone
INSERT INTO telefone (numero, id_cliente)
VALUES ('16997852451', 1);

INSERT INTO telefone (numero, id_cliente)
VALUES ('11997330214', 1);

INSERT INTO telefone (numero, id_cliente)
VALUES ('19920545214', 2);

INSERT INTO telefone (numero, id_cliente)
VALUES ('17997854521', 2);

--Locação
INSERT INTO locacao (data_locacao, data_devolucao, quilometragem, valor, id_automovel, id_cliente)
VALUES ('2020-05-01', '2020-05-04', 687, 0.00, 1, 1);

INSERT INTO locacao (data_locacao, data_devolucao, quilometragem, valor, id_automovel, id_cliente)
VALUES ('2020-04-09', '2020-04-16', 1896, 0.00, 2, 1);

INSERT INTO locacao (data_locacao, data_devolucao, quilometragem, valor, id_automovel, id_cliente)
VALUES ('2020-05-18', '2020-05-21', 485, 0.00, 3, 2);

INSERT INTO locacao (data_locacao, data_devolucao, quilometragem, valor, id_automovel, id_cliente)
VALUES ('2020-04-21', '2020-04-23', 331, 0.00, 4, 2);

INSERT INTO locacao (data_locacao, data_devolucao, quilometragem, valor, id_automovel, id_cliente)
VALUES ('2020-04-27', '2020-04-30', 589, 0.00, 4, 1);