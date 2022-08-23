----------------------------------------------
#CHALLENGE 1
----------------------------------------------

SELECT 
	authors.au_id as AUTHOR_ID, 
	au_lname as LAST_NAME , 
	au_fname as FIRST_NAME, 
    titles.title as TITLE,
    publishers.pub_name as PUBLISHER
    
FROM authors

inner join titleauthor
on authors.au_id=titleauthor.au_id

left join titles
on titleauthor.title_id=titles.title_id

left join publishers
on titles.pub_id=publishers.pub_id;

----------------------------------------------
#CHALLENGE 2
----------------------------------------------

SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, count(AUTHOR_ID) as TITLE_COUNT from
(SELECT 
	authors.au_id as AUTHOR_ID, 
	au_lname as LAST_NAME , 
	au_fname as FIRST_NAME, 
    titles.title as TITLE,
    publishers.pub_name as PUBLISHER
    
FROM authors

inner join titleauthor
on authors.au_id=titleauthor.au_id

left join titles
on titleauthor.title_id=titles.title_id

left join publishers
on titles.pub_id=publishers.pub_id) AS tabla

group by tabla.AUTHOR_ID, tabla.PUBLISHER
;

----------------------------------------------
#CHALLENGE 3
----------------------------------------------

SELECT
	authors.au_id as AUTHOR_ID,
    authors.au_lname as LAST_NAME,
    authors.au_fname as FIRST_NAME,
    sum(sales.qty) as TOTAL
	
from sales


left join titles
on sales.title_id=titles.title_id

left join titleauthor
on titles.title_id=titleauthor.title_id

left join authors
on titleauthor.au_id=authors.au_id

group by authors.au_id
order by TOTAL desc
LIMIT 3;

----------------------------------------------
#CHALLENGE 4
----------------------------------------------

SELECT 
	authors.au_id as AUTHOR_ID, 
	authors.au_lname as LAST_NAME , 
	authors.au_fname as FIRST_NAME , 
    ifnull(sum(sales.qty),0) as TOTAL
    
FROM authors

left join titleauthor
on authors.au_id=titleauthor.au_id

left join sales
on titleauthor.title_id=sales.title_id

group by authors.au_id
order by TOTAL desc
LIMIT 23;