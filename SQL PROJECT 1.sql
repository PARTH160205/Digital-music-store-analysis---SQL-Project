--WHO IS THE SENIOR MOST EMPLOYEE BASED ON JOB TITLE?
/*
SELECT * FROM employee
ORDER BY levels DESC
LIMIT 1;*/

--WHICH COUNTRIES HAVE MOST INVOICES?
/*
SELECT COUNT(*) as c,
billing_country
FROM invoice
GROUP BY billing_country
ORDER BY c DESC;
*/

--top 3 values of total invoice?
/*
SELECT total FROM invoice
ORDER BY total DESC
LIMIT 3
*/

-- city with highest sum of invoice totals with city name
/*
SELECT SUM(total) as invoice_total ,billing_city FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC
*/

--best customer with highest invoice
/*
SELECT customer.customer_id,customer.first_name,customer.last_name,SUM(invoice.total) as total 
FROM customer
JOIN invoice on customer.customer_id=invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
LIMIT 1;
*/

--                 TO RETURN EMAIL,FIRST NAME,LAST NAME AND GENRE OF ALL ROCK MUSIC

/*
SELECT DISTINCT email, first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN (
    SELECT track_id
    FROM track
    JOIN genre ON track.genre_id = genre.genre_id
    WHERE genre.name LIKE 'ROCK'
)
ORDER BY email;
*/

-- ARTIST WHO HAVE WRITTEN MOST NO OF SONGS ,ARTIST NAME,TRACK COUNT OF TOP 10
/*
SELECT artist.artist_id,artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id= track.album_id
JOIN artist ON artist.artist_id=album.artist_id
JOIN genre ON genre.genre_id=track.genre_id
WHERE genre.name LIKE 'ROCK'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;
*/

--NAME AND MILLISECONDS FOR EACH TRACK,ORDER BY SONG LENGTH WITH LONGEST SONGS
SELECT name, milliseconds
FROM track
WHERE milliseconds > (
    SELECT AVG(milliseconds) AS avg_track_length
    FROM track
)
ORDER BY milliseconds DESC;

