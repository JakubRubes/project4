WITH wages AS (
    SELECT
        year,
        AVG(avg_wage) AS avg_wage
    FROM t_jakub_rubes_project_SQL_primary_final
    GROUP BY year
),
prices AS (
    SELECT
        year,
        food_category,
        AVG(avg_price) AS avg_price
    FROM t_jakub_rubes_project_SQL_primary_final
    WHERE food_category IN (
        'Chléb konzumní kmínový',
        'Mléko polotučné pasterované'
    )
    GROUP BY year, food_category
)
SELECT
    p.year,
    p.food_category,
    ROUND(w.avg_wage / p.avg_price) AS purchasable_amount
FROM prices p
JOIN wages w
    ON p.year = w.year
ORDER BY p.year, p.food_category;























