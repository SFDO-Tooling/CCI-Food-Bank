BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account" VALUES('Account-1','Acme');
INSERT INTO "Account" VALUES('Account-2','salesforce.com');
INSERT INTO "Account" VALUES('Account-3','Global Media');
INSERT INTO "Account" VALUES('Account-4','test account');
COMMIT;
