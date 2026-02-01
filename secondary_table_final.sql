CREATE TABLE t_jakub_rubes_project_SQL_secondary_final AS
SELECT
    c.country,
    e.year,
    e.gdp,
    e.gini,
    e.population
FROM countries AS c
JOIN economies AS e
    ON c.country = e.country
WHERE c.continent = 'Europe';

