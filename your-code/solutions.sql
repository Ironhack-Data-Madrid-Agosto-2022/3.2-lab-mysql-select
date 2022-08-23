
-- Challenge 1 - Who Have Published What At Where?


select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name 
from titleauthor as ta
left join authors as a
on ta.au_id = a.au_id
left join titles as t
on ta.title_id = t.title_id 
left join publishers as p
on t.pub_id = p.pub_id;


-- Challenge 2 - Who Have Published How Many At Where?


select a.au_id, a.au_lname, a.au_fname, p.pub_name, count(t.title_id) as titlecount
from titleauthor as ta
left join authors as a
on ta.au_id = a.au_id
left join titles as t
on ta.title_id = t.title_id 
left join publishers as p
on t.pub_id = p.pub_id
group by a.au_id, p.pub_id
order by titlecount desc;


-- Challenge 3 - Best Selling Authors


select a.au_id, a.au_lname, a.au_fname, sum(sa.qty) as cantidad
from titleauthor as ta
left join authors as a
on ta.au_id=a.au_id
left join titles as t
on ta.title_id = t.title_id
left join sales as sa
on t.title_id = sa.title_id
group by a.au_id
order by cantidad desc
limit 3


-- Challenge 4 - Best Selling Authors Ranking


select a.au_id, a.au_lname, a.au_fname, ifnull(sum(sa.qty),0) as cantidad
from authors as a
left join titleauthor as ta
on ta.au_id=a.au_id
left join titles as t
on ta.title_id = t.title_id
left join sales as sa
on t.title_id = sa.title_id
group by a.au_id
order by cantidad desc


