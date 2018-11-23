
use sakila; 

select * from  actor; 

select * from  category; 

select * from film; 

select * from language; 


-- Listar os titulos dos fimes que estão definidos com a categoria 'Animation'

SELECT title From film as F
INNER JOIN film_category AS fc
	ON F.film_id = fc.film_id
    INNER JOIN category AS c
		ON  fc.category_id=c.category_id
        WHERE c.name = 'Animation'
        ORDER BY F.title ASC; 

-- Lista de titulos dos filmes alfabeticamente nos quais participaram os atores 'Ed Chase'  'James Piit  , 'Sissi Sobieski' 
SELECT title From film as F
INNER JOIN film_category AS fc
	ON F.film_id = fc.film_id
        INNER JOIN film_actor as FA
			ON FA.film_id=F.film_id
            INNER JOIN actor AS A
				ON A.actor_id=FA.actor_id
		WHERE A.first_name='Ed' AND A.last_name='Chase' 
					OR A.first_name='James' AND A.last_name='Pitt' 
                    OR A.first_name='Sissi' AND A.last_name='Sobieski' 
        ORDER BY F.title ASC; 
        

-- inserir um novo filme na base de dados 

DESC film; 

INSERT INTO language 
	(name)
    VALUES('Portuguese'); 

INSERT INTO film
(film_id,title,description,release_year,language_id,original_language_id,rental_duration,rental_rate,length, replacement_cost,rating,last_update)
VALUES(film_id,'A REPUBLICA DAS BANANAS','bananas para os macacos', 2018,7,default,4,0.99,50,20.1,'PG',current_timestamp()); 


INSERT INTO inventory
(film_id, store_id)
VALUES
(1001,1),
(1001,1),
(1001,1),
(1001,1),
(1001,2); 


SELECT FI.film_id, FI.title, IV.inventory_id, ST.store_id
	FROM inventory AS IV
		INNER JOIN film AS FI
			ON IV.film_id=FI.film_id
				INNER JOIN store AS ST 
					ON ST.store_id=IV.store_id
	WHERE FI.film_id = 1001; 
    


