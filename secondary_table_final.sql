DROP TABLE IF EXISTS t_jakub_rubes_project_SQL_secondary_final_v2;

CREATE TABLE t_jakub_rubes_project_SQL_secondary_final_v2 AS
SELECT
    e.country,
    e.year,
    e.gdp,
    e.gini,
    e.population
FROM economies e
JOIN (
    SELECT DISTINCT year
    FROM t_jakub_rubes_project_SQL_primary_final
) p
    ON e.year = p.year
WHERE e.country = 'Czech Republic';




















