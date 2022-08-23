-- Solution Challenge 1 --#
/*
* `AUTHOR ID` - the ID of the author
* `LAST NAME` - author last name
* `FIRST NAME` - author first name
* `TITLE` - name of the published title
* `PUBLISHER` - name of the publisher where the title was published
*/

select 
    
    authors.au_id, 
    authors.au_lname,
    authors.au_fname,
    titles.title,
    publishers.pub_name
    
from titleauthor

left join authors on authors.au_id = titleauthor.au_id
left join titles on titleauthor.title_id = titles.title_id
left join publishers on publishers.pub_id = titles.pub_id

-- Solution Challenge 2 --#

select 

    authors.au_id, 
    authors.au_lname,
    authors.au_fname,
    publishers.pub_name,
    COUNT(*)
    
from titleauthor 

left join authors on authors.au_id = titleauthor.au_id
left join titles on titleauthor.title_id = titles.title_id
left join publishers on publishers.pub_id = titles.pub_id

group by authors.au_id, publishers.pub_id

-- Solution Challenge 3 --#

select 
    authors.au_id, 
    authors.au_lname,
    authors.au_fname,
    sum(sales.qty) as TOTAL
from titleauthor

left join authors on authors.au_id = titleauthor.au_id
left join sales on sales.title_id=titleauthor.title_id -- Queremos Qty (cantidad) * numero de title_ID

group by au_id 
ORDER BY TOTAL DESC
LIMIT 3

-- Solution Challenge 4 --#

select 
    authors.au_id, 
    authors.au_lname,
    authors.au_fname,
    sum(IFNULL(sales.qty,0)) as TOTAL
from authors

left join titleauthor on authors.au_id = titleauthor.au_id
left join sales on sales.title_id=titleauthor.title_id -- Queremos Qty (cantidad) * numero de title_ID

group by authors.au_id 
ORDER BY TOTAL DESC