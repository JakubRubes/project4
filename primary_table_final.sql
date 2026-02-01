CREATE TABLE t_jakub_rubes_project_SQL_primary_final AS
WITH payroll AS (
    SELECT
        cp.payroll_year AS year,
        ib.name AS industry,
        AVG(cp.value) AS avg_wage
    FROM czechia_payroll AS cp
    JOIN czechia_payroll_industry_branch AS ib
        ON cp.industry_branch_code = ib.code
    WHERE cp.value_type_code = 5958
      AND cp.calculation_code = 200
    GROUP BY cp.payroll_year, ib.name
),
prices AS (
    SELECT
        EXTRACT(YEAR FROM cp.date_from) AS year,
        pc.name AS food_category,
        AVG(cp.value) AS avg_price
    FROM czechia_price AS cp
    JOIN czechia_price_category AS pc
        ON cp.category_code = pc.code
    GROUP BY EXTRACT(YEAR FROM cp.date_from), pc.name
)
SELECT
    p.year,
    p.industry,
    p.avg_wage,
    pr.food_category,
    pr.avg_price
FROM payroll AS p
JOIN prices AS pr
    ON p.year = pr.year;
