WITH prices_by_year AS (
    SELECT
        food_category,
        year,
        AVG(avg_price) AS avg_price
    FROM t_jakub_rubes_project_SQL_primary_final
    GROUP BY food_category, year
),
yearly_growth AS (
    SELECT
        cur.food_category,
        cur.year,
        (cur.avg_price - prev.avg_price) / prev.avg_price * 100 AS yoy_growth
    FROM prices_by_year cur
    JOIN prices_by_year prev
        ON cur.food_category = prev.food_category
       AND cur.year = prev.year + 1
)
SELECT
    food_category,
    ROUND(AVG(yoy_growth)::numeric, 2) AS avg_yearly_growth_pct
FROM yearly_growth
GROUP BY food_category
ORDER BY avg_yearly_growth_pct;










