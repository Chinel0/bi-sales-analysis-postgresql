-- View sample data from each key table
SELECT * FROM city_names LIMIT 5;
SELECT * FROM product_hierarchy LIMIT 5;
SELECT * FROM product_names LIMIT 5;
SELECT * FROM sales LIMIT 5;
SELECT * FROM store_cities LIMIT 5;
SELECT * FROM store_names LIMIT 5;

-- Analyze total sales, revenue, and average price by product and store
SELECT 
  p.product_id,
  c.store_id,
  c.city_id,
  SUM(s.sales) AS total_sales,
  SUM(s.revenue) AS total_revenue,
  AVG(s.price) AS average_price
FROM 
  public.sales s
INNER JOIN public.product_hierarchy p ON s.product_id = p.product_id
INNER JOIN  public.store_cities c ON s.store_id = c.store_id
GROUP BY p.product_id, c.store_id, c.city_id;



SELECT 
  p.hierarchy1_id,
  p.hierarchy2_id,
  SUM(s.sales) AS total_sales
FROM 
  public.sales s
JOIN 
  public.product_hierarchy p ON s.product_id = p.product_id
GROUP BY 
  ROLLUP (p.hierarchy1_id, p.hierarchy2_id)
ORDER BY 
  p.hierarchy1_id, p.hierarchy2_id;

  SELECT 
  store_id,
  TO_CHAR(date, 'YYYY-MM') AS sale_month,
  SUM(sales) AS total_sales
FROM 
  sales
GROUP BY 
  ROLLUP (store_id, TO_CHAR(date, 'YYYY-MM'));

  SELECT 
  city_id,
  TO_CHAR(date, 'YYYY-MM') AS sale_month,
  SUM(sales) AS total_sales
FROM 
  sales s
JOIN 
  store_cities c 
ON
  s.store_id = c.store_id
  GROUP BY 
  ROLLUP (city_id, sale_month);


