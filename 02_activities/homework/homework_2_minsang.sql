--SELECT question 1
SELECT *
From customer;

--SELECT question 2
SELECT *
FROM customer
ORDER BY customer_last_name, customer_first_name
LIMIT 10;

--WHERE question 1
SELECT * 
FROM customer_purchases
WHERE product_id IN (4, 9);

--WHERE question 2
SELECT *, (quantity * cost_to_customer_per_qty) AS price
FROM customer_purchases
WHERE vendor_id BETWEEN 8 AND 10;

--CASE question 1
SELECT product_id, product_name,
	CASE 
		WHEN product_qty_type = 'unit' THEN 'unit'
		ELSE 'bulk'
	END AS product_qty_type_condensed
FROM product;

--CASE question 2
SELECT product_id, product_name,
	CASE 
		WHEN product_qty_type = 'unit' THEN 'unit'
		ELSE 'bulk'
	END AS product_qty_type_condensed,
	CASE
		WHEN lower(product_name) LIKE '%pepper%' THEN 1
		ELSE 0
	END AS pepper_flag
From product;

--JOIN question 1
SELECT v.vendor_id, v.vendor_name, vba.market_date, vba.booth_number
FROM 
    vendor v
INNER JOIN 
    vendor_booth_assignments vba
    ON v.vendor_id = vba.vendor_id
ORDER BY 
    v.vendor_name, 
    vba.market_date;

