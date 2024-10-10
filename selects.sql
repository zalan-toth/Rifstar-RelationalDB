SELECT * FROM Users;
SELECT * FROM Universes;
SELECT * FROM Galaxies;
SELECT * FROM SolarSystems;
SELECT * FROM Celestials;
SELECT * FROM Orbits;
SELECT * FROM Dimensions;
SELECT * FROM Regions;
SELECT * FROM Biomes;

-- Average oxygen level among users
SELECT 
    AVG(Oxygen) AS AverageOxygenLevel
FROM 
    Users;

-- Maximum oxygen level among users
SELECT 
    MAX(Oxygen) AS MaximumOxygenLevel
FROM 
    Users;

-- Minimum oxygen level among users
SELECT 
    MIN(Oxygen) AS MinimumOxygenLevel
FROM 
    Users;
    
-- Counting number of planets
SELECT 
    COUNT(*) AS NumberOfPlanets
FROM 
    Celestials
WHERE 
    Type = 'Planet';
    
    
-- Connecting Celestials with their Orbits
SELECT 
    c.Celestial_ID,
    c.DisplayName,
    c.Diameter,
    c.Type,
    o.OrbitDistance,
    o.CelestialOrbit
FROM 
    Celestials c
JOIN 
    Orbits o ON c.Celestial_ID = o.Celestial_ID;
    
-- Getting the orbit for Stars which is the Galaxy
SELECT 
    c.Celestial_ID,
    c.DisplayName AS CelestialName,
    g.Galaxy_ID AS OrbitGalaxyID,
    g.DisplayName AS OrbitGalaxyName
FROM 
    Celestials AS c
JOIN 
    SolarSystems AS ss ON c.Solar_ID = ss.Solar_ID
JOIN 
    Galaxies AS g ON ss.Galaxy_ID = g.Galaxy_ID
LEFT JOIN 
    Orbits AS o ON c.Celestial_ID = o.Celestial_ID
WHERE 
    o.CelestialOrbit IS NULL
GROUP BY 
    g.DisplayName;


-- Getting the Celestial and its corresponding SolarSystem and Galaxy
SELECT 
    c.DisplayName AS Celestial,
    ss.DisplayName AS SolarSystem,
    g.DisplayName AS Galaxy
FROM 
    Celestials c
JOIN 
    SolarSystems ss ON c.Solar_ID = ss.Solar_ID
JOIN 
    Galaxies g ON ss.Galaxy_ID = g.Galaxy_ID;

-- Ordering Biomes by their displayname
SELECT 
	*
FROM 
    Biomes
GROUP BY 
    DisplayName;
    
    
-- Ordering Biomes by temperature (Shown in Celsius instead of Kelvin)
SELECT 
	Biome_ID,
	DisplayName,
    Temperature-272.15 AS TemperatureInCelsuis
FROM 
    Biomes
GROUP BY 
    TemperatureInCelsuis;
    
-- Connecting Biomes with their corresponding Region


SELECT 
    b.Biome_ID,
    b.DisplayName AS BiomeName,
    r.Region_ID,
    r.DisplayName AS RegionName
FROM 
    Biomes b
JOIN 
    Regions r ON b.Region_ID = r.Region_ID;

-- Getting moons and satellites and ordering them by diameter in descending order.
SELECT 
    Celestial_ID,
    DisplayName,
    Diameter,
    Type
FROM 
    Celestials
WHERE 
    Type IN ('Moon', 'Satellite')
ORDER BY 
    Diameter DESC;
