

select a.au_id as ID_Autor, concat(a.au_fname," ",a.au_lname) as 'Nombre Autor', ifnull(sum(s.qty),0) as Total_ventas
from authors as a

left join titleauthor as ta
on a.au_id=ta.au_id

left join titles as t
on ta.title_id = t.title_id

left join sales as s
on t.title_id = s.title_id

group by a.au_id
order by Total_ventas  desc






