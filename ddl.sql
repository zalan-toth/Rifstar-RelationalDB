CREATE DATABASE Space;
USE Space;

CREATE TABLE Universes (
    Name VARCHAR(255) UNIQUE NOT NULL PRIMARY KEY,
    CreationTime BIGINT NOT NULL DEFAULT 0,
    IsPublic BOOLEAN NOT NULL DEFAULT FALSE,
    OwnershipType VARCHAR(16) NOT NULL DEFAULT 'SERVER',
    OwnerUUID VARCHAR(36)
    -- OwnerUUID foreign key will be added after Users table creation
);

CREATE TABLE Galaxies (
    Galaxy_ID INT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DisplayName VARCHAR(255) UNIQUE NOT NULL,
    CenterX DOUBLE NOT NULL,
    CenterY DOUBLE NOT NULL,
    CenterZ DOUBLE NOT NULL,
    UniverseName VARCHAR(255) NOT NULL,
    FOREIGN KEY (UniverseName) REFERENCES Universes(Name)
);

CREATE TABLE SolarSystems (
    Solar_ID INT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DisplayName VARCHAR(255) UNIQUE NOT NULL,
    Galaxy_ID INT NOT NULL,
    FOREIGN KEY (Galaxy_ID) REFERENCES Galaxies(Galaxy_ID)
);

CREATE TABLE Celestials (
    Celestial_ID INT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DisplayName VARCHAR(255) UNIQUE NOT NULL,
    Diameter DOUBLE,
    Type VARCHAR(64) NOT NULL,
    Sol SMALLINT,
    HoursPerSol DOUBLE,
    Description TEXT,
    Solar_ID INT NOT NULL,
    FOREIGN KEY (Solar_ID) REFERENCES SolarSystems(Solar_ID)
);

CREATE TABLE Orbits (
    Celestial_ID INT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY REFERENCES Celestials(Celestial_ID),
    OrbitDistance DOUBLE(32,16) NOT NULL,
    CelestialOrbit INT,
    FOREIGN KEY (CelestialOrbit) REFERENCES Celestials(Celestial_ID)
);

CREATE TABLE Dimensions (
    Dimension_ID INT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DisplayName VARCHAR(255) UNIQUE NOT NULL,
    Type VARCHAR(255) NOT NULL,
    Environment VARCHAR(16) NOT NULL DEFAULT 'NORMAL',
    BuildNumber INT NOT NULL,
    LogicalHeight DOUBLE NOT NULL,
    DimensionTop DOUBLE NOT NULL,
    DimensionBottom DOUBLE NOT NULL,
    SeaLevel DOUBLE,
    Gravity DOUBLE NOT NULL,
    LandChance DOUBLE(8,7),
    Description TEXT,
    Celestial_ID INT NOT NULL,
    FOREIGN KEY (Celestial_ID) REFERENCES Celestials(Celestial_ID)
);

CREATE TABLE Regions (
    Region_ID INT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DisplayName VARCHAR(255) UNIQUE NOT NULL,
    Rarity INT NOT NULL,
    Description TEXT,
    Dimension_ID INT NOT NULL,
    FOREIGN KEY (Dimension_ID) REFERENCES Dimensions(Dimension_ID)
);

CREATE TABLE Biomes (
    Biome_ID INT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DisplayName VARCHAR(255) UNIQUE NOT NULL,
    Rarity INT NOT NULL,
    LowestTemp DOUBLE NOT NULL,
    HighestTemp DOUBLE NOT NULL,
    Temperature DOUBLE NOT NULL,
    Description TEXT,
    Region_ID INT NOT NULL,
    FOREIGN KEY (Region_ID) REFERENCES Regions(Region_ID)
);

CREATE TABLE Users (
    UUID VARCHAR(36) UNIQUE NOT NULL PRIMARY KEY,
    LastCoordX DOUBLE NOT NULL,
    LastCoordY DOUBLE NOT NULL,
    LastCoordZ DOUBLE NOT NULL,
    Oxygen SMALLINT NOT NULL DEFAULT 0,
    LastUniverse VARCHAR(255),
    LastDimension INT,
    FOREIGN KEY (LastUniverse) REFERENCES Universes(Name),
    FOREIGN KEY (LastDimension) REFERENCES Dimensions(Dimension_ID)
);

-- Add foreign key to Universes (OwnerUUID)
ALTER TABLE Universes
ADD FOREIGN KEY (OwnerUUID) REFERENCES Users(UUID);


