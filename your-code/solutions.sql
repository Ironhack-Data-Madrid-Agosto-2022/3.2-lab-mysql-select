select au.au_id as Autor_ID , t.title , pub_name as Publisher, concat(au.au_fname, ' ', au.au_lname) as completename
from titles as t

left join titleauthor as a
on t.title_id=a.title_id

left join authors as au
on a.au_id=au.au_id

left join publishers as pb
on t.pub_id=pb.pub_id;

select a.au_id as ID_Autor, concat(a.au_fname," ",a.au_lname) as 'Nombre Autor', p.pub_name as Name_Editorial, count(t.title) as Num_Titulos
from titleauthor as ta

left join authors as a
on ta.au_id=a.au_id

left join titles as t
on ta.title_id = t.title_id

left join publishers as p
on t.pub_id = p.pub_id

group by a.au_id, pub_name
order by Num_Titulos desc;

select a.au_id as ID_Autor, concat(a.au_fname," ",a.au_lname) as 'Nombre Autor', sum(s.qty) as Total_ventas
from authors as a

left join titleauthor as ta
on a.au_id=ta.au_id

left join titles as t
on ta.title_id = t.title_id

left join sales as s
on t.title_id = s.title_id

group by a.au_id
order by Total_ventas  desc
limit 3;

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
