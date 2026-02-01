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
    MIN(avg_wage) AS wage_first_year,
    MAX(avg_wage) AS wage_last_year,
    MAX(avg_wage) - MIN(avg_wage) AS wage_difference
FROM wages_by_year
GROUP BY industry
ORDER BY wage_difference;







