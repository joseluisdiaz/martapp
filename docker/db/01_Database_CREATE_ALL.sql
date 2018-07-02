-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/p6TVDVvedUyaq3Aocj0Rnw
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE DATABASE "marta";


DROP TABLE IF EXISTS "Players", "Federations", "Decks", "Tournaments", "Matches", "Seasons", "SeasonsPlayers", "SeasonsFederations";


CREATE TABLE "Players" (
    "PlayerID" int   NOT NULL,
    "Name" varchar(255)   NOT NULL,
    "StartYear" date   NOT NULL,
    "FederationID" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "PlayerID"
     )
);

CREATE TABLE "Federations" (
    "FederationID" int   NOT NULL,
    "Name" varchar(255)   NOT NULL,
    "CreatedDate" date   NOT NULL,
    "Description" varchar(255)   NULL,
    CONSTRAINT "pk_Federations" PRIMARY KEY (
        "FederationID"
     )
);

CREATE TABLE "Decks" (
    "DeckID" int   NOT NULL,
    "Name" varchar(255)   NOT NULL,
    "ColorComposition" varchar(25)   NOT NULL,
    CONSTRAINT "pk_Decks" PRIMARY KEY (
        "DeckID"
     ),
    CONSTRAINT "uc_Decks_Name" UNIQUE (
        "Name"
    ),
    CONSTRAINT "uc_Decks_ColorComposition" UNIQUE (
        "ColorComposition"
    )
);

CREATE TABLE "Tournaments" (
    "TournamentID" int   NOT NULL,
    "SeasonID" int   NOT NULL,
    "TournamentType" varchar(255)  DEFAULT 'Normal' NOT NULL,
    "HostedPlace" varchar(255)   NULL,
    "HostedDate" date   NOT NULL,
    "Description" varchar(255)   NULL,
    "Official" bool   NOT NULL,
    "Ended" bool  DEFAULT false NOT NULL,
    "WinnerPlayerID" int   NULL,
    CONSTRAINT "pk_Tournaments" PRIMARY KEY (
        "TournamentID"
     )
);

CREATE TABLE "Matches" (
    "MatchID" int   NOT NULL,
    "PlayerHomeID" int   NOT NULL,
    "PlayerHomeDeckID" int   NOT NULL,
    "PlayerHomeScore" int  DEFAULT 0 NOT NULL,
    "PlayerVisitorID" int   NOT NULL,
    "PlayerVisitorDeckID" int   NOT NULL,
    "PlayerVisitorScore" int  DEFAULT 0 NOT NULL,
    "IsFinalMatch" bool  DEFAULT false NOT NULL,
    "SeasonID" int   NOT NULL,
    "TournamentID" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "MatchID"
     )
);

CREATE TABLE "Seasons" (
    "SeasonID" int   NOT NULL,
    "StartDate" date   NOT NULL,
    "EndDate" date   NULL,
    "Ended" bool  DEFAULT false NOT NULL,
    "Name" varchar(255)  DEFAULT 'Season XX' NOT NULL,
    CONSTRAINT "pk_Seasons" PRIMARY KEY (
        "SeasonID"
     )
);

CREATE TABLE "SeasonsPlayers" (
    "SeasonPlayerID" int   NOT NULL,
    "SeasonID" int   NOT NULL,
    "PlayerID" int   NOT NULL,
    "PlayerScore" int  DEFAULT 0 NOT NULL,
    CONSTRAINT "pk_SeasonsPlayers" PRIMARY KEY (
        "SeasonPlayerID"
     )
);

CREATE TABLE "SeasonsFederations" (
    "SeasonFederationID" int   NOT NULL,
    "SeasonID" int   NOT NULL,
    "FederationID" int   NOT NULL,
    "FederationScore" int  DEFAULT 0 NOT NULL,
    CONSTRAINT "pk_SeasonsFederations" PRIMARY KEY (
        "SeasonFederationID"
     )
);

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_FederationID" FOREIGN KEY("FederationID")
REFERENCES "Federations" ("FederationID");

ALTER TABLE "Tournaments" ADD CONSTRAINT "fk_Tournaments_SeasonID" FOREIGN KEY("SeasonID")
REFERENCES "Seasons" ("SeasonID");

ALTER TABLE "Tournaments" ADD CONSTRAINT "fk_Tournaments_WinnerPlayerID" FOREIGN KEY("WinnerPlayerID")
REFERENCES "Players" ("PlayerID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_PlayerHomeID" FOREIGN KEY("PlayerHomeID")
REFERENCES "Players" ("PlayerID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_PlayerHomeDeckID" FOREIGN KEY("PlayerHomeDeckID")
REFERENCES "Decks" ("DeckID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_PlayerVisitorID" FOREIGN KEY("PlayerVisitorID")
REFERENCES "Players" ("PlayerID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_PlayerVisitorDeckID" FOREIGN KEY("PlayerVisitorDeckID")
REFERENCES "Decks" ("DeckID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_SeasonID" FOREIGN KEY("SeasonID")
REFERENCES "Seasons" ("SeasonID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_TournamentID" FOREIGN KEY("TournamentID")
REFERENCES "Tournaments" ("TournamentID");

ALTER TABLE "SeasonsPlayers" ADD CONSTRAINT "fk_SeasonsPlayers_SeasonID" FOREIGN KEY("SeasonID")
REFERENCES "Seasons" ("SeasonID");

ALTER TABLE "SeasonsPlayers" ADD CONSTRAINT "fk_SeasonsPlayers_PlayerID" FOREIGN KEY("PlayerID")
REFERENCES "Players" ("PlayerID");

ALTER TABLE "SeasonsFederations" ADD CONSTRAINT "fk_SeasonsFederations_SeasonID" FOREIGN KEY("SeasonID")
REFERENCES "Seasons" ("SeasonID");

ALTER TABLE "SeasonsFederations" ADD CONSTRAINT "fk_SeasonsFederations_FederationID" FOREIGN KEY("FederationID")
REFERENCES "Federations" ("FederationID");

