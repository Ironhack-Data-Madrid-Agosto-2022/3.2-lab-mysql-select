-- CHALLENGE 1:

select authors.au_id as 'AUTOR_ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', title as 'TITLE', pub_name as PUBLISHER
from authors
left join titleauthor
on authors.au_id= titleauthor.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join publishers
on titles.pub_id= publishers.pub_id;

-- CHALLENGE 2:
select authors.au_id as 'AUTOR_ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', pub_name as 'PUBLISHER', count(title) as 'TITLE COUNT'
from authors
left join titleauthor
on authors.au_id= titleauthor.au_id
left join titles
on titleauthor.title_id=titles.title_id
inner join publishers
on titles.pub_id= publishers.pub_id
group by pub_name, authors.au_id
order by count(title) desc;

-- CHALLENGE 3:
select authors.au_id as 'Autor ID' , authors.au_lname as 'Last name' , authors.au_fname as 'First name', qty as 'Sales'
from authors
inner join titleauthor
on authors.au_id= titleauthor.au_id
inner join titles
on titleauthor.title_id=titles.title_id
left join sales
on titles.title_id=sales.title_id
order by qty desc
limit 3;





-- CHALLENGE 4:

select authors.au_id as 'Autor ID' , authors.au_lname as 'Last name' , authors.au_fname as 'First name', ifnull (qty,0) as 'Sales'
from authors
inner join titleauthor
on authors.au_id= titleauthor.au_id
inner join titles
on titleauthor.title_id=titles.title_id
left join sales
on titles.title_id=sales.title_id
order by qty desc;






