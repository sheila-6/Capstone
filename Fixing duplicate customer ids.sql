-- check if there are duplicatae customer ids
SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- remove duplicates ctid is a PostgreSQL internal column that helps identify rows uniquely.
DELETE FROM customers
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM customers
    GROUP BY customer_id
);

-- After cleanup, verify again:there shoulfd be a match
SELECT COUNT(*), COUNT(DISTINCT customer_id)
FROM customers;

