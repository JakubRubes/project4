WITH price_growth AS (
    SELECT
        cur.year,
        AVG(
            (cur.avg_price - prev.avg_price) / prev.avg_price * 100
        ) AS price_growth_pct
    FROM (
        SELECT food_category, year, AVG(avg_price) AS avg_price
        FROM t_jakub_rubes_project_SQL_primary_final
        GROUP BY food_category, year
    ) cur
    JOIN (
        SELECT food_category, year, AVG(avg_price) AS avg_price
        FROM t_jakub_rubes_project_SQL_primary_final
        GROUP BY food_category, year
    ) prev
        ON cur.food_category = prev.food_category
       AND cur.year = prev.year + 1
    GROUP BY cur.year
),
wage_growth AS (
    SELECT
        cur.year,
        AVG(
            (cur.avg_wage - prev.avg_wage) / prev.avg_wage * 100
        ) AS wage_growth_pct
    FROM (
        SELECT industry, year, AVG(avg_wage) AS avg_wage
        FROM t_jakub_rubes_project_SQL_primary_final
        GROUP BY industry, year
    ) cur
    JOIN (
        SELECT industry, year, AVG(avg_wage) AS avg_wage
        FROM t_jakub_rubes_project_SQL_primary_final
        GROUP BY industry, year
    ) prev
        ON cur.industry = prev.industry
       AND cur.year = prev.year + 1
    GROUP BY cur.year
)
SELECT
    p.year,
    ROUND(p.price_growth_pct::numeric, 2) AS price_growth_pct,
    ROUND(w.wage_growth_pct::numeric, 2) AS wage_growth_pct,
    ROUND((p.price_growth_pct - w.wage_growth_pct)::numeric, 2) AS growth_difference_pct
FROM price_growth p
JOIN wage_growth w
    ON p.year = w.year
ORDER BY p.year;











