WITH gdp_by_year AS (
    SELECT
        year,
        gdp
    FROM t_jakub_rubes_project_SQL_secondary_final_v2
),
gdp_growth AS (
    SELECT
        year,
        (gdp - LAG(gdp) OVER (ORDER BY year))
            / LAG(gdp) OVER (ORDER BY year) * 100 AS gdp_growth_pct
    FROM gdp_by_year
),
wage_by_year AS (
    SELECT
        year,
        AVG(avg_wage) AS avg_wage
    FROM t_jakub_rubes_project_SQL_primary_final
    GROUP BY year
),
wage_growth AS (
    SELECT
        year,
        (avg_wage - LAG(avg_wage) OVER (ORDER BY year))
            / LAG(avg_wage) OVER (ORDER BY year) * 100 AS wage_growth_pct
    FROM wage_by_year
),
price_by_year AS (
    SELECT
        year,
        AVG(avg_price) AS avg_price
    FROM t_jakub_rubes_project_SQL_primary_final
    GROUP BY year
),
price_growth AS (
    SELECT
        year,
        (avg_price - LAG(avg_price) OVER (ORDER BY year))
            / LAG(avg_price) OVER (ORDER BY year) * 100 AS price_growth_pct
    FROM price_by_year
)
SELECT
    g.year,
    ROUND(g.gdp_growth_pct::numeric, 2)   AS gdp_growth_pct,
    ROUND(w.wage_growth_pct::numeric, 2)  AS wage_growth_pct,
    ROUND(p.price_growth_pct::numeric, 2) AS price_growth_pct
FROM gdp_growth g
JOIN wage_growth w
    ON g.year = w.year
JOIN price_growth p
    ON g.year = p.year
WHERE g.gdp_growth_pct IS NOT NULL
  AND w.wage_growth_pct IS NOT NULL
  AND p.price_growth_pct IS NOT NULL
ORDER BY g.year;
