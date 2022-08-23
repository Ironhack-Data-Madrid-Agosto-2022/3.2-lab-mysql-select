select t.au_id, au_lname, au_fname, title, pub_name
from titleauthor as t
left join authors as a
on t.au_id=a.au_id

left join titles as ti
on t.title_id=ti.title_id

left join publishers as p
on ti.pub_id=p.pub_id
;
