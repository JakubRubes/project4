# Project 4 Engeto: Analysis of Food Affordability in the Czech Republic

## Introduction
The aim of this project is to analyze the development of wages and prices of selected
basic food products in the Czech Republic and to assess their affordability for the
general population over time. The project also examines the relationship between
GDP growth and changes in wages and food prices.

The analysis was carried out using SQL on a PostgreSQL database, with an emphasis
on clarity, reproducibility, and correct interpretation of the results.

---

## Research Questions and Answers

### 1. Do wages decrease in some years?
Using year-over-year wage comparisons by industry, the analysis confirms that although wages show a
clear long-term upward trend across all industries, there are specific years in which wages declined
in individual sectors.

Based on the analysis, wage decreases occurred in the following industries and years:

- **Administrativní a podpůrné činnosti**: 2013  
- **Doprava a skladování**: 2011  
- **Informační a komunikační činnosti**: 2013  
- **Kulturní, zábavní a rekreační činnosti**: 2013  
- **Peněžnictví a pojišťovnictví**: 2013  
- **Profesní, vědecké a technické činnosti**: 2010, 2013  
- **Stavebnictví**: 2013  
- **Těžba a dobývání**: 2009, 2013, 2014, 2016  
- **Ubytování, stravování a pohostinství**: 2009, 2011  
- **Velkoobchod a maloobchod; opravy a údržba motorových vozidel**: 2013  
- **Veřejná správa a obrana; povinné sociální zabezpečení**: 2010, 2011  
- **Vzdělávání**: 2010  
- **Výroba a rozvod elektřiny, plynu, tepla a klimatizovaného vzduchu**: 2011, 2013, 2015  
- **Zemědělství, lesnictví, rybářství**: 2009  
- **Zásobování vodou; činnosti související s odpady a sanacemi**: 2013  
- **Činnosti v oblasti nemovitostí**: 2009, 2013  

These declines are concentrated mainly around economically challenging periods, especially the
years 2009 and 2013. They represent short-term fluctuations and do not contradict the overall
long-term growth of wages in the Czech Republic.

---

### 2. How many liters of milk or kilograms of bread can be purchased?
In 2006, it was possible to purchase approximately **1,313 kg of bread** or **1,466 liters of milk**
for the average wage. In 2018, this increased to approximately **1,365 kg of bread** or
**1,670 liters of milk**.

Purchasing power increased over the observed period. These values represent **alternative purchases**
(either bread or milk), not both at once.

---

### 3. Which food categories increase in price the slowest?
Two food categories show a negative average year-over-year price change:

- **Cukr krystalový** (−1.92 %)
- **Rajská jablka červená kulatá** (−0.74 %)

These categories can be considered the most price-stable during the observed period.

---

### 4. Was there a year when food prices grew more than wages by over 10 %?
No year was identified in which the year-over-year growth of food prices exceeded wage growth by more
than 10 %. Although food prices outpaced wages in some individual years, the difference never reached
the defined threshold.

---

### 5. Does GDP growth affect wages and food prices?
GDP growth shows a visible relationship with wage growth, often with a short delay. Periods of
strong GDP growth are generally followed by increased wage growth.

The relationship between GDP growth and food prices is weaker. In several years, food prices declined
despite GDP growth, indicating that food prices are influenced by additional factors such as market
conditions, imports, and regulation.

---

## Notes
- The primary table is intentionally constructed at the level of **industry, year, and food category**
  and is aggregated within individual analytical queries.
- Primary and secondary tables are limited to common years only.
- Window functions (`LAG`) were used to ensure correct year-over-year comparisons.
- The analysis focuses on long-term trends rather than short-term fluctuations.