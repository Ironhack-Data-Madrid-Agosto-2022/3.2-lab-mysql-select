-- Chalenge 1 - Who Have Published What At Where? --
select a.au_id as AUTHOR_ID,
       a.au_lname as LAST_NAME,
       a.au_fname as FIRST_NAME,
       t.title as TITLE,
       p.pub_name as PUBLISHER

from authors as a
left join titleauthor as ta on a.au_id = ta.au_id
left join titles as t on t.title_id = ta.title_id
left join publishers as p on t.pub_id = p.pub_id
;

-- Challenge 2 - Who Have Published How Many At Where? --

select ta.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, p.pub_name as PUBLISHER, count(title) as TITLE_COUNT
from authors as a
left join titleauthor as ta on a.au_id = ta.au_id
left join titles as t on t.title_id = ta.title_id
left join publishers as p on t.pub_id = p.pub_id
group by p.pub_id, a.au_id
;

-- Challenge 3 - Best Selling Authors --

select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, sum(s.qty) as TOTAL
from authors as a
join titleauthor as ta on a.au_id = ta.au_id
join titles as t on t.title_id = ta.title_id
join sales as s on t.title_id = s.title_id
group by a.au_id
limit 3
;

-- Challenge 4 - Best Selling Authors Ranking --
Select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME,
sum(case when s.qty is not null then s.qty else 0 end) as TOTAL

from authors as a
left join titleauthor as ta on a.au_id = ta.au_id
left join titles as t on t.title_id = ta.title_id
left join sales as s on t.title_id = s.title_id
group by a.au_id
order by TOTAL desc