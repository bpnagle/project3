Create table crypto_world_countries (
    "place" INT,
    "pop2023" INT,
    "growthRate" NUMERIC(6, 5),
    "area" NUMERIC(9, 1),
    "country" TEXT,
    "cca3" TEXT,
    "cca2" TEXT,
    "ccn3" INT,
    "region" TEXT,
    "subregion" TEXT,
    "unMember" TEXT,
    "officialName" TEXT,
    "landAreaKm" NUMERIC(9, 1),
    "density" NUMERIC(9, 4),
    "densityMi" NUMERIC(9, 4),
    "Rank" INT,
    "CryptoCurrencyStatus" TEXT,
    "CryptoCurrencyNotes" TEXT,
    "Column_19" TEXT,
    "Column_20" TEXT,
    "Column_21" TEXT
);

ALTER TABLE crypto_world_countries
ADD CONSTRAINT pk_country PRIMARY KEY (country);
ALTER TABLE crypto_world_countries
RENAME COLUMN country TO countries;


CREATE TABLE Crypto_Ownership (
    "Countries" TEXT,
    "Number_of_Crypto_Ownership" INT
);

ALTER TABLE Crypto_Ownership
ADD CONSTRAINT pk_countries PRIMARY KEY (Countries);

CREATE TABLE  world_gdp_data (
    "pop" NUMERIC(10, 3),
    "id" INT,
    "imfGDP" BIGINT,
    "unGDP" BIGINT,
    "country" TEXT,
    "gdpPerCapita" NUMERIC(13, 7),
    "continent" TEXT,
    "rank" INT
);

ALTER TABLE world_gdp_data
RENAME COLUMN country TO countries;

CREATE TABLE countries_cordinates (
    "Country" TEXT,
    "Latitude" NUMERIC(8, 6),
    "Longitude" NUMERIC(9, 6),
    "A2_ISO" TEXT
);

ALTER TABLE countries_cordinates
RENAME COLUMN "Country" TO "countries";



SELECT
    cwc.countries,
    countries_cordinates."Latitude",
    countries_cordinates."Longitude",
    cwc.pop2023,
    Crypto_Ownership."Number_of_Crypto_Ownership", 
    world_gdp_data."gdpPerCapita"  
FROM
    crypto_world_countries AS cwc
LEFT JOIN
    Crypto_Ownership ON cwc.countries = Crypto_Ownership."Countries"
LEFT JOIN
    world_gdp_data ON cwc.countries = world_gdp_data.countries
LEFT JOIN
    countries_cordinates ON cwc.countries = countries_cordinates.countries
WHERE
    Crypto_Ownership."Number_of_Crypto_Ownership" IS NOT NULL;

CREATE TABLE "Stock_Market_Capital" (
    "countries" TEXT,
    "Total_market_cap_in_mil_US" INT,
    "Total_market_cap_of_GDP" NUMERIC(5, 1),
    "Number_of_domestic_companies_listed" TEXT
);

SELECT
    wgd.countries,
    countries_cordinates."Latitude",
    countries_cordinates."Longitude",
    wgd."imfGDP",
    wgd."gdpPerCapita", 
	"Stock_Market_Capital"."Total_market_cap_of_GDP",
	"Stock_Market_Capital"."Number_of_domestic_companies_listed"
FROM
     world_gdp_data AS wgd
LEFT JOIN
    "Stock_Market_Capital" ON wgd.countries = "Stock_Market_Capital".countries
LEFT JOIN
    countries_cordinates ON wgd.countries = countries_cordinates.countries
  
WHERE
"Stock_Market_Capital"."Total_market_cap_of_GDP" IS NOT NULL;	


	
	

















































