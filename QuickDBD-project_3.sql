-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Ryeyie
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


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

