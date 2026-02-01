# Project 4 Engeto: Analysis of Food Affordability in the Czech Republic

## Introduction
The aim of this project is to analyze the development of wages and prices of selected
basic food products in the Czech Republic and to assess their affordability for the
general population over time. The project also examines the relationship between
GDP growth and changes in wages and food prices.

The analysis was carried out using SQL on a PostgreSQL database, with an emphasis
on clarity, reproducibility, and correct interpretation of the results.

---

## Data Sources

### Primary Data Sources (Czech Republic)
- `czechia_payroll` – wage data by industry
- `czechia_price` – monthly prices of selected food products
- `czechia_price_category` – food category codebook
- `czechia_payroll_industry_branch` – industry codebook

### Supplementary Data Sources
- `countries` – basic information about countries
- `economies` – GDP, GINI coefficient, and population

Primary tables were not modified. All transformations, filtering, and aggregations
were performed only in newly created tables and SQL queries.

---

## Output Tables

### 1. `t_jakub_rubes_project_SQL_primary_final`
A unified table containing:
- average wages by industry
- average food prices by category

The data are:
- aggregated to a yearly level
- limited to years common to both wage and price datasets
- used for analyzing purchasing power and price trends in the Czech Republic

### 2. `t_jakub_rubes_project_SQL_secondary_final`
A table containing:
- GDP
- GINI coefficient
- population

for selected European countries. This table serves as supplementary context and is
primarily used in the analysis of the relationship between GDP, wages, and food prices.

---

## Research Questions and Conclusions

### 1. Do wages grow over time in all industries?
Based on a comparison of average wages in the first and last available years, it can
be concluded that wages increased in all monitored industries over the long term.
The analysis focuses on overall trends rather than short-term fluctuations.

---

### 2. How many liters of milk and kilograms of bread can be purchased?
In the first comparable year (2006), it was possible to purchase approximately
**1,313 kilograms of bread** and **1,466 liters of milk** for the average wage.

In the last comparable year (2018), this amount increased to approximately
**1,365 kilograms of bread** and **1,670 liters of milk**.

These results show that purchasing power in the Czech Republic improved over the
analyzed period, as average wages grew faster than the prices of these basic food
products.

---

### 3. Which food category increases in price the slowest?
The analysis identified two food categories that exhibited a **negative average
year-over-year price change**, meaning they became cheaper over time on average:

- **Cukr krystalový** (−1.92 %)
- **Rajská jablka červená kulatá** (−0.74 %)

These products can be considered the most price-stable categories in the dataset,
while other food categories showed positive price growth.

---

### 4. Is there a year when food prices grew significantly faster than wages?
When analyzing individual years, no year was identified in which food price growth
exceeded wage growth by more than 10 %.

Although some years showed faster food price growth than wage growth
(e.g. 2007, 2008, or 2011), the difference never reached the threshold required by
the research question. In several years (such as 2009 or 2016), wage growth even
outpaced food price growth.

---

### 5. Does GDP growth influence wages and food prices?
The analysis shows that GDP growth and wage growth are related, often with a
one-year delay.

The strongest GDP growth was recorded in **2007 (9.26 %) and 2008 (8.92 %)**,
while the most significant economic decline occurred in **2009 (−6.58 %)**.

Wage growth tended to follow GDP development with a delay. For example, strong
GDP growth in 2007 and 2008 was followed by higher wage growth in subsequent
years, while the economic downturn in 2009 coincided with a much weaker wage
performance.

The relationship between GDP and food prices is less clear. A notable observation
is that in **2009**, despite a strong economic decline, food prices decreased more
than wages. Additionally, in **2014–2016**, food prices declined even though GDP
was growing again. This indicates that food prices are influenced by additional
factors such as market conditions, competition, or external price pressures.

Overall, while GDP growth appears to influence wage development, its impact on
food prices is weaker and less direct. A clear causal relationship between GDP
growth and food price changes cannot be confirmed.

---

## Limitations of the Analysis
- GINI coefficient values are missing for some countries
- The analysis focuses on long-term trends rather than short-term fluctuations
- Monthly food prices were aggregated into yearly averages
- The time series is limited by the availability of complete data for all indicators

---

## Tools Used
- PostgreSQL
- DBeaver
- GitHub

