SELECT 'Energy' AS Disclosure, SUM(Energy_Disclosed) AS Companies,
       ROUND(100.0 * SUM(Energy_Disclosed) / COUNT(*), 1) AS Pct
FROM brsr_extraction
UNION ALL
SELECT 'Water', SUM(Water_Disclosed),
       ROUND(100.0 * SUM(Water_Disclosed) / COUNT(*), 1)
FROM brsr_extraction
UNION ALL
SELECT 'Scope 1', SUM(Scope1_Disclosed),
       ROUND(100.0 * SUM(Scope1_Disclosed) / COUNT(*), 1)
FROM brsr_extraction
UNION ALL
SELECT 'Scope 2', SUM(Scope2_Disclosed),
       ROUND(100.0 * SUM(Scope2_Disclosed) / COUNT(*), 1)
FROM brsr_extraction
UNION ALL
SELECT 'Scope 3', SUM(Scope3_Disclosed),
       ROUND(100.0 * SUM(Scope3_Disclosed) / COUNT(*), 1)
FROM brsr_extraction
UNION ALL
SELECT 'Intensity', SUM(Intensity_Disclosed),
       ROUND(100.0 * SUM(Intensity_Disclosed) / COUNT(*), 1)
FROM brsr_extraction
UNION ALL
SELECT 'Target', SUM(Target_Disclosed),
       ROUND(100.0 * SUM(Target_Disclosed) / COUNT(*), 1)
FROM brsr_extraction
UNION ALL
SELECT 'Assurance', SUM(Assurance_Disclosed),
       ROUND(100.0 * SUM(Assurance_Disclosed) / COUNT(*), 1)
FROM brsr_extraction
ORDER BY Pct;