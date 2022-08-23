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
