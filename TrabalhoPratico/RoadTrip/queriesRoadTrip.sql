

-- antes de apagar um utilizador com vendas guardas as vendas realizadas como se fosse um utilizador não registado 

SELECT * FROM Pais; 

SELECT * FROM Seguro; 

SELECT * FROM Cidade; 

SELECT * FROM Cliente; 

SELECT * FROM Funcionario; 

SELECT * FROM Veiculo; 

SELECT * FROM Aluguer; 


-- Quantos alugueres tivemos em 2018?
SELECT COUNT(idAluguer) AS nrAlugueres FROM Aluguer
WHERE YEAR (dataAluguer)= '2018'; 

-- Quantos dos nossos clientes são portugueses? (POrtugal id=1)
SELECT COUNT(idCliente) AS nrClientesPortugueses FROM Cliente 
WHERE pais = 1; 

-- Quais os veiculos alugados pela Rita Pereira que ainda não foram entregues?
Select marca , a.dataPrevistaEntrega FROM Veiculo AS V INNER JOIN Aluguer AS A
ON V.idVeiculo=A.Veiculo
WHERE a.Cliente = 2 AND a.dataPrevistaEntrega > current_date; 

-- Teste do limite de idade para exercer funcoes na empresa 
INSERT INTO Funcionario (`idFuncionario`, `data_contrato`, `salario`, `telemovel`, `email`, `nome`, `cidade`,`pais`, `rua`,`dataNascimento`, `FuncionarioSuperior`) 
VALUES
(idFuncionario, '2018-12-24', '850.00', '924447717', 'celia@gmail.com', 'Pedro Mexia', 13, 1,'rua do mexia', '1900-12-24',1); 

INSERT INTO Funcionario (`idFuncionario`, `data_contrato`, `salario`, `telemovel`, `email`, `nome`, `cidade`,`pais`, `rua`,`dataNascimento`, `FuncionarioSuperior`) 
VALUES
(idFuncionario, '2018-12-24', '850.00', '924447717', 'celia@gmail.com', 'Pedro Mexia', 13, 1,'rua do mexia', '2015-12-24',1); 

