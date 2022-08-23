select a.au_id as ID_Autor, concat(a.au_fname," ",a.au_lname) as 'Nombre Autor', p.pub_name as Name_Editorial, count(t.title) as Num_Titulos
from titleauthor as ta
left join authors as a
on ta.au_id=a.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id
group by a.au_id, pub_name
order by Num_Titulos desc

