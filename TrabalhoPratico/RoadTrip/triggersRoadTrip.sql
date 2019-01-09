-- drop trigger anoFuncionario

delimiter $$
create trigger anoFuncionario
before insert on Funcionario
for each row 
begin
DECLARE msg varchar(255);

if((datediff(now(),new.DataNascimento))/365<18) -- temos de /365 porque datediff devolve o número de dias 
Then 
 set msg= 'Não tem idade minima para exercer funções';
          SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg; 
          
elseif ((datediff(now(),new.DataNascimento))/365>65)
Then 
 set msg= 'EXCEDEU A IDADE PARA EXERCER FUNÇÕES';
          SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg; 
end if; 
end 
$$

-- trigger para delimitar a idade do cliente pois ele deverá ter mais de 18 anos 
-- drop trigger clienteInvalido
-- drop trigger idadeInvalida

delimiter $$
create trigger idadeInvalida
before insert on Cliente
for each row 
begin
DECLARE msg varchar(255);

if((datediff(now(),new.DataNascimento))/365<18) -- temos de /365 porque datediff devolve o número de dias 
Then 
 set msg= 'Não tem idade minima para conduzir';
          SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg; 

end if; 
end 
$$

-- atualizar o valor do aluguer 
-- drop trigger atualizarValor

delimiter $$
create trigger atualizarValor 
before insert on Aluguer
for each row 
begin
	declare totalAluguer decimal (8,2);
	declare seguro decimal (8,2);
	declare precoDocarroNovo decimal (8,2);
	declare taxas decimal (8,2);
	declare diasDeAluguer decimal (8,2);
	declare anosDoCarro int; 
	declare precoPorDia decimal (8,2);
    
	select precoSeguro into seguro from Seguro where idSeguro= New.Seguro;
	select precoEmNovo into precoDocarroNovo from Veiculo where idVeiculo=New.Veiculo; 
	select taxaDesvalorizacao into taxas from Veiculo where idVeiculo=New.Veiculo; 
	SELECT TIMESTAMPDIFF(YEAR, curdate(), anoCompra) into anosDoCarro from Veiculo where idVeiculo=New.Veiculo; 

	set diasDeAluguer := datediff(New.dataPrevistaEntrega,New.dataPrevistaLevantamento) ; 
	set precoPorDia :=(precoDocarroNovo - (precoDocarroNovo*taxas*anosDoCarro))/365; 
  
	if New.precoAluguer is null then
		set New.precoAluguer = precoPorDia*diasDeAluguer+seguro*diasDeAluguer ; 
	end if ; 
  
end; $$

-- Atualizar o numero de quilometros do carro 
-- drop trigger atualizarNrKm 

delimiter $$
create trigger atualizarNrKm
before update on Aluguer
for each row 
begin
DECLARE msg varchar(255);
	if New.kmsPercorrido <> old.kmsPercorrido && old.kmsPercorrido = 0 && new.kmsPercorrido>0  then 
		update Veiculo 
			set nr_Kms= nr_Kms + New.kmsPercorrido where idVeiculo=New.Veiculo; -- se é 1ª vez adiciona o novo valor
	elseif new.kmsPercorrido>0 then 
		update Veiculo 
			set nr_Kms= nr_Kms - old.kmsPercorrido + New.kmsPercorrido where idVeiculo=New.Veiculo;  -- caso aconteça algum erro de escrita permite atualizar e manter a integridade do dos dados com a tabela aluguer
	else 
		set msg= 'Número de kms adicionado incorreto';
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg; 
	end if;
end; $$



-- trigger que verifica se o Cliente tem carta de condução, caso não tenha não deixa efetuar o aluguer 
-- drop trigger verificaCartaConducao 
delimiter $$
create trigger verificaCartaConducao
before insert on Aluguer
for each row 
begin
	DECLARE msg varchar(255);
	declare cartaCond tinyint; 
	
    select cartaConducao into cartaCond from Cliente where idCliente=new.Cliente;
	if cartaCond = 0 then 
		set msg= 'Aluguer rejeitado porque cliente não tem carta de conducao';
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg; 
	end if; 
end 
$$



-- drop procedure registarAluguerParaClienteNovo

delimiter $$
create procedure registarAluguerParaClienteNovo (IN NomeCliente VARCHAR(80), IN dataNasc DATE, IN Pais INT, in cartaConducao tinyint,
																				IN  Veiculo INT, IN Seguro INT,IN  Funcionario INT, IN caucao DECIMAL(8,2), IN dataAluguer DATE, 
                                                                                IN dataPrevistaLevantamento DATE, IN dataPrevistaEntrega DATE)
                                                                                
BEGIN 
declare ClienteID INT; 
declare erro bool default 0;
declare continue handler for sqlexception set erro=1;

start transaction;

insert into Cliente (idCliente,nome,dataNascimento, pais, cartaConducao )
			values (idCliente,NomeCliente,dataNasc, Pais, cartaConducao ); 
select idCliente into ClienteID
from Cliente
order by idCliente DESC 
LIMIT 1;

insert into Aluguer (idAluguer,dataAluguer,dataPrevistaLevantamento,dataPrevistaEntrega,Cliente,Veiculo,Seguro, Funcionario,caucao) 
		values (idAluguer,dataAluguer,dataPrevistaLevantamento,dataPrevistaEntrega,ClienteID,Veiculo,Seguro, Funcionario,caucao);        


IF ERRO
THEN rollback;
ELSE COMMIT; 
END IF;
END $$

