SELECT
    Company,
    Sector,
    CASE
        WHEN Energy_Disclosed = 1 AND Water_Disclosed = 1
             AND Scope1_Disclosed = 1 AND Scope2_Disclosed = 1
             AND Scope3_Disclosed = 1 AND Intensity_Disclosed = 1
             AND Target_Disclosed = 1
            THEN 'Level 4 - Strategic Disclosure'
        WHEN Energy_Disclosed = 1 AND Water_Disclosed = 1
             AND Scope1_Disclosed = 1 AND Scope2_Disclosed = 1
             AND Scope3_Disclosed = 1 AND Intensity_Disclosed = 1
            THEN 'Level 3 - Advanced Disclosure'
        WHEN Energy_Disclosed = 1 AND Water_Disclosed = 1
             AND Scope1_Disclosed = 1 AND Scope2_Disclosed = 1
            THEN 'Level 2 - Core Environmental Disclosure'
        WHEN BRSR_Filed = 1
            THEN 'Level 1 - Compliance Only'
        ELSE 'Not Classified'
    END AS Maturity_Level
FROM brsr_extraction;