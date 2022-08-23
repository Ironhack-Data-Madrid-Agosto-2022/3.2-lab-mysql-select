select a.au_id as 'Author ID', a.au_lname as 'Lname', a.au_fname as 'Fname', p.pub_name as 'Editorial', count(t.title)as 'Summa'
from titleauthor as ta

left join titles as t
on ta.title_id = t.title_id

left join authors as a
on   ta.au_id = a.au_id

left join publishers as p
on   t.pub_id = p.pub_id

group by a.au_id, p.pub_name


