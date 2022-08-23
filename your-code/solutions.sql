select authors.au_id as AUTHORS_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, title as TITLE, pub_name as PUBLISHER
from titles

left join publishers
on titles.pub_id = publishers.pub_id

left join titleauthor
on titles.title_id = titleauthor.title_id

inner join authors
on titleauthor.au_id = authors.au_id;

#2

select authors.au_id as AUTHORS_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, title as TITLE, pub_name as PUBLISHER, count(titles.title) as TITLES
from titles

left join publishers
on titles.pub_id = publishers.pub_id

left join titleauthor
on titles.title_id = titleauthor.title_id

inner join authors
on titleauthor.au_id = authors.au_id

group by authors.au_id, publishers.pub_name;

#3

select authors.au_id as AUTHORS_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, sum(qty) as QUANTITY
from titles

left join publishers
on titles.pub_id = publishers.pub_id

left join titleauthor
on titles.title_id = titleauthor.title_id

inner join authors
on titleauthor.au_id = authors.au_id

left join sales
on titles.title_id = sales.title_id

group by authors.au_id

order by QUANTITY DESC;

#4

select authors.au_id as AUTHORS_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, ifnull(sum((qty)),0) as TOTAL
from authors

left join titleauthor
on authors.au_id = titleauthor.au_id

left join sales
on titleauthor.title_id = sales.title_id

group by authors.au_id;