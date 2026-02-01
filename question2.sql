WITH years AS (
    SELECT
        MIN(year) AS first_year,
        MAX(year) AS last_year
    FROM t_jakub_rubes_project_SQL_primary_final
),
avg_wages AS (
    SELECT
        year,
        AVG(avg_wage) AS avg_wage
    FROM t_jakub_rubes_project_SQL_primary_final
    GROUP BY year
),
avg_prices AS (
    SELECT
        year,
        food_category,
        AVG(avg_price) AS avg_price
    FROM t_jakub_rubes_project_SQL_primary_final
    WHERE food_category IN (
        'Mléko polotučné pasterované',
        'Chléb konzumní kmínový'
    )
    GROUP BY year, food_category
)
SELECT
    p.year,
    p.food_category,
    ROUND(w.avg_wage / p.avg_price) AS amount_can_buy
FROM avg_prices AS p
JOIN avg_wages AS w
    ON p.year = w.year
JOIN years AS y
    ON p.year IN (y.first_year, y.last_year)
ORDER BY p.year, p.food_category;







