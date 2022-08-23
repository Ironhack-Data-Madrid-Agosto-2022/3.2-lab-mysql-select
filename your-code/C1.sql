select au.au_id as Autor_ID , t.title , pub_name as Publisher, concat(au.au_fname, ' ', au.au_lname) as completename
from titles as t

left join titleauthor as a
on t.title_id=a.title_id

left join authors as au
on a.au_id=au.au_id

left join publishers as pb
on t.pub_id=pb.pub_id


;



