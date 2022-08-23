select t.au_id, au_lname, au_fname, title, pub_name
from titleauthor as t
left join authors as a
on t.au_id=a.au_id

left join titles as ti
on t.title_id=ti.title_id

left join publishers as p
on ti.pub_id=p.pub_id
;

select t.au_id, au_lname, au_fname, count(title) as title_count, pub_name
from titleauthor as t
left join authors as a
on t.au_id=a.au_id

left join titles as ti
on t.title_id=ti.title_id

left join publishers as p
on ti.pub_id=p.pub_id

group by au_id, pub_name
order by title_count desc
;

select a.au_id, au_lname, au_fname, sum(qty) as total_ventas
from titleauthor as t
left join authors as a
on t.au_id=a.au_id

left join titles as ti
on t.title_id=ti.title_id

left join sales as s
on ti.title_id=s.title_id

group by au_id 
order by total_ventas desc
limit 3
;

select a.au_id, au_lname, au_fname, ifnull(sum(qty), 0) as total_ventas
from authors as a
left join titleauthor as t
on a.au_id=t.au_id

left join titles as ti
on t.title_id=ti.title_id

left join sales as s
on ti.title_id=s.title_id

group by au_id 
order by total_ventas desc

;
