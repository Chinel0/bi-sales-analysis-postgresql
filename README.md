bi-sales-analysis-postgresql/
│
├── 📄 README.md
├── 🗃️ BI_dump.sql                   # The dump file used to restore database
├── 📝 SQL_Queries/
│   ├── verify_data.sql
│   ├── join_sales_analysis.sql
│   ├── sales_by_time.sql
│   ├── hierarchy_rollup.sql
│   └── trends_by_region.sql
├── 📸 screenshots/
│   ├── pgadmin-tables.png
│   ├── restored-database.png
│   ├── query-results.png
├── SQL_Queries/
├── join_sales_analysis.sql
├── sales_by_time.sql
├── hierarchy_rollup.sql

BI Capstone Project – Sales Analysis using PostgreSQL

This project is part of the IBM BI Analyst Professional Certificate. It demonstrates the use of PostgreSQL for querying and analyzing sales data from a retail chain. 
The work includes database setup, SQL querying, and analysis using real-world business scenarios.

 📌 Project Objective

- Restore and explore a relational retail sales database
- Analyze sales trends across time, products, and regions
- Utilize SQL techniques like JOIN, GROUP BY, and ROLLUP to generate insights
- Practice writing optimized queries for BI reporting

 📁 Files Included

- `BI_dump.sql` – SQL dump file used to restore the BICapstone database
- `SQL_Queries/` – All key SQL scripts used for analysis
- `screenshots/` – Interface images of database, tables, and outputs


🔧 Tools Used

- PostgreSQL
- pgAdmin 4
- psql (Command Line)

🔍 Key Steps

 1. Database Setup
- Created database `BICapstone`
- Restored schema and data using `\i BI_dump.sql` in psql
- Verified tables: `sales`, `store_names`, `product_hierarchy`, etc.

 2. Data Verification
- Ran `SELECT * FROM table LIMIT 5;` to confirm data presence

 3. Sales Performance Query
- Joined sales with product hierarchy and store cities
- Aggregated total sales, revenue, and average price per product and store

```sql
SELECT 
  p.product_id,
  c.store_id,
  c.city_id,
  SUM(sl.sales) AS total_sales,
  SUM(sl.revenue) AS total_revenue,
  AVG(sl.price) AS average_price
FROM 
  sales sl
JOIN product_hierarchy p ON sl.product_id = p.product_id
JOIN store_cities c ON sl.store_id = c.store_id
GROUP BY p.product_id, c.store_id, c.city_id;
```

- Advanced SQL Analysis
Used GROUP BY (and attempted ROLLUP) to analyze trends:
Sales by month and store
Sales by product hierarchy levels
Regional trends by city and time

✅ Insights Gained
Identified top-performing products and cities
Confirmed sales peaks in end-of-year months
Uncovered data structure strengths (clear keys, clean joins)
Recognized that PostgreSQL is powerful for summarizing multidimensional data

 🙋‍♀️ About Me
I'm a Business Informatics student and aspiring BI Analyst, passionate about data storytelling, dashboards, and business insights.  
I recently completed the **IBM BI Analyst Professional Certificate**, where this project was developed.

📫 Connect with me on LinkedIn: www.linkedin.com/in/chinelo-nweke
