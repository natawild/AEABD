
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
 (idCidade, ' Évora', 1), (idCidade, ' Guimaraes', 1), (idCidade, ' Porto', 1), (idCidade, ' Maia', 1);

INSERT INTO `Veiculo` (`idVeiculo`, `matricula`, `precoEmNovo`, `marca`, `modelo`, `nr_Kms`, `anoCompra`, `taxaDesvalorizacao`) 
VALUES (1, '47 rs', '25000.00', 'fiat', 'f', '0.00', '2018-04-19', '8.000'), 
(idVeiculo, '47-rs-25', '30000.00', 'mercedes', 'f', '0.00', '2017-04-19', '8.000'), 
(idVeiculo, '47-rs-26', '50000.00', 'mercedes', '', '0.00', '2018-04-19', '8.000'), 
(idVeiculo, '50-20-rs', '27000.00', 'l', 'f', '0.00', '2018-04-19', '8.000'), 
(idVeiculo, '47-rs-30', '18000.00', 'l', 'f', '0.00', '2018-04-19', '8.000'), 
(idVeiculo, '47 rs', '26000.00', 'l', 'f', '0.00', '2016-04-19', '8.000'), 
(idVeiculo, '47 rs', '54000.00', 'l', 'f', '0.00', '2018-04-19', '8.000'), 
(idVeiculo, '47 rs', '33000.00', 'l', 'f', '0.00', '2017-04-19', '8.000'), 
(idVeiculo, '47 rs', '29000.00', 'l', 'f', '0.00', '2017-04-19', '8.000'), 
(idVeiculo, '47 rs', '33000.00', 'l', 'f', '0.00', '2016-04-19', '8.000'), 
(idVeiculo, '47 rs', '28000.00', 'l', 'f', '0.00', '2018-04-19', '8.000'), 
(idVeiculo, '47 rs', '25000.00', 'l', 'f', '0.00', '2017-04-19', '8.000'), 
(idVeiculo, '47 rs', '60000.00', 'l', 'f', '0.00', '2017-04-19', '8.000'), 
(idVeiculo, '47 rs', '90000.00', 'tesla', 'f', '0.00', '2017-04-19', '8.000'), 
(idVeiculo, '47 rs', '17000.00', 'ford', 'f', '0.00', '2018-04-19', '8.000'), 
(idVeiculo, '47 rs', '19500.00', '', 'f', '0.00', '2016-04-19', '8.000'), 
(idVeiculo, '47 rs', '28900.00', 'l', 'f', '0.00', '2017-04-19', '8.000'); 


INSERT INTO `Cliente` (`idCliente`, `nome`, `nif`, `dataNascimento`, `pais`, `cidade`, `rua`) 
VALUES (1, 'Célia Figueiredo', '262646080', '1993-12-24', '1', '13', 'rua da Costa'), 
(idCliente, 'Célia Figueiredo', '262646080', '1993-12-24', '1', '13', 'rua da Costa'), 
(idCliente, 'Célia Figueiredo', '262646080', '1993-12-24', '1', '13', 'rua da Costa'); 



INSERT INTO `Funcionario` (`idFuncionario`, `data_contrato`, `salario`, `telemovel`, `email`, `nome`, `cidade`,`pais`, `rua`, `FuncionarioSuperior`) 
VALUES (1, '1993-12-24', '1000.00', '933337717', 'celia@gmail.com', 'Natália Lemos', 13, 1,'rua da Costa', null), 
(idFuncionario, '2015-12-24', '1000.00', '933337717', 'celia@gmail.com', 'Natália Lemos', 13, 1,'rua da Costa', null); 

INSERT INTO `Aluguer` (`idAluguer`, `dataAluguer`, `dataPrevistaLevantamento`, `dataPrevistaEntrega`, `dataRealEntrega`, `Cliente`, `Veiculo`,`precoAluguer`, `kmsPercorrido`, `Seguro`, `campanhaDesconto`,`Funcionario`, `caucao`) 
VALUES (1, '2018-12-24', '2018-12-30', '2019-01-13', '2019-01-13', 1, 1,250.00, 1000.00,1,0.00,1,500), 
(idAluguer, '1993-12-24', '1993-12-24', '1993-12-24', '1993-12-24', 1, 1,250.00, 1000.00,1,0.00,1,500); 




