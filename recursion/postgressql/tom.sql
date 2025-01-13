CREATE TABLE node (
    node_id INTEGER PRIMARY KEY,
    node_name VARCHAR NOT NULL
);

CREATE TABLE edge (
    node1 INTEGER REFERENCES node (node_id),
    node2 INTEGER REFERENCES node (node_id),
    PRIMARY KEY (node1, node2)
);

--Insert test data into each of the tables. Create a few nodes (representing people):

INSERT INTO node (node_id, node_name) 
VALUES (1, 'Tom'), (2, 'Dick'), (3, 'Harry'), (4, 'Jane'), 
    (5, 'Susan'), (6, 'Mary'), (7, 'Sam'), (8, 'Sally'), (9, 'Jack') ;

--Create edges to define hypothetical relationships between the nodes:

INSERT INTO edge (node1, node2) 
VALUES (1, 2), (1, 8), (2, 3), (2, 4), (4, 5), (4, 6), (4, 7), (8, 9) ;


CREATE VIEW nodes_n_edges AS
    WITH cte1 AS (
        SELECT n.node_id, n.node_name, e.node2
        FROM node n
        JOIN edge e 
        ON n.node_id = e.node1
    )
    SELECT 
        cte1.node_id AS node1_id, 
        cte1.node_name AS node1_name, 
        node.node_name AS node2_name,
        node.node_id AS node2_id
    FROM cte1 
    JOIN node 
    ON cte1.node2 = node.node_id;

--This view is used in later sections to conveniently query the data structure after making changes. --Using a view like this is more efficient than repeatedly joining the nodes and edges tables.

SELECT * FROM nodes_n_edges;

WITH recursive rcte as (
     SELECT node1_id, node1_name, node2_name, node2_id
     FROM nodes_n_edges
     WHERE node1_name = 'Dick'

     UNION 

     SELECT ne.node1_id, ne.node1_name, ne.node2_name, ne.node2_id
     FROM rcte
     JOIN nodes_n_edges ne
     ON rcte.node2_id = ne.node1_id
 )
 SELECT node1_name, node2_name 
 FROM rcte ;


WITH RECURSIVE rcte AS (
    SELECT node1_id, node1_name, node2_name, node2_id,
    -- initialize the array
    ARRAY [node1_name, (select('-')), node2_name] AS traversal_path
    FROM nodes_n_edges
    WHERE node1_name = 'Dick'

    UNION 

    SELECT ne.node1_id, ne.node1_name, ne.node2_name, ne.node2_id,
    -- append the path to the array
    rcte.traversal_path||(select(' ; '))||ne.node1_name||(select('-'))||ne.node2_name
    FROM rcte
    JOIN nodes_n_edges ne
    ON rcte.node2_id = ne.node1_id
)
SELECT node1_name, node2_name,
    -- select and prettify the text of the path
    REPLACE(REPLACE(traversal_path::text, '"', ''), ',','') AS traversal_path
FROM rcte ;


-- https://docs.vultr.com/how-to-use-recursive-queries-in-postgresql
