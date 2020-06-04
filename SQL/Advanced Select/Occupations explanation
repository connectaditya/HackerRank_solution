<pre>
SELECT 
MIN(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END) AS Doctor,
MIN(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END) AS Professor,
MIN(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END) AS Singer,
MIN(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END) AS Actor
FROM (
  SELECT a.Occupation,
         a.Name,
         (SELECT COUNT(*) 
            FROM Occupations AS b
            WHERE a.Occupation = b.Occupation AND a.Name > b.Name) AS rank
  FROM Occupations AS a
) AS c
GROUP BY c.rank;
</pre>

<p>For reference here is the table that I had to test with:</p>
<pre>
+-------------------------+
| Occupations | Table     |
+-------------------------+
| Ashley      | Professor | 
| Samantha    | Actor     |
| Julia       | Doctor    |
| Britney     | Professor |
| Maria       | Professor |
| Meera       | Professor |
| Priya       | Doctor    |
| Priyanka    | Professor |
| Jennifer    | Actor     |
| Ketty       | Actor     |
| Belvet      | Professor |
| Naomi       | Professor |
| Jane        | Singer    |
| Jenny       | Singer    |
| Kristeen    | Singer    |
| Christeen   | Singer    |
| Eve         | Actor     |
| Aamina      | Doctor    |
+-------------------------+ </pre>
 
<p>the mins will select the name until there are no non-NULL names then print NULL for 
each row until all names are selected</p> 
<p>the table built for the mins in the first FROM is the format | occupation | name | rank |</p>

<p>rank is built by counting each name lesser in value than the current with a matching 
profession</p>
<p>example:</p>
<pre>     
+----------------------+
| Occupation | Name    |
+----------------------+
| Doctor     | Amy     |
| Actor      | Mark    |
| Doctor     | Jamal   |
| Doctor     | Allison |
| Actor      | Susan   |
+----------------------+ </pre>
<p> The doctors are Allison, Amy, and Jamal</p>
<p> There are 3 available ranks: 0, 1, and 2</p>
<p> Allison has 0 Names before her in alphabetical order, so rank is 0</p>
<p> Amy is 1, since Allison comes before Amy</p> 
<p> Jamal is 2, since both Allison and Amy come before Jamal in alphabetical order</p>
<p> The actors will be Mark: 0, Susan: 1 for the same reasons outlined with the doctors</p>

<p>The GROUP BY is what formats the output</p> 
<p>If you Group By Name, you will get a row for each name with the name in its 
occupational column in descending alphabetical order</p>
<pre>
Group By Name
+-------------------------------------------+
| doctor | professor | singer    | actor    |
+-------------------------------------------+
| Aamina | NULL      |NULL       | NULL     | 
| NULL   | Ashley    | NULL      | NULL     | 
| NULL   | Belvet    | NULL      | NULL     |
| NULL   | Britney   | NULL      | NULL     |
| NULL   | NULL      | Christeen | NULL     |
| NULL   | NULL      | NULL      | Eve      |
| NULL   | NULL      | Jane      | NULL     |
| NULL   | NULL      | NULL      | Jennifer |
| NULL   | NULL      | Jenny     | NULL     |
| Julia  | NULL      | NULL      | NULL     |
| NULL   | NULL      | NULL      | Ketty    |
| NULL   | NULL      | Kristeen  | NULL     |
| NULL   | Maria     | NULL      | NULL     |
| NULL   | Meera     | NULL      | NULL     | 
| NULL   | Naomi     | NULL      | NULL     |
| Priya  | NULL      | NULL      | NULL     |
| NULL   | Priyanka  | NULL      | NULL     |
| NULL   | NULL      | NULL      | Samantha |
+-------------------------------------------+ </pre>
<p>If you group by Occupation, you will get a row (in descending alphabetical order by
occupation) for each occupation's first name alphabetically</p> It will print Name in order:
Actor, Doctor, Professor, Singer</p>
<pre>
Group By Occupation
+-------------------------------------------+
| doctor | professor | singer    | actor    |
+-------------------------------------------+
| NULL   | NULL      | NULL      | Eve      | 
| Aamina | NULL      | NULL      | NULL     |
| NULL   | Ashley    | NULL      | NULL     |
| NULL   | NULL      | Christeen | NULL     |
+-------------------------------------------+</pre>
<p>Grouping by Rank, means that for each row you get the names in that occupation with the
Same Rank</p>
<pre>
Group By Rank
+-------------------------------------------+
| doctor | professor | singer    | actor    |
+-------------------------------------------+
| Aamina | Ashley    | Christeen | Eve      | 
| Julia  | Belvet    | Jane      | Jennifer |
| Priya  | Britney   | Jenny     | Ketty    |
| NULL   | Maria     | Kristeen  | Samantha |
| NULL   | Meera     | NULL      | NULL     |
| NULL   | Naomi     | NULL      | NULL     |
| NULL   | Priyanka  | NULL      | NULL     |
+-------------------------------------------+</pre>
