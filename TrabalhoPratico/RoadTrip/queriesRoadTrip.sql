

SELECT * FROM Pais; 

SELECT * FROM Seguro; 

SELECT * FROM Cidade; 

SELECT * FROM Cliente; 

SELECT * FROM Funcionario; 

SELECT * FROM Veiculo; 

SELECT * FROM Aluguer; 

UPDATE Aluguer
SET dataRealEntrega = null ,dataPrevistaEntrega = '2019-01-03'
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
    WHERE a.dataPrevistaEntrega <= current_date AND dataRealEntrega is null ; 


--     quais os clientes que alugaram carros com o tipo de seguro A 
SELECT DISTINCT (C. idCliente), C.nome, S.descricao FROM Cliente AS C 
INNER JOIN Aluguer AS A 
	ON C.idCliente=A.Cliente
    INNER JOIN Seguro AS S 
		ON A.Seguro=S.idSeguro
        WHERE S.descricao LIKE '%A - %'; 
-- ou 

SELECT DISTINCT (C. idCliente), C.nome FROM Cliente AS C 
INNER JOIN Aluguer AS A 
	ON C.idCliente=A.Cliente
        WHERE a.Seguro = 1; 
        
        
-- quais os funcionário que efetuaram mais vendas no mes de dezembro de 2018 
SELECT SUM(A.precoAluguer) AS vendas, F.nome FROM Funcionario as F 
INNER JOIN Aluguer AS A 
	ON F.idFuncionario=A.Funcionario
		WHERE YEAR (A.dataAluguer) = '2018' AND MONTH (A.dataAluguer) = '12'
        GROUP BY F.idFuncionario
        ORDER BY vendas DESC
        LIMIT 2; 

SELECT MONTH ('2018-12-01'); 




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
SET kmsPercorrido = 250 WHERE idAluguer=4; 

-- mostrar o erro 
UPDATE Aluguer
SET kmsPercorrido = -500 WHERE idAluguer=1; 

-- Inserir um aluguer para o veiculo 4 
INSERT INTO `Aluguer` (`idAluguer`, `dataAluguer`, `dataPrevistaLevantamento`, `dataPrevistaEntrega`, 
`dataRealEntrega`, `Cliente`, `Veiculo`,`precoAluguer`, `kmsPercorrido`, `Seguro`,`Funcionario`, `caucao`) 
VALUES 
(idAluguer, '2018-01-24', '2018-02-24', '2018-03-24', null , 2, 4,550.00, 0,2,1,500); 

UPDATE Aluguer
SET kmsPercorrido = 200 WHERE idAluguer=30;  -- após este update o veiculo deverá ficar com 450

-- exemplo do erro: o funcionário inseriu o valor errado, afinal deveria ser 250: os que estavam lá 450 - 200 mal adicionados + 250 = 500 
UPDATE Aluguer
SET kmsPercorrido = 250 WHERE idAluguer=30;



-- testar o procedimento para a inserção de um novo cliente não registado 
call registarAluguerParaClienteNovo ('Luis', '1989-06-22', 1, 1, 7, 1,  3, 900, '2018-10-29','2019-01-01','2019-01-20' ) ; 


UPDATE Cliente 
SET cartaConducao = 0 Where idCliente=20; 

-- testar o trigger que valida se o cliente que aluga tem carta de carta de condução 
INSERT INTO `Aluguer` (`idAluguer`, `dataAluguer`, `dataPrevistaLevantamento`, `dataPrevistaEntrega`, `dataRealEntrega`, `Cliente`, `Veiculo`, `kmsPercorrido`, `Seguro`,`Funcionario`, `caucao`) 
VALUES (idAluguer, '2018-12-24', '2018-12-30', '2019-01-13', '2019-01-13', 20, 11, 900.00,1,2,500); 

-- o nome das pessoas que alugam fiat 
SELECT DISTINCT C.nome, V.marca From Cliente as C
			INNER JOIN Aluguer as A 
				ON C.idCliente = A.Cliente
                INNER JOIN Veiculo as V
                ON A.Veiculo = V.idVeiculo
                -- WHERE A.veiculo = 1 ; 
				WHERE V.marca = 'fiat'; 

-- Para saber o tamanho da base de dados 
SELECT table_schema "roadTrip",
        ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB" 
FROM information_schema.tables 
GROUP BY table_schema; 

-- Em MB 

SELECT
SUM(ROUND(((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024), 2)) AS "SIZE IN MB"
FROM INFORMATION_SCHEMA.TABLES
WHERE
TABLE_SCHEMA = "roadTrip";

-- Em GB 
SELECT
SUM(ROUND(((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024 / 1024), 2)) AS "SIZE IN GB"
FROM INFORMATION_SCHEMA.TABLES
WHERE
TABLE_SCHEMA = "roadTrip";

