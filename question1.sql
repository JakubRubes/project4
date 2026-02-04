WITH wages_by_year AS (
    SELECT
        industry,
        year,
        AVG(avg_wage) AS avg_wage
    FROM t_jakub_rubes_project_SQL_primary_final
    GROUP BY industry, year
)
SELECT
    industry,
    year,
    avg_wage,
    avg_wage
        - LAG(avg_wage) OVER (
            PARTITION BY industry
            ORDER BY year
        ) AS wage_change
FROM wages_by_year
ORDER BY industry, year;






















