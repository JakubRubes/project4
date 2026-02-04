DROP TABLE IF EXISTS t_jakub_rubes_project_SQL_primary_final;

CREATE TABLE t_jakub_rubes_project_SQL_primary_final AS
SELECT
    ib.name AS industry,
    cp.payroll_year AS year,
    AVG(cp.value) AS avg_wage,
    pc.name AS food_category,
    AVG(p.value) AS avg_price
FROM czechia_payroll cp
JOIN czechia_payroll_industry_branch ib
    ON cp.industry_branch_code = ib.code
JOIN czechia_price p
    ON cp.payroll_year = EXTRACT(YEAR FROM p.date_from)
JOIN czechia_price_category pc
    ON p.category_code = pc.code
WHERE cp.value_type_code = 5958
  AND cp.calculation_code = 200
GROUP BY
    ib.name,
    cp.payroll_year,
    pc.name;



















