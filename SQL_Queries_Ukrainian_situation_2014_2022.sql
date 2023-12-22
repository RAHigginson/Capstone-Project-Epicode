-- Ukrainian Refugees in 2014 and 2022, organized by country of asylum
SELECT 
	`Country of origin`,
    `Country of asylum`,
    SUM(`Refugees under UNHCRs mandate`) AS Total_Refugees
FROM capstone.population_cleaned
WHERE 
    `Year` = 2014 
    AND `Country of origin` = 'Ukraine'
GROUP BY 
    `Country of origin`,
    `Country of asylum`
ORDER BY Total_Refugees DESC
LIMIT 10;

SELECT 
	`Country of origin`,
    `Country of asylum`,
    SUM(`Refugees under UNHCRs mandate`) AS Total_Refugees
FROM capstone.population_cleaned
WHERE 
    `Year` = 2022 
    AND `Country of origin` = 'Ukraine'
GROUP BY 
    `Country of origin`,
    `Country of asylum`
ORDER BY Total_Refugees DESC
LIMIT 10;

-- IDP Ukraine 2014 to 2023

SELECT 
		Year,
        `IDPs of concern to UNHCR`
FROM population_cleaned
WHERE `Country of origin` = 'Ukraine' AND `Country of asylum` = 'Ukraine';

-- Ukrainian Refugees, Asylum Seekers and IDP in 2022 in Europe (or any other region)
SELECT  p.`year`,
		p.`Country of origin`,
		p.`Country of asylum`,
        r.`region` as 'Region',
        p.`Refugees under UNHCRs mandate`,
        p.`Asylum-seekers`,
        p.`IDPs of concern to UNHCR`
FROM capstone.population_cleaned as p
JOIN countries_by_region as r ON p.`Country of asylum (ISO)` = r.`alpha-3`
WHERE r.region = 'Asia' AND p.`Country of origin` = 'Ukraine' AND p.`year` = 2022
ORDER BY p.`Refugees under UNHCRs mandate` DESC;