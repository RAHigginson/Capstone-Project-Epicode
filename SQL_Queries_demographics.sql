-- demographics

SELECT
    p.`Year`,
    p.`Country of origin`,
    SUM(d.`Female 0 - 4`) AS `Female 0 - 4`,
    SUM(d.`Female 5 - 11`) AS `Female 5 - 11`,
    SUM(d.`Female 12 - 17`) AS `Female 12 - 17`,
    SUM(d.`Female 0 - 4` + d.`Female 5 - 11` + d.`Female 12 - 17`) AS Total_Female,
    SUM(d.`Male 0 - 4`) AS `Male 0 - 4`,
    SUM(d.`Male 5 - 11`) AS `Male 5 - 11`,
    SUM(d.`Male 12 - 17`) AS `Male 12 - 17`,
    SUM(d.`Male 0 - 4` + d.`Male 5 - 11` + d.`Male 12 - 17`) AS Total_Male
FROM 
    capstone.population_cleaned as p
JOIN 
    demographics_cleaned as d
ON 
    p.`Year` = d.`Year`
    AND p.`Country of origin` = d.`Country of origin`
    AND p.`Country of asylum` = d.`Country of asylum`
WHERE
    p.`Year` = 2022
GROUP BY
    p.`Year`,
    p.`Country of origin`
ORDER BY SUM(p.`Refugees under UNHCRs mandate`) DESC
LIMIT 10;

-- 

SELECT
    p.`Year`,
    p.`Country of origin`,
    COALESCE(SUM(`Female 0 - 4`), 0) + COALESCE(SUM(`Female 5 - 11`), 0) + COALESCE(SUM(`Female 12 - 17`), 0) + COALESCE(SUM(`Female 18 - 59`), 0) + COALESCE(SUM(`Female 60`), 0) + COALESCE(SUM(`Female other`), 0) AS "Female",
    COALESCE(SUM(`Male 0 - 4`), 0) + COALESCE(SUM(`Male 5 - 11`), 0) + COALESCE(SUM(`Male 12 - 17`), 0) + COALESCE(SUM(`Male 18 - 59`), 0) + COALESCE(SUM(`Male 60`), 0) + COALESCE(SUM(`Male other`), 0) AS "Male"
FROM 
    capstone.population_cleaned as p
JOIN 
    demographics_cleaned as d
ON 
    p.`Year` = d.`Year`
    AND p.`Country of origin` = d.`Country of origin`
    AND p.`Country of asylum` = d.`Country of asylum`
WHERE
    p.`Year` = 2022
GROUP BY
    p.`Year`,
    p.`Country of origin`
ORDER BY
    SUM(`Refugees under UNHCRs mandate`) + SUM(`Asylum-seekers`) + SUM(`IDPs of concern to UNHCR`) DESC
LIMIT 20;