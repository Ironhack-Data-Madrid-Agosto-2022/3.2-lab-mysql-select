select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
from titles as t

left join titleauthor as ta
on t.title_id = ta.title_id

left join authors as a
on   ta.au_id = a.au_id

left join publishers as p
on   t.pub_id = p.pub_id

