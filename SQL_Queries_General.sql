-- Totals of refugees, asylum seekers and IDPs divded by year, ranked from highest to lowest
SELECT 
    `Year`,
    `Country of origin`,
    SUM(`Refugees under UNHCRs mandate`) AS Total_Refugees,
    SUM(`Asylum-seekers`) AS Total_Asylum_seekers,
    SUM(`IDPs of concern to UNHCR`) AS Total_IDP
FROM 
    population_cleaned
GROUP BY 
    `Year`, `Country of origin`
ORDER BY 
    `Year`, Total_Refugees DESC; 
    
-- TOP 10 countries with more refugees, asylum seekers and IDP in 2014 and 2022

-- Refugees

SELECT 
	`Country of origin`,
    SUM(`Refugees under UNHCRs mandate`) AS Total_Refugees
FROM capstone.population_cleaned
WHERE Year = 2014
GROUP BY `Country of origin`
ORDER BY Total_Refugees DESC
LIMIT 10;

SELECT 
	`Country of origin`,
    SUM(`Refugees under UNHCRs mandate`) AS Total_Refugees
FROM capstone.population_cleaned
WHERE Year = 2022
GROUP BY `Country of origin`
ORDER BY Total_Refugees DESC
LIMIT 10;

-- Asylum seekers 

SELECT 
	`Country of origin`,
    SUM(`Asylum-seekers`) AS Total_Asylum_seekers
FROM capstone.population_cleaned
WHERE Year = 2014
GROUP BY `Country of origin`
ORDER BY Total_Asylum_seekers DESC
LIMIT 10;

SELECT 
	`Country of origin`,
    SUM(`Asylum-seekers`) AS Total_Asylum_seekers
FROM capstone.population_cleaned
WHERE Year = 2022
GROUP BY `Country of origin`
ORDER BY Total_Asylum_seekers DESC
LIMIT 10;

-- IDP

SELECT 
	`Country of origin`,
    SUM(`IDPs of concern to UNHCR`) AS Total_IDP
FROM capstone.population_cleaned
WHERE Year = 2014
GROUP BY `Country of origin`
ORDER BY Total_IDP DESC
LIMIT 10;

SELECT 
	`Country of origin`,
    SUM(`IDPs of concern to UNHCR`) AS Total_IDP
FROM capstone.population_cleaned
WHERE Year = 2022
GROUP BY `Country of origin`
ORDER BY Total_IDP DESC
LIMIT 10;

-- TOP 10 Receiving countries 2022 and 2014

SELECT 
	`Country of asylum`,
    SUM(`Refugees under UNHCRs mandate`) AS Total_Refugees
FROM capstone.population_cleaned
WHERE Year = 2014
GROUP BY `Country of asylum`
ORDER BY Total_Refugees DESC
LIMIT 10;

SELECT 
	`Country of asylum`,
    SUM(`Refugees under UNHCRs mandate`) AS Total_Refugees
FROM capstone.population_cleaned
WHERE Year = 2022
GROUP BY `Country of asylum`
ORDER BY Total_Refugees DESC
LIMIT 10;

