
SELECT * FROM Livro; 

SELECT * FROM Autor; 

SELECT * FROM LivroAutor; 

SELECT Titulo  FROM Livro
WHERE DataPublicacao = '2012-01-01'; 


-- Obter uma lista com os livros publicados entre 2012-01-01 e 2014-01-01
SELECT Titulo FROM Livro 
WHERE DataPublicacao BETWEEN '2012-01-01' AND '2014-01-01'; 

-- Lista com o nome dos autores cujos livros foram publicados no ano de 2017
SELECT Nome FROM Autor AS a 
	INNER JOIN LivroAutor AS la 
		ON a.idAutor=la.Autor 
        INNER JOIN Livro as l
			ON la.Livro=l.idLivro
			WHERE YEAR (l.dataPublicacao)='2017'; 
            
-- Listar todos os livros do autor 'Zeferino Livros'      

SELECT Titulo FROM Livro AS l
			INNER JOIN LivroAutor AS la
				ON la.Livro=l.idLivro 
					INNER JOIN Autor AS a
                    ON a.idAutor=la.Autor
                   WHERE a.Nome = 'Zeferino Livros'; 
		
		
            
-- Remover da base de dados toda a informaçao relativa aos livros que tenham como autor 'Zeferino Livros'
DELETE FROM Autor
        WHERE EXISTS 
			(SELECT Titulo FROM Livro AS l
			INNER JOIN LivroAutor AS la
				ON la.Livro=l.idLivro 
					INNER JOIN Autor AS a
                    ON a.idAutor=la.Autor
                   WHERE a.Nome = 'Zeferino Livros'); 
		
    
    
DELETE FROM Autor, LivroAutor, Livro 
        WHERE  a.idAutor=la.Autor AND a.Nome = 'Zeferino Livros' AND l.idLivro=la.Livro;      
	


