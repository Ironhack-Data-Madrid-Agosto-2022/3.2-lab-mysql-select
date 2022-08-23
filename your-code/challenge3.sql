select sum(sa.qty) as Total, a.au_id as 'Author ID', a.au_lname as 'Lname', a.au_fname as 'Fname'
from titleauthor as ta

left join titles as t
on ta.title_id = t.title_id

left join authors as a
on   ta.au_id = a.au_id

left join sales as sa
on t.title_id = sa.title_id

group by a.au_id
order by TOTAL desc

limit 3

