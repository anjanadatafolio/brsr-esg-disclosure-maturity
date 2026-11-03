WITH levels AS (
    SELECT
        Company,
        Sector,
        CASE
            WHEN Energy_Disclosed = 1 AND Water_Disclosed = 1
                 AND Scope1_Disclosed = 1 AND Scope2_Disclosed = 1
                 AND Scope3_Disclosed = 1 AND Intensity_Disclosed = 1
                 AND Target_Disclosed = 1 THEN 4
            WHEN Energy_Disclosed = 1 AND Water_Disclosed = 1
                 AND Scope1_Disclosed = 1 AND Scope2_Disclosed = 1
                 AND Scope3_Disclosed = 1 AND Intensity_Disclosed = 1 THEN 3
            WHEN Energy_Disclosed = 1 AND Water_Disclosed = 1
                 AND Scope1_Disclosed = 1 AND Scope2_Disclosed = 1 THEN 2
            WHEN BRSR_Filed = 1 THEN 1
            ELSE 0
        END AS Level_No
    FROM brsr_extraction
)
SELECT
    Sector,
    COUNT(*) AS Companies,
    SUM(CASE WHEN Level_No = 4 THEN 1 ELSE 0 END) AS Level4_Count,
    ROUND(AVG(Level_No), 2) AS Avg_Level
FROM levels
GROUP BY Sector
ORDER BY Avg_Level DESC;