Caso 1: 

select a.au_id, a.au_lname, a.au_fname, ti.title, pub.pub_name
from titleauthor as t
left join authors as a
on t.au_id=a.au_id
left join titles as ti
on t.title_id = ti.title_id
left join publishers as pub
on ti.pub_id = pub.pub_id;

Caso 2:

select a.au_id, a.au_lname, a.au_fname, pub.pub_name, count(t.title_id) as title_count
from titleauthor as t
left join authors as a
on t.au_id=a.au_id
left join titles as ti
on t.title_id = ti.title_id;

Caso 3:

left join authors as a
on t.au_id=a.au_id
left join titles as ti
on t.title_id = ti.title_id
left join sales as s
on t.title_id=s.title_id
group by a.au_id
order by total desc
limit 3;

caso 4:

select a.au_id, a.au_lname, a.au_fname, sum(s.qty) as total
from titleauthor as t
left join authors as a
on t.au_id=a.au_id
left join titles as ti
on t.title_id = ti.title_id
left join sales as s
on t.title_id=s.title_id
group by a.au_id;
