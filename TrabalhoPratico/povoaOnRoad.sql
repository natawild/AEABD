USE `roadTrip` ;

INSERT INTO `Pais` (`idPais`, `descricao`) 
VALUES (1, 'Holanda'), 
(idPais, 'Portugal'), (idPais, 'Espanha'), (idPais, 'Argentina'), (idPais, 'Franca'),
 (idPais, 'Canadá'), (idPais, 'Croácia'), (idPais, 'Suécia'), (idPais, 'Brasil'),
 (idPais, 'Luxemburgo'), (idPais, 'Alemanha'),
(idPais, 'Inglaterra'), (idPais, 'Argélia'), (idPais, 'Austria'), (idPais, 'Belgica');
 
 INSERT INTO `Seguro` (`idSeguro`, `dataValidade`, `precoSeguro`) VALUES (1, '2019-12-16', '2.90'),
(idSeguro, '2020-11-19', '0.00'),  (idSeguro, '2018-11-05', '5.99'),  (idSeguro, '2018-08-09', '0.72'), 
(idSeguro, '2018-05-27', '2.12'),  (idSeguro, '2020-07-11', '11.90'), (idSeguro, '2018-07-14', '2.00'), 
(idSeguro, '2019-12-28', '3.50'),  (idSeguro, '2018-10-19', '8.03'),  (idSeguro, '2020-08-25', '67.77'), 
(idSeguro, '2015-05-06', '9.99'), (idSeguro, '2018-08-10', '23.01'), (idSeguro, '2019-10-31', '76.39'), 
(idSeguro, '2018-12-04', '4.07'), (idSeguro, '2019-01-06', '6.71'), (idSeguro, '2020-02-17', '3.99'), 
(idSeguro, '2018-12-23', '6.90'), (idSeguro, '2019-03-05', '10.99'), (idSeguro, '2021-02-24', '3.49'), 
(idSeguro, '2021-08-04', '8.99');

INSERT INTO `Cidade` (`idCidade`, `descricao`, `pais`) VALUES (1, ' Coimbra', 1), (idCidade, ' Leiria', 1), (idCidade, ' Guimaraes', 1), 
(idCidade, ' Silves', 1), (idCidade, ' Tomar', 1), (idCidade, ' Beja', 1), (idCidade, ' Viana do Castelo', 1), 
(idCidade, ' Tavira', 1),(idCidade, ' Cascais', 1), (idCidade, ' Portalegre', 1), (idCidade, ' Lisboa', 1), (idCidade, ' Viseu', 1),
 (idCidade, ' Barcelos', 1), (idCidade, ' Vila Nova de Famalicão', 1), (idCidade, ' Aveiro', 1), (idCidade, ' Faro', 1), 
 (idCidade, ' Sintra', 1), (idCidade, ' Elvas', 1), (idCidade, ' Albufeira', 1), (idCidade, ' Lagos', 1), (idCidade, ' Almada', 1), 
 (idCidade, ' Évora', 1), (idCidade, ' Guimaraes', 1), (idCidade, ' Porto', 1), (idCidade, ' Maia', 1), (idCidade, ' Paris', 5), (idCidade, ' Londres', 12);

INSERT INTO `Veiculo` (`idVeiculo`, `matricula`, `precoEmNovo`, `marca`, `modelo`, `nr_Kms`, `anoCompra`, `taxaDesvalorizacao`) 
VALUES (1, '47-WT-55', '25000.00', 'Fiat', 'Punto', '1056.00', '2018-05-20', '0.050'), 
(idVeiculo, '47-rs-25', '30000.00', 'Mercedes', 'cla', '1000.00', '2017-04-19', '0.100'), 
(idVeiculo, '47-rs-26', '50000.00', 'Mercedes', 'gla', '10000.00', '2018-04-19', '0.100'), 
(idVeiculo, '50-20-rs', '27000.00', 'Seat', 'f', '0.00', '2018-04-19', '8.000'), 
(idVeiculo, '47-rs-30', '18000.00', 'Kia', 'f', '0.00', '2018-04-19', '8.000'), 
(idVeiculo, '47-QP-47', '26000.00', 'Hyundai', 'i20', '100.00', '2018-09-19', '0.500'), 
(idVeiculo, '47 rs', '54000.00', 'Hyundai', 'i30', '2000.00', '2017-04-19', '0.500'), 
(idVeiculo, '25-PZ-99', '25000.00', 'Renault', 'Captur', '2000.00', '2017-04-19', '0.300'), 
(idVeiculo, '83-RJ-26', '30000.00', 'Renault', 'Megane', '200.00', '2018-05-19', '0.300'), 
(idVeiculo, '04-WE-OP', '33000.00', 'Ford', 'Fiesta', '33600.00', '2016-04-19', '0.800'), 
(idVeiculo, '85-RX-56', '28000.00', 'Tesla', 'Model S', '100.00', '2018-04-19', '0.0050'), 
(idVeiculo, '25-99-PZ', '25000.00', 'Tesla', 'Model X', '200.00', '2018-04-19', '0.0050'), 
(idVeiculo, '42-TW-39', '60000.00', 'Toyota', 'CHR', '0.00', '2018-05-10', '0.060'), 
(idVeiculo, '99-XY-20', '90000.00', 'Toyota', 'CHR', '0.00', '2018-05-10', '0.050'), 
(idVeiculo, '47-QX-19', '17000.00', 'Ford', 'Focus', '0.00', '2018-04-19', '0.040'), 
(idVeiculo, '47-YY-30', '19500.00', 'Toyota', 'yaris', '289.00', '2016-04-19', '0.090'), 
(idVeiculo, '47-ZZ-50', '28900.00', 'Renault', 'Zoe', '2223.00', '2018-08-27', '0.008'); 


INSERT INTO `Cliente` (`idCliente`, `nome`, `nif`, `dataNascimento`, `pais`, `cidade`, `rua`) 
VALUES (1, 'Célia Figueiredo', '262646080', '1993-12-24', '1', '13', 'rua da Costa'), 
(idCliente, 'Célia Figueiredo', '262646080', '1993-12-24', '1', '12', 'rua da Costa'), 
(idCliente, 'Célia Figueiredo', '262646080', '1993-12-24', '1', '14', 'rua da Costa'), 
(idCliente, 'Márcia Figueiredo', '262646080', '1994-01-21', '1', '3', 'rua do pinheiro'),
(idCliente, 'Junior', '262646080', '1993-12-24', '1', '15', 'rua da Costa'), 
(idCliente, 'Pedro', '262646080', '1993-12-24', '1', '16', 'rua da Costa'), 
(idCliente, 'Marco', '262646080', '1993-12-24', '1', '17', 'rua da Costa'), 
(idCliente, 'Luis', '262646080', '1993-12-24', '1', '18', 'rua da Costa'), 
(idCliente, 'Ricardo', '262646080', '1993-12-24', '1', '19', 'rua da Costa'), 
(idCliente, 'Joana', '262646080', '1993-12-24', '1', '20', 'rua da Costa'), 
(idCliente, 'Margarida', '262646080', '1993-12-24', '1', '21', 'rua da Costa'), 
(idCliente, 'Juliana', '262646080', '1993-12-24', '1', '22', 'rua da Costa'), 
(idCliente, 'Cristina', '262646080', '1993-12-24', '1', '23', 'rua da Costa'), 
(idCliente, 'Maria', '262646080', '1993-12-24', '1', '24', 'rua da Costa'), 
(idCliente, 'Josefina Catarro', '262646080', '1993-12-24', '1', '25', 'rua da Costa'), 
(idCliente, 'José Carlos Malato', '262246080', '1993-12-24', '1', '17', 'rua da Costa'), 
(idCliente, 'Catalina Pestana', '232646080', '1980-12-24', '1', '11', 'rua da Costa'), 
(idCliente, 'António Costa', '342645080', '1974-12-24', '1', '11', 'rua da Costa'), 
(idCliente, 'José Socrates', '782666080', '1970-12-24', '1', '11', 'rua da Costa'), 
(idCliente, 'Luis Montenegro', '197646080', '1971-01-13', '1', '11', 'rua da Costa') ; 



INSERT INTO `Funcionario` (`idFuncionario`, `data_contrato`, `salario`, `telemovel`, `email`, `nome`, `cidade`,`pais`, `rua`, `FuncionarioSuperior`) 
VALUES (1, '2008-12-24', '1000.00', '933337717', 'celia@gmail.com', 'Natália Lemos', 13, 1,'rua da Costa', null), 
(idFuncionario, '2015-12-24', '1300.00', '933337717', 'celia@gmail.com', 'Celia Costa', 13, 1,'rua da Costa', null),
(idFuncionario, '2017-01-24', '900.00', '963126799', 'socrates@gmail.com', 'Socrates Lemos', 11, 1,'rua da Penuria', 1),
(idFuncionario, '2018-12-24', '800.00', '913336617', 'mendes@gmail.com', 'Fernando Mendes', 13, 1,'rua do preco certo', 2), 
(idFuncionario, '2018-12-24', '850.00', '924447717', 'celia@gmail.com', 'Pedro Mexia', 13, 1,'rua do mexia', 1); 



INSERT INTO `Aluguer` (`idAluguer`, `dataAluguer`, `dataPrevistaLevantamento`, `dataPrevistaEntrega`, `dataRealEntrega`, `Cliente`, `Veiculo`,`precoAluguer`, `kmsPercorrido`, `Seguro`, `campanhaDesconto`,`Funcionario`, `caucao`) 
VALUES (1, '2018-12-24', '2018-12-30', '2019-01-13', '2019-01-13', 11, 11,250.00, 900.00,1,0.00,2,500), 
(idAluguer, '2018-06-24', '2018-06-30', '2018-07-24', '2018-07-24', 2, 12,250.00, 800.00,1,0.00,2,500),
(idAluguer, '2018-06-01', '2018-06-07', '2018-06-30', '2018-06-30', 12, 1,250.00, 600.00,1,0.00,1,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 2, 12,250.00, 200.00,1,0.00,1,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 13, 3,250.00, 200.00,1,0.00,1,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 2, 4,250.00, 234.00,1,0.00,1,500),
(idAluguer, '2017-06-13', '2017-07-01', '2017-07-29', '2017-07-30', 14, 2,250.00, 3455.00,1,0.00,1,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 3, 5,250.00, 345.00,1,0.00,1,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 3, 6,250.00, 698.00,1,0.00,1,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 3, 7,250.00, 300.00,1,0.00,2,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 15, 7,250.00, 235.00,1,0.00,1,500),
(idAluguer, '2017-12-24', '2017-12-24', '2017-12-24', '2017-12-24', 4, 8,250.00, 457.00,1,0.00,1,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 4, 9,250.00, 345.00,1,0.00,1,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 4, 10,250.00, 678.00,1,0.00,1,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 15, 11,250.00, 841.00,1,0.00,1,500),
(idAluguer, '2017-12-24', '2017-12-24', '2017-12-24', '2017-12-24', 14, 12,250.00, 356.00,1,0.00,1,500),
(idAluguer, '2017-12-24', '2017-12-24', '2017-12-24', '2017-12-24', 13, 12,250.00, 666.00,1,0.00,1,500),
(idAluguer, '2017-12-24', '2017-12-24', '2017-12-24', '2017-12-24', 12, 13,250.00, 777.00,1,0.00,2,500),
(idAluguer, '2017-12-24', '2017-12-24', '2017-12-24', '2017-12-24', 11, 14,250.00, 990.00,1,0.00,1,500),
(idAluguer, '2017-01-24', '2017-02-24', '2017-03-24', '2017-03-24', 10, 15,250.00, 346.00,1,0.00,2,500),
(idAluguer, '2017-12-24', '2017-12-24', '2017-12-24', '2017-12-24', 19, 16,250.00, 678.00,1,0.00,1,500),
(idAluguer, '2017-12-24', '2017-12-24', '2017-12-24', '2017-12-24', 18, 17,250.00, 67.00,1,0.00,2,500),
(idAluguer, '2017-08-24', '2017-09-24', '2017-10-24', '2017-12-24', 19, 2,250.00, 56.00,1,0.00,3,500),
(idAluguer, '2017-12-24', '1993-12-24', '1993-12-24', '2017-12-24', 20, 3,250.00, 78.00,1,0.00,3,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 19, 4,250.00, 77.00,1,0.00,4,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 18, 5,250.00, 89.00,1,0.00,2,500),
(idAluguer, '2018-09-24', '2018-10-24', '2018-11-24', '2018-11-24', 17, 6,250.00, 443.00,1,0.00,4,500),
(idAluguer, '2018-12-24', '2018-12-24', '2018-12-24', '2018-12-24', 16, 7,250.00, 4567.00,1,0.00,3,500); 



