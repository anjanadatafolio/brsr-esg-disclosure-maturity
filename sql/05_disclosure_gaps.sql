SELECT
    Company,
    Sector,
    RTRIM(
        CASE WHEN Scope3_Disclosed = 0 THEN 'Scope 3; ' ELSE '' END ||
        CASE WHEN Target_Disclosed = 0 THEN 'Target; ' ELSE '' END,
        '; '
    ) AS Missing_Disclosures
FROM brsr_extraction
WHERE Scope3_Disclosed = 0 OR Target_Disclosed = 0
ORDER BY Sector, Company;