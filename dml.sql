USE Space;

INSERT INTO Users (UUID, LastCoordX, LastCoordY, LastCoordZ, Oxygen, LastUniverse, LastDimension) VALUES
('22158454-6f80-46ff-9eaf-2b26fad71700', 10.0, 20.0, 30.0, 100, NULL, NULL),
('0fb0a9fd-6202-446e-a51f-6be1046b4d77', 40.0, 50.0, 60.0, 80, NULL, NULL),
('74ebdbd4-70a3-4ac5-a01e-8564b658cdc1', 45.0, 0.0, 60.0, 260, NULL, NULL),
('c96792ac-7aea-4f16-975e-535a20a2791a', 70.0, 0.0, 60.0, 300, NULL, NULL),
('f7c77d99-9f15-4a66-a87d-c4a51ef30d19', 40.0, 0.0, 60.0, 115, NULL, NULL),
('29874407-b60b-44d8-8440-4e6b5a45a1a2', 70.0, 80.0, 90.0, 60, NULL, NULL);

INSERT INTO Universes (Name, CreationTime, IsPublic, OwnershipType, OwnerUUID) VALUES
('m44', 0, TRUE, 'SERVER', NULL),
('p88', 5834262234632, FALSE, 'PLAYER', '22158454-6f80-46ff-9eaf-2b26fad71700');


INSERT INTO Galaxies (Galaxy_ID, DisplayName, CenterX, CenterY, CenterZ, UniverseName) VALUES
(DEFAULT, 'Milky Way', 0.0, 0.0, 0.0, 'm44'),
(DEFAULT, 'Arcadia', 12514.0, 507.0, 12514.0, 'p88');

INSERT INTO SolarSystems (Solar_ID, DisplayName, Galaxy_ID) VALUES
(DEFAULT, 'Solar System', 1),
(DEFAULT, 'Elementia', 2);

INSERT INTO Celestials (Celestial_ID, DisplayName, Diameter, Type, Sol, HoursPerSol, Description, Solar_ID) VALUES
(DEFAULT, 'Sun', 4262, 'Star', NULL, NULL, 'Center of the Solar System', 1),
(DEFAULT, 'Mercury', 4262, 'Planet', 150, 7, 'A planet', 1),
(DEFAULT, 'Venus', 236236, 'Planet', 200, 15, 'A planet', 1),
(DEFAULT, 'Earth', 64363, 'Planet', 365, 24, 'The home of the Humanity', 1),
(DEFAULT, 'Mars', 32626, 'Planet', 400, 24.6, 'Red planet', 1),
(DEFAULT, 'Jupiter', 32626323236, 'Planet', 600, 50, 'Gas planet', 1),
(DEFAULT, 'Uranus', 3626236, 'Planet', 1200, 30, 'A planet', 1),
(DEFAULT, 'Saturnus', 2356623, 'Planet', 1800, 66, 'A planet', 1),
(DEFAULT, 'Neptunus', 125125, 'Planet', 2256, 110, 'A planet', 1),
(DEFAULT, 'Moon', 12445, 'Moon', NULL, NULL, 'Moon of Earth', 1),
(DEFAULT, 'Europa', 2143, 'Moon', NULL, NULL, 'Moon of Jupiter', 1),
(DEFAULT, 'International Space Station', NULL, 'Satellite', NULL, NULL, 'Space Station of Humanity', 1),
(DEFAULT, 'Harmonia', 24141252156.56, 'Star', NULL, NULL, 'Center of Elementia', 2);

INSERT INTO Orbits (Celestial_ID, OrbitDistance, CelestialOrbit) VALUES
(1, 40, NULL), -- Sun
(2, 0.000000587, 1), -- Mercury
(3, 0.000005587, 1), -- Venus
(4, 0.000015587, 1), -- Earth
(5, 0.00002345, 1), -- Mars
(6, 0.000015587, 1), -- Jupiter
(7, 0.000045587, 1), -- Uranus
(8, 0.000065587, 1), -- Saturnus
(9, 0.000115587, 1), -- Neptunus
(10, 0.0000000052, 4), -- Moon
(11, 0.0000000142, 6), -- Europa
(12, 0.0000000012, 4), -- International Space Station
(13, 56, NULL); -- Harmonia

INSERT INTO Dimensions (Dimension_ID, DisplayName, Type, Environment, BuildNumber, LogicalHeight, DimensionTop, DimensionBottom, SeaLevel, Gravity, LandChance, Description, Celestial_ID) VALUES
(DEFAULT, 'Surface of Earth', 'SURFACE', 'NORMAL', 1001, 256.0, 128.0, -128.0, 62.0, 9.8, 0.5, 'Earth surface', 4),
(DEFAULT, 'Surface of the Moon', 'SURFACE', 'NORMAL', 343, 256.0, 128.0, -128.0, 62.0, 9.8, 0.5, 'Moon surface', 10),
(DEFAULT, 'Space Station for Earth', 'SATELLITE', 'NORMAL', 51, 128.0, 64.0, -64.0, NULL, 1.6, NULL, 'Space Station interior', 1);

INSERT INTO Regions (Region_ID, DisplayName, Rarity, Description, Dimension_ID) VALUES
(DEFAULT, 'Cheesy', 5, 'Very cheesy', 2),
(DEFAULT, 'Dry', 1, 'A vast dry region', 1),
(DEFAULT, 'Temperate', 2, 'A vast temperate region', 1);

INSERT INTO Biomes (Biome_ID, DisplayName, Rarity, LowestTemp, HighestTemp, Temperature, Description, Region_ID) VALUES
(DEFAULT, 'Valleys', 4, 250.0, 300.0, 270.0, 'Cheesy valleys', 1),
(DEFAULT, 'Craters', 2, 250.0, 300.0, 279.0, 'Cheesy craters', 1),
(DEFAULT, 'Desert Oasis', 3, 293.15, 318.15, 303.15, 'A rare oasis in the midst of a vast desert', 2),
(DEFAULT, 'Dune Sea', 5, 303.15, 323.15, 313.15, NULL, 2),
(DEFAULT, 'Canyon Maze', 4, 288.15, 308.15, 298.15, NULL, 2),
(DEFAULT, 'Dust Plains', 3, 298.15, 318.15, 308.15, NULL, 2),
(DEFAULT, 'Rocky Badlands', 2, 283.15, 313.15, 293.15, NULL, 2),
(DEFAULT, 'Red Desert', 4, 308.15, 328.15, 318.15, 'A red-colored desert with extreme temperatures', 2),
(DEFAULT, 'Green Forest', 3, 283.15, 298.15, 291.15, 'Lush, green forests with diverse wildlife', 3),
(DEFAULT, 'Meadow Fields', 2, 281.15, 295.15, 288.15, 'Meadows with colorful flowers', 3),
(DEFAULT, 'Blue Lakes', 4, 278.15, 293.15, 285.15, 'Clear blue lakes surrounded by nature', 3),
(DEFAULT, 'Misty Valley', 5, 280.15, 291.15, 286.15, 'A valley', 3),
(DEFAULT, 'Fruit Orchards', 3, 282.15, 297.15, 289.15, 'Orchards rich with various fruits', 3),
(DEFAULT, 'Sunflower Plains', 2, 283.15, 298.15, 290.15, 'Vast plains with tall sunflowers', 3);

