
USE `livro` ;

-- drop database livro; 

INSERT INTO Livro 
VALUES(1,'Os Maias',current_date(),'Este livro está relacionado com a historia de Pedro Maia...'),
(2,'Os Maias','2013-01-01','Este livro está relacionado com a historia de Pedro Maia...'),
(3,'Maias','2013-05-06','Este livro está relacionado com a historia de Pedro Maia...'), 
(4,'As estrelas no ceu',current_date(),'Este livro está relacionado com a historia de Pedro Maia...'),
(5,'Livro do Zefrino','2013-01-03','Este livro está relacionado com a historia de Pedro Maia...'),
(6,'As estrelas no ceu','2017-02-03','Este livro está relacionado com a historia de Pedro Maia...'),
(7,'As estrelas no ceu','2012-09-11','Este livro está relacionado com a historia de Pedro Maia...'),
(8,'Os ','2012-01-01','Este livro está relacionado com a historia de Pedro Maia...'); 

INSERT INTO Autor
VALUES(1,'Manuel Maria', 'manuel@gmail.com', 'portuguesa', 'Este autor morreu com cancro'), 
(2,'José Carlos', 'manuel@gmail.com', 'portuguesa', 'Este autor morreu com cancro'),
(3,'Manuel Carlos', 'manuelcarlos@gmail.com', 'portuguesa', 'Este autor morreu com cancro'), 
(4,'Carlos Castro', 'carlos@gmail.com', 'inglesa', 'Este autor morreu com cancro'), 
(5,'Zeferino Livros', 'zeferino@gmail.com', 'portuguesa', 'Este autor morreu com cancro'), 
(6,'Zeca Afonso', 'zeca@gmail.com', 'portuguesa', 'Este autor morreu com cancro'),
(7,'Daniel Milheiro', 'daniel@gmail.com', 'portuguesa', 'Este autor morreu com cancro'); 

INSERT INTO LivroAutor
VALUES(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7); 