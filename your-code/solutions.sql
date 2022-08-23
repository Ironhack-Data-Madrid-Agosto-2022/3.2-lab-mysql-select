#CHEALLENGE 1
(select a.au_id , a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', ts.title as 'TITLE',pub_name as 'PUBLISHER'
from authors as a

left join titleauthor as ta
on a.au_id = ta.au_id

left join titles as ts
on ta.title_id = ts.title_id

inner join publishers as pu
on ts.pub_id = pu.pub_id);

#CHALLENGE 2
(select a.au_id as 'AUTHOR ID' , a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', pub_name as 'PUBLISHER', count(ts.title_id) as 'TITLE COUNT'
from authors as a

left join titleauthor as ta
on a.au_id = ta.au_id

left join titles as ts
on ta.title_id = ts.title_id

inner join publishers as pu
on ts.pub_id = pu.pub_id

group by A.au_id, pub_name);

#CHALLENGE 3
(select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', sum(sa.qty ) as 'TOTAL'

from authors as a

left join titleauthor as ta
on a.au_id = ta.au_id


left join sales as sa
on ta.title_id = sa.title_id

group by a.au_id 
order by sum(sa.qty) desc 
limit 3);

#CHALLENGE 4
(select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', sum(case when sa.qty  is not null then sa.qty else 0 end) as 'TOTAL'

from authors as a

left join titleauthor as ta
on a.au_id = ta.au_id


left join sales as sa
on ta.title_id = sa.title_id

group by a.au_id 
order by sum(sa.qty) desc );
