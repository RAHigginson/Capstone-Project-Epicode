-- TOP 10 countries with refugees by region

-- Americas

SELECT 
    p.`Country of origin`,
    SUM(p.`Refugees under UNHCRs mandate`) AS Total_Refugees,
    r.region
FROM 
    capstone.population_cleaned as p
JOIN 
    countries_by_region as r ON p.`Country of origin (ISO)` = r.`alpha-3`
WHERE 
    r.region = 'Americas' AND p.Year = 2022
GROUP BY 
    p.`Country of origin`, r.region
ORDER BY 
    Total_Refugees DESC
LIMIT 10;
    
-- Europe

SELECT 
    p.`Country of origin`,
    SUM(p.`Refugees under UNHCRs mandate`) AS Total_Refugees,
    r.region
FROM 
    capstone.population_cleaned as p
JOIN 
    countries_by_region as r ON p.`Country of origin (ISO)` = r.`alpha-3`
WHERE 
    r.region = 'Europe' AND p.Year = 2022
GROUP BY 
    p.`Country of origin`, r.region
ORDER BY 
    Total_Refugees DESC
LIMIT 10;
    
-- Asia

SELECT 
    p.`Country of origin`,
    SUM(p.`Refugees under UNHCRs mandate`) AS Total_Refugees,
    r.region
FROM 
    capstone.population_cleaned as p
JOIN 
    countries_by_region as r ON p.`Country of origin (ISO)` = r.`alpha-3`
WHERE 
    r.region = 'Asia' AND p.Year = 2022
GROUP BY 
    p.`Country of origin`, r.region
ORDER BY 
    Total_Refugees DESC
LIMIT 10;
    
-- Africa
    
SELECT 
    p.`Country of origin`,
    SUM(p.`Refugees under UNHCRs mandate`) AS Total_Refugees,
    r.region
FROM 
    capstone.population_cleaned as p
JOIN 
    countries_by_region as r ON p.`Country of origin (ISO)` = r.`alpha-3`
WHERE 
    r.region = 'Africa' AND p.Year = 2022
GROUP BY 
    p.`Country of origin`, r.region
ORDER BY 
    Total_Refugees DESC
LIMIT 10;
    
-- Oceania
    
SELECT 
    p.`Country of origin`,
    SUM(p.`Refugees under UNHCRs mandate`) AS Total_Refugees,
    r.region
FROM 
    capstone.population_cleaned as p
JOIN 
    countries_by_region as r ON p.`Country of origin (ISO)` = r.`alpha-3`
WHERE 
    r.region = 'Oceania' AND p.Year = 2022
GROUP BY 
    p.`Country of origin`, r.region
ORDER BY 
    Total_Refugees DESC
LIMIT 10;
    
-- Total of refugees by Region (origin region). Comparision 2014 and 2022
SELECT 
    r.`region` as 'Region',
    SUM(p.`Refugees under UNHCRs mandate`) AS Total_Refugees
FROM 
    capstone.population_cleaned as p
JOIN 
    countries_by_region as r ON p.`Country of origin (ISO)` = r.`alpha-3`
WHERE p.`year` = 2014
GROUP BY 
     r.`region`
ORDER BY 
    Total_Refugees DESC; 

SELECT 
    r.`region` as 'Region',
    SUM(p.`Refugees under UNHCRs mandate`) AS Total_Refugees
FROM 
    capstone.population_cleaned as p
JOIN 
    countries_by_region as r ON p.`Country of origin (ISO)` = r.`alpha-3`
WHERE p.`year` = 2022
GROUP BY 
     r.`region`
ORDER BY 
    Total_Refugees DESC;



-- Total of refugees by Region (Receiving region). Comparision 2014 and 2022
SELECT 
    r.`region` as 'Region',
    SUM(p.`Refugees under UNHCRs mandate`) AS Total_Refugees
FROM 
    capstone.population_cleaned as p
JOIN 
    countries_by_region as r ON p.`Country of asylum (ISO)` = r.`alpha-3`
WHERE p.`year` = 2014
GROUP BY 
     r.`region`
ORDER BY 
    Total_Refugees DESC; 

SELECT 
    r.`region` as 'Region',
    SUM(p.`Refugees under UNHCRs mandate`) AS Total_Refugees
FROM 
    capstone.population_cleaned as p
JOIN 
    countries_by_region as r ON p.`Country of asylum (ISO)` = r.`alpha-3`
WHERE p.`year` = 2022
GROUP BY 
     r.`region`
ORDER BY 
    Total_Refugees DESC;