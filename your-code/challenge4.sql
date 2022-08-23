select sum(sa.qty) as Total, a.au_id as 'Author ID', a.au_lname as 'Lname', a.au_fname as 'Fname'
from authors as a

left join titleauthor as ta
on a.au_id = ta.au_id

left join titles as t
on ta.title_id = t.title_id

left join sales as sa
on t.title_id = sa.title_id

group by a.au_id
order by TOTAL desc

