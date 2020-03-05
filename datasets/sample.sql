BEGIN TRANSACTION;
CREATE TABLE "Account" (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	parent_id VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Account" VALUES('0010R00000xUlPOQA0','A Local Farm','');
CREATE TABLE "Delivery_Item__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Description__c" VARCHAR(255), 
	"Storage_Requirements__c" VARCHAR(255), 
	delivery__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Delivery_Item__c" VALUES('a000R000002tUxRQAU','Pumpkins','','a010R000007znK1QAI');
INSERT INTO "Delivery_Item__c" VALUES('a000R000002tUxSQAU','Frozen Peas','Frozen','a010R000007znK1QAI');
CREATE TABLE "Delivery__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Scheduled_Date__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	supplier__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Delivery__c" VALUES('a010R000007znK1QAI','2019-11-15','Scheduled','0010R00000xUlPOQA0');
COMMIT;
