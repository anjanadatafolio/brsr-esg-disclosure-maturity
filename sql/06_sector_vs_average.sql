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
),
sector_stats AS (
    SELECT
        Sector,
        ROUND(100.0 * SUM(CASE WHEN Level_No = 4 THEN 1 ELSE 0 END) / COUNT(*), 1) AS Level4_Pct,
        AVG(Level_No) AS Avg_Level
    FROM levels
    GROUP BY Sector
)
SELECT
    Sector,
    Level4_Pct,
    ROUND(Avg_Level, 2) AS Avg_Level,
    ROUND(AVG(Avg_Level) OVER (), 2) AS All_Sector_Avg,
    ROUND(Avg_Level - AVG(Avg_Level) OVER (), 2) AS Vs_Average,
    RANK() OVER (ORDER BY Avg_Level DESC) AS Sector_Rank
FROM sector_stats
ORDER BY Sector_Rank;