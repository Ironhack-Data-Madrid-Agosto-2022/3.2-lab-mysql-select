
SELECT authors.au_id, au_fname, au_lname, title, pub_name
FROM titleauthor
left join authors
on titleauthor.au_id =authors.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join publishers
on titles.pub_id = publishers.pub_id ;



SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, count(t.title_id) as title_count
FROM titleauthor as ta
left join authors as a 
on ta.au_id =a.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p 
on t.pub_id = p.pub_id 
group by p.pub_id, a.au_id;


SELECT a.au_id, a.au_lname, a.au_fname, sum(s.qty) as cantidad
FROM titleauthor as ta
left join authors as a 
on ta.au_id =a.au_id
left join titles as t
on ta.title_id = t.title_id
left join sales as s
on t.title_id = s.title_id
group by a.au_id
order by cantidad desc
limit 3;




SELECT a.au_id, a.au_lname, a.au_fname, sum(s.qty) as cantidad
FROM titleauthor as ta
left join authors as a 
on ta.au_id =a.au_id
left join titles as t
on ta.title_id = t.title_id
left join sales as s
on t.title_id = s.title_id
group by a.au_id;



















