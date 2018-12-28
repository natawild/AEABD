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