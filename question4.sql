WITH wage_by_year AS (
    SELECT
        year,
        AVG(avg_wage) AS avg_wage
    FROM t_jakub_rubes_project_SQL_primary_final
    GROUP BY year
),
price_by_year AS (
    SELECT
        year,
        AVG(avg_price) AS avg_price
    FROM t_jakub_rubes_project_SQL_primary_final
    GROUP BY year
),
wage_growth AS (
    SELECT
        year,
        avg_wage,
        (avg_wage - LAG(avg_wage) OVER (ORDER BY year))
            / LAG(avg_wage) OVER (ORDER BY year) * 100 AS wage_growth_pct
    FROM wage_by_year
),
price_growth AS (
    SELECT
        year,
        avg_price,
        (avg_price - LAG(avg_price) OVER (ORDER BY year))
            / LAG(avg_price) OVER (ORDER BY year) * 100 AS price_growth_pct
    FROM price_by_year
)
SELECT
    w.year,
    ROUND(w.wage_growth_pct::numeric, 2) AS wage_growth_pct,
    ROUND(p.price_growth_pct::numeric, 2) AS price_growth_pct,
    ROUND((p.price_growth_pct - w.wage_growth_pct)::numeric, 2) AS difference_pct
FROM wage_growth w
JOIN price_growth p
    ON w.year = p.year
WHERE w.wage_growth_pct IS NOT NULL
  AND p.price_growth_pct IS NOT NULL
ORDER BY w.year;






























