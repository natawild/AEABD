
USE `vendas` ;

-- drop database vendas; 

INSERT INTO Categoria 
VALUES('Higiene',1),('Alimentacao',2),('Vegetais',3),('Bebidas',4);

INSERT INTO Profissao
VALUES(1,'Talhante'),(2,'Bombeiro'), (3,'Informatico'), (4,'cabeleireiro'), (5,'jardineiro'),(6,'cozinheiro'); 

INSERT INTO Cliente
VALUES('Manuel',1, 0.0, 1), ('José',2, 0.0, 2),
('Carla',3, 0.0, 3),('Maria',4, 0.0, 4); 


INSERT INTO Venda 
VALUES(1,'2018-01-01', 0.0, 1), (2,'2018-03-01', 0.0, 1),(3,'2018-02-01', 0.0, 1),
(4,'2018-04-01', 0.0, 1),(5,'2018-05-01', 0.0, 1),(6,'2018-06-01', 0.0, 1); 


INSERT INTO Produto
VALUES(1,'gel de banho',1, 0.9), (2,'massa',2, 0.6),(3,'arroz',2, 0.75),(4,'shampoo',1, 3.99),
(5,'batatas',3, 1),(6,'sumol laranja',4, 1.20),(7,'cenouras',3, 0.45),(8,'beterraba',3, 2.1);


INSERT INTO VendaProduto
VALUES(1,1,0.1,0.0,0.0), (1,2,1,0.0,0.0), (2,1,4,0.0,0.0), (1,3,0.0,0.0,0.0), (3,1,0.0,0.0,0.0), (1,4,0.0,0.0,0.0); 



 


