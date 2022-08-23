-- Solution1

select a.au_id, t.title, a.au_fname, a.au_lname, pb.pub_name
from titleauthor as ta

left join authors as a
on ta.au_id=a.au_id

left join titles as t
on t.title_id=ta.title_id

left join publishers as pb
on pb.pub_id=t.pub_id
;

-- Solution2

select a.au_id, a.au_fname, a.au_lname, pb.pub_name,  count(t.title_id) as libs_autor

from titleauthor as ta

left join authors as a
on ta.au_id=a.au_id

left join titles as t
on t.title_id=ta.title_id

left join publishers as pb
on pb.pub_id=t.pub_id

group by a.au_id, pb.pub_id

;

-- solution3
select a.au_id, a.au_fname, a.au_lname, s.qty, s.title_id, sum(s.qty) as ventas
from titleauthor as ta

left join authors as a
on ta.au_id=a.au_id

left join titles as t
on t.title_id=ta.title_id

left join sales as s
on t.title_id=s.title_id

group by a.au_id 

order by ventas desc

limit 3
;

-- solution 4

select a.au_id, a.au_fname, a.au_lname,  COALESCE(sum(s.qty), 0)  as ventas

from authors as a

left join titleauthor as ta
on ta.au_id=a.au_id

left join titles as t
on t.title_id=ta.title_id

left join sales as s
on t.title_id=s.title_id

group by a.au_id 

order by ventas desc
;