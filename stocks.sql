Create table bitcoin(
	Date date Not Null,
	Open float Not Null,
	High float Not Null,
	Low float Not Null,
	Close float Not Null,
	Percent_Change float not Null);

	Select * from bitcoin
	
	Create table ethereum(
	Date date Not Null,
	Open float Not Null,
	High float Not Null,
	Low float Not Null,
	Close float Not Null,
	Percent_Change float Not Null);

	Select * from ethereum
	
	Create table doge(
	Date date Not Null,
	Open float Not Null,
	High float Not Null,
	Low float Not Null,
    Close float Not Null,
	Percent_Change float Not Null);
	Select * from doge
	
	CREATE TABLE "meta" (
    "Date" date   NOT NULL,
    "Open" float   NOT NULL,
    "High" float   NOT NULL,
    "Low" float   NOT NULL,
    "Close" float   NOT NULL,
    "Percent_Change" float   NOT NULL,
    CONSTRAINT "pk_meta" PRIMARY KEY (
        "Date"
     )
);

CREATE TABLE "msft" (
    "Date" date   NOT NULL,
    "Open" float   NOT NULL,
    "High" float   NOT NULL,
    "Low" float   NOT NULL,
    "Close" float   NOT NULL,
    "Percent_Change" float   NOT NULL,
    CONSTRAINT "pk_msft" PRIMARY KEY (
        "Date"
     )
);

CREATE TABLE "goog" (
    "Date" date   NOT NULL,
    "Open" float   NOT NULL,
    "High" float   NOT NULL,
    "Low" float   NOT NULL,
    "Close" float   NOT NULL,
    "Percent_Change" float   NOT NULL,
    CONSTRAINT "pk_goog" PRIMARY KEY (
        "Date"
     )
);

CREATE TABLE "aapl" (
    "Date" date   NOT NULL,
    "Open" float   NOT NULL,
    "High" float   NOT NULL,
    "Low" float   NOT NULL,
    "Close" float   NOT NULL,
    "Percent_Change" float   NOT NULL,
    CONSTRAINT "pk_aapl" PRIMARY KEY (
        "Date"
     )
);

CREATE TABLE "nflx" (
    "Date" date   NOT NULL,
    "Open" float   NOT NULL,
    "High" float   NOT NULL,
    "Low" float   NOT NULL,
    "Close" float   NOT NULL,
    "Percent_Change" float   NOT NULL,
    CONSTRAINT "pk_nflx" PRIMARY KEY (
        "Date"
     )
);

CREATE TABLE "amzn" (
    "Date" date   NOT NULL,
    "Open" float   NOT NULL,
    "High" float   NOT NULL,
    "Low" float   NOT NULL,
    "Close" float   NOT NULL,
    "Percent_Change" float   NOT NULL,
    CONSTRAINT "pk_amzn" PRIMARY KEY (
        "Date"
     )
);
--------------------------------------------

--Data Cleaning for the mapping section


CREATE TABLE countries_coordinates (
    "Countries" TEXT Primary Key NOT NULL,
    "Latitude" NUMERIC(8, 6),
    "Longitude" NUMERIC(9, 6),
    "A2_ISO" TEXT
);

CREATE TABLE  "Crypto_World_Countries" (
    "ID" INT Primary Key Not null,
    "place" INT,
    "pop2023" INT NOT NULL,
    "growthRate" NUMERIC(6, 5) NOT NULL,
    "area" NUMERIC(9, 1),
    "countries" TEXT NOT NULL,
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
    FOREIGN KEY ("countries") REFERENCES countries_coordinates ("Countries")
);



CREATE TABLE Crypto_Ownership (
    "ID" INT Primary Key Not null,
	"Countries" TEXT NOT NULL,
    "Number_of_Crypto_Ownership" INT,
    FOREIGN KEY ("Countries") REFERENCES countries_coordinates ("Countries")
);



CREATE TABLE  "world_gdp_data" (
    "id" INT PRIMARY KEY NOT NULL,
    "pop" NUMERIC(10, 3),
    "id_pop" INT,
    "imfGDP" NUMERIC(20, 6),
    "unGDP" NUMERIC(20, 6),
    "countries" TEXT,
    "gdpPerCapita" NUMERIC(13, 7),
    "continent" TEXT,
    "rank" INT,
	FOREIGN KEY ("countries") REFERENCES countries_coordinates ("Countries")
);

CREATE TABLE "Stock_Market_Capital" (
    "ID" INT Primary Key Not null,
    "countries" TEXT not null,
    "Total_market_cap_in_mil_US" INT not null,
    "Total_market_cap_of_GDP" NUMERIC(5, 1) not null,
    "Number_of_domestic_companies_listed" TEXT not null,
    FOREIGN KEY ("countries") REFERENCES countries_coordinates ("Countries")
);


SELECT
    cwc.countries,
    countries_coordinates."Latitude",
    countries_coordinates."Longitude",
    cwc.pop2023,
    Crypto_Ownership."Number_of_Crypto_Ownership", 
    world_gdp_data."gdpPerCapita"  
FROM
    "Crypto_World_Countries" AS cwc
LEFT JOIN
    Crypto_Ownership ON cwc.countries = Crypto_Ownership."Countries"
LEFT JOIN
    world_gdp_data ON cwc.countries = world_gdp_data.countries
LEFT JOIN
    countries_coordinates ON cwc.countries = countries_coordinates."Countries"
WHERE
    Crypto_Ownership."Number_of_Crypto_Ownership" IS NOT NULL;


	
-----------------
SELECT
    cc."Countries",
    cc."Latitude",
    cc."Longitude",
    "world_gdp_data"."imfGDP",
    "world_gdp_data"."gdpPerCapita", 
    "Stock_Market_Capital"."Total_market_cap_of_GDP",
    "Stock_Market_Capital"."Number_of_domestic_companies_listed"
FROM
    countries_coordinates AS cc
LEFT JOIN
    "Stock_Market_Capital" ON cc."Countries" = "Stock_Market_Capital"."countries"
LEFT JOIN
    "world_gdp_data" ON cc."Countries" = "world_gdp_data"."countries"
WHERE
    "Stock_Market_Capital"."Total_market_cap_of_GDP" IS NOT NULL;

	
