
-- antes de apagar um utilizador com vendas guardas as vendas realizadas como se fosse um utilizador não registado 

SELECT * FROM Pais; 

SELECT * FROM Seguro; 

SELECT * FROM Cidade; 

SELECT * FROM Cliente; 

SELECT * FROM Funcionario; 

SELECT * FROM Veiculo; 

SELECT * FROM Aluguer; 

UPDATE Aluguer
SET dataRealEntrega = null 
WHERE idAluguer = 2; 


-- Lista dos 5 clientes que mais efetuaram alugures em 2018 
SELECT nome, COUNT(a.idAluguer) as nAlugueres from Cliente as c 
INNER JOIN Aluguer as a 
	ON c.idCliente=a.Cliente 
    WHERE YEAR (a.dataAluguer) = '2018' 
    GROUP BY idCliente 
    ORDER BY nAlugueres desc 
    LIMIT 5;  

-- os clientes com mais de 2 alugueres na empresa 
SELECT nome, COUNT(a.idAluguer) as nAlugueres from Cliente as c 
INNER JOIN Aluguer as a 
	ON c.idCliente=a.Cliente 
    GROUP BY idCliente 
    HAVING nAlugueres >2
    ORDER BY nAlugueres desc 
    LIMIT 5;  


-- Quantos alugueres tivemos em 2018?
SELECT COUNT(idAluguer) AS nrAlugueres FROM Aluguer
WHERE YEAR (dataAluguer)= '2018'; 


-- Quantos dos nossos clientes sao de Portugal? (Portugal id=1)
SELECT COUNT(idCliente) AS nrClientesPortugueses FROM Cliente 
WHERE pais = 1; 

-- ou 

SELECT COUNT(idCliente) AS nrClientesPortugueses FROM Cliente as C
	INNER JOIN Pais as P
		ON C.Pais=P.idPais
WHERE P.designacao = 'Portugal'; 


-- Quais os veiculos alugados pela Rita Pereira que ainda não foram entregues?
Select marca , a.dataPrevistaEntrega FROM Veiculo AS V INNER JOIN Aluguer AS A
ON V.idVeiculo=A.Veiculo
WHERE a.Cliente = 2 AND a.dataPrevistaEntrega > current_date; 


-- Quais os veiculos que a sua entrega está atrasada 
SELECT V.marca, V.matricula, a.dataPrevistaEntrega FROM Veiculo as V
INNER JOIN Aluguer AS a
	ON V.idVeiculo=a.Veiculo
    WHERE a.dataPrevistaEntrega > current_date AND dataRealEntrega = null ; 



    
--     quais os clientes que alugrama carros com o tipo de seguro A 

    

-- Teste do limite de idade para exercer funcoes na empresa 
INSERT INTO Funcionario (`idFuncionario`, `data_contrato`, `salario`, `telemovel`, `email`, `nome`, `cidade`,`pais`, `rua`,`dataNascimento`, `FuncionarioSuperior`) 
VALUES
(idFuncionario, '2018-12-24', '850.00', '924447717', 'celia@gmail.com', 'Pedro Mexia', 13, 1,'rua do mexia', '1900-12-24',1); 

INSERT INTO Funcionario (`idFuncionario`, `data_contrato`, `salario`, `telemovel`, `email`, `nome`, `cidade`,`pais`, `rua`,`dataNascimento`, `FuncionarioSuperior`) 
VALUES
(idFuncionario, '2018-12-24', '850.00', '924222717', 'celia@gmail.com', 'Pedro Mexia', 13, 1,'rua do mexia', '2015-12-24',1); 


-- Teste do trigger da idade do cliente 
INSERT INTO `Cliente` (`idCliente`, `nome`, `nif`, `dataNascimento`, `pais`, `cidade`, `rua`, `cartaConducao`, `email`, `telemovel`) 
VALUES (idCliente, 'Célia Figueiredo', '262646080', '2016-12-24', '1', '13', 'rua da Costa', 1,'a@gmail.com','912345678'); 


SELECT TIMESTAMPDIFF(YEAR, dataAluguer, CURDATE()) from Aluguer; 

-- testar o trigger de atualizacao de preco de aluguer 
INSERT INTO `Aluguer` (`idAluguer`, `dataAluguer`, `dataPrevistaLevantamento`, `dataPrevistaEntrega`, `dataRealEntrega`, `Cliente`, `Veiculo`, `kmsPercorrido`, `Seguro`,`Funcionario`, `caucao`) 
VALUES (idAluguer, '2018-12-24', '2018-12-30', '2019-01-13', '2019-01-13', 11, 11, 900.00,1,2,500); 

-- testar o update do trigger de atualizacao dos quilometros
UPDATE Aluguer
SET kmsPercorrido = 500 WHERE idAluguer=1; 







