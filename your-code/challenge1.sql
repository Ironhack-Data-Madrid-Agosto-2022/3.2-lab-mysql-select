select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
from titleauthor as ta

left join titles as t
on ta.title_id = t.title_id

left join authors as a
on   ta.au_id = a.au_id

left join publishers as p
on   t.pub_id = p.pub_id
