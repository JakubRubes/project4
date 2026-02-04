WITH price_growth AS (
    SELECT
        food_category,
        year,
        avg_price,
        LAG(avg_price) OVER (
            PARTITION BY food_category
            ORDER BY year
        ) AS prev_price
    FROM t_jakub_rubes_project_SQL_primary_final
),
yearly_growth AS (
    SELECT
        food_category,
        (avg_price - prev_price) / prev_price * 100 AS yoy_growth_pct
    FROM price_growth
    WHERE prev_price IS NOT NULL
)
SELECT
    food_category,
    ROUND(AVG(yoy_growth_pct)::numeric, 2) AS avg_price_growth_pct
FROM yearly_growth
GROUP BY food_category
ORDER BY avg_price_growth_pct;



























