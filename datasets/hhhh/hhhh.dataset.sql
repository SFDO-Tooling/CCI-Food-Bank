BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"AccountNumber" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Contact" (
	id INTEGER NOT NULL, 
	"DoNotCall" VARCHAR(255), 
	"HasOptedOutOfEmail" VARCHAR(255), 
	"HasOptedOutOfFax" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Contact" VALUES(1,'False','False','False','bbb','');
COMMIT;
