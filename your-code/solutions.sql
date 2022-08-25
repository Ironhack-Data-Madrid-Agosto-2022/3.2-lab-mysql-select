select a.au_id, a.au_lname, a.au_fname,t.title,p.pub_name
from titleauthor as ta
left join authors as a
on ta.au_id=a.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id;



select a.au_id, a.au_lname, a.au_fname,p.pub_name,count(t.title_id) as numtitles
from titleauthor as ta
left join authors as a
on ta.au_id=a.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id
group by a.au_id, p.pub_id
order by numtitles desc


select a.au_id, a.au_lname, a.au_fname,t.title,t.title_id,sum(s.qty) as suma
from titleauthor as ta
left join authors as a
on ta.au_id=a.au_id
left join titles as t
on ta.title_id = t.title_id
left join sales as s
on t.title_id = s.title_id
group by a.au_id
order by suma desc
limit 3


select a.au_id, a.au_lname, a.au_fname,t.title,t.title_id,sum(s.qty) as suma
from authors as a
left join titleauthor as ta
on ta.au_id=a.au_id
left join titles as t
on ta.title_id = t.title_id
left join sales as s
on t.title_id = s.title_id
group by a.au_id
order by suma desc


select a.au_id, a.au_lname, a.au_fname,ifnull(sum(s.qty),0) as suma
from authors as a
left join titleauthor as ta
on ta.au_id=a.au_id
left join titles as t
on ta.title_id = t.title_id
left join sales as s
on t.title_id = s.title_id
group by a.au_id
order by suma desc


