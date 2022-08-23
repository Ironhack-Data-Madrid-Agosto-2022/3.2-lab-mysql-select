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
