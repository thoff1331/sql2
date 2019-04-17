SELECT *
FROM invoice i
    JOIN invoice_line il ON  il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99

SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
    JOIN customer c ON i.customer_id = c.customer_id;


SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
    JOIN employee e ON c.support_rep_id = e.employee_id;


SELECT al.title, ar.name
FROM album al
    JOIN artist ar ON al.artist_id = ar.artist_id;


SELECT pt.track_id
FROM playlist_track pt
    JOIN playlist p ON p.playlist_id = pt.playlist_id
WHERE p.name = 'Music';

SELECT t.name
FROM track t
    JOIN playlist_track pt ON  pt.track_id = t.track_id
WHERE pt.playlist_id = 5;

SELECT t.name, p.name
FROM track t
    JOIN playlist_track pt ON  t.track_id = pt.track_id
    JOIN playlist p ON  pt.playlist_id = p.playlist_id;

SELECT t.name, a.title
FROM track t
    JOIN album a ON t.album_id = a.album_id
    JOIN genre g ON g.genre_id = t.gengre_id
WHERE g.name = 'Alternative & Punk';

SELECT *
FROM invoice
WHERE invoice_id IN (SELECT invoice_id
FROM invoice_line
WHERE unit_price > 0.99);

SELECT *
FROM playlist_track
WHERE playlist_id IN ( SELECT playlist_id
FROM playlist
WHERE name = 'Music');

SELECT name
FROM track
WHERE track_id IN ( SELECT track_id
FROM playlist_track
WHERE  playlist_id = 5);


SELECT *
FROM track
WHERE genre_id IN ( SELECT genre_id
FROM genre
WHERE name = 'Comedy');

SELECT *
FROM track
WHERE album_id IN ( SELECT album_id
FROM album
WHERE title = 'Fireball');


SELECT *
FROM track
WHERE album_id IN (
        SELECT album_id
FROM album
WHERE artist_id IN (
            SELect artist_id
FROM artist
WHERE name ='Queen'
        )
    );

UPDATE customer
    SET fax = NULL
    WHERE fax IS NOT NULL;

UPDATE  customer 
SET company = 'Self'
WHERE company IS NULL;

UPDATE customer 
SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name = 'Barnett';


UPDATE customer 
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';

UPDATE track
SET composer = 'the darkness around us'
WHERE genre_id = ( SELECT genre_id
    FROM genre
    WHERE name = 'Metal')
    AND composer IS NULL;

SELECT COUNT(*), g.name
FROM track
    JOIN genre g ON t.genre_id = g.genre_id
GROUP BY g.name;

SELECT COUNT(*), g.name
FROM track t
    JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'pop' OR g.name = 'Rock'
GROUP BY g.name;

SELECT ar.name, COUNT(*)

FROM album al
    JOIN artist ar ON ar.artist_id = al.artist_id
GROUP BY ar.name;

SELECT DISTINCT composer
FROM track;

SELECT DISTINCT billing_postal_code
FROM invoice;

SELECT DISTINCT company
FROM customer;


DELETE 
FROM practice_delete
WHERE type = 'bronze';

DELETE
FROM practice_delete
WHERE type = 'silver';

DELETE
FROM practice_delete
WHERE value = 150;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name VARCHAR (50),
    email VARCHAR(355)
);

INSERT INTO users
    (email, name)
VALUES
    ('Tom@gmail.com', 'Tom'),
    ('kev@gmail.com', 'Kev'),
    ('Steve@gmail.com', 'steve');


CREATE TABLE products
(
    id SERIAL PRIMARY KEY,
    name VARCHAR (50),
    price INTEGER
);

INSERT INTO products
    (price, name)
VALUES
    (17, 'hat'),
    ( 21 , 'shirt'),
    ( 13, 'beanie');



CREATE TABLE orders
(
    id SERIAL PRIMARY KEY,
    name VARCHAR (50),
    price VARCHAR(50),
    FOREIGN KEY (id) REFERENCES products(id)
);


INSERT INTO orders
    ( id, price, name, total)
VALUES
    (1, 17, 'hat', 17),
    (2 , 21 , 'shirt', 21),
    (2, 13, 'beanie', 13);

SELECT *
FROM orders;

SELECT *
FROM products
WHERE id = 1;

SELECT *
FROM orders
WHERE users.id = 1;

SELECT SUM(total)
FROM orders
WHERE users.id = 2


SELECT COUNT(*)
FROM ORDERS
where users.id = 3;














