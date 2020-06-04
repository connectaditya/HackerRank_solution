SELECT N,
       IF(P IS NULL, 'Root', 
           IF((SELECT COUNT(*) 
       FROM BST 
            WHERE P=B.N)>0, 'Inner', 'Leaf'))
       FROM BST AS B 
            ORDER BY N;
           
           
           
 /*
# Explain

We can use IF() function to solve this problem. First, the query returns N and node type from BST
table and outputs result ordered by N. So the query looks like “SELECT N, IF() FROM BST ORDER BY N”.

Next, check whether the node is root. If P is null, then the node will be root. 

The query can be “SELECT N, IF(P IS NULL, ‘Root’, IF()) FROM BST ORDER BY N”.

Finally, check whether the node is leaf. If the node value appears in Column P, 

it will be ‘Inner’, otherwise ‘Leaf’. The query can be “SELECT N, 
IF(P IS NULL, ‘Root’, IF(B.N IN (SELECT P FROM BST), ‘Inner’, ‘Leaf’)) 
FROM BST AS B ORDER BY N”. Additionally, 
if the node value appears in Column P, then the number of p value that equals to the node value will be greater than 0.

So the query can be “SELECT N, IF(P IS NULL, ‘Root’, IF((SELECT COUNT(*) FROM BST WHERE P=B.N))) FROM BST AS B ORDER BY N” as well.

*/
