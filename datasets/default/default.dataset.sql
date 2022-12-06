BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id INTEGER NOT NULL, 
	"Description" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"Phone" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "ContentAsset" (
	id INTEGER NOT NULL, 
	"MasterLabel" VARCHAR(255), 
	"DeveloperName" VARCHAR(255), 
	"IsVisibleByExternalUsers" VARCHAR(255), 
	PRIMARY KEY (id)
);
COMMIT;
