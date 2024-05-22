BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id VARCHAR(255) NOT NULL, 
	"AccountNumber" VARCHAR(255), 
	"AccountSource" VARCHAR(255), 
	"AnnualRevenue" VARCHAR(255), 
	"BillingCity" VARCHAR(255), 
	"BillingCountry" VARCHAR(255), 
	"BillingGeocodeAccuracy" VARCHAR(255), 
	"BillingLatitude" VARCHAR(255), 
	"BillingLongitude" VARCHAR(255), 
	"BillingPostalCode" VARCHAR(255), 
	"BillingState" VARCHAR(255), 
	"BillingStreet" VARCHAR(255), 
	"CleanStatus" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"DunsNumber" VARCHAR(255), 
	"Fax" VARCHAR(255), 
	"Industry" VARCHAR(255), 
	"Jigsaw" VARCHAR(255), 
	"NaicsCode" VARCHAR(255), 
	"NaicsDesc" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"NumberOfEmployees" VARCHAR(255), 
	"Ownership" VARCHAR(255), 
	"Phone" VARCHAR(255), 
	"Rating" VARCHAR(255), 
	"ShippingCity" VARCHAR(255), 
	"ShippingCountry" VARCHAR(255), 
	"ShippingGeocodeAccuracy" VARCHAR(255), 
	"ShippingLatitude" VARCHAR(255), 
	"ShippingLongitude" VARCHAR(255), 
	"ShippingPostalCode" VARCHAR(255), 
	"ShippingState" VARCHAR(255), 
	"ShippingStreet" VARCHAR(255), 
	"Sic" VARCHAR(255), 
	"SicDesc" VARCHAR(255), 
	"Site" VARCHAR(255), 
	"TickerSymbol" VARCHAR(255), 
	"Tradestyle" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"Website" VARCHAR(255), 
	"YearStarted" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Asset" (
	id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "BusinessHours" (
	id VARCHAR(255) NOT NULL, 
	"FridayEndTime" VARCHAR(255), 
	"FridayStartTime" VARCHAR(255), 
	"IsActive" VARCHAR(255), 
	"IsDefault" VARCHAR(255), 
	"MondayEndTime" VARCHAR(255), 
	"MondayStartTime" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"SaturdayEndTime" VARCHAR(255), 
	"SaturdayStartTime" VARCHAR(255), 
	"SundayEndTime" VARCHAR(255), 
	"SundayStartTime" VARCHAR(255), 
	"ThursdayEndTime" VARCHAR(255), 
	"ThursdayStartTime" VARCHAR(255), 
	"TimeZoneSidKey" VARCHAR(255), 
	"TuesdayEndTime" VARCHAR(255), 
	"TuesdayStartTime" VARCHAR(255), 
	"WednesdayEndTime" VARCHAR(255), 
	"WednesdayStartTime" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "ContractLineItem" (
	id VARCHAR(255) NOT NULL, 
	"Quantity" VARCHAR(255), 
	"UnitPrice" VARCHAR(255), 
	"PricebookEntryId" VARCHAR(255), 
	"ServiceContractId" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Entitlement" (
	id VARCHAR(255) NOT NULL, 
	"CasesPerEntitlement" VARCHAR(255), 
	"EndDate" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"IsPerIncident" VARCHAR(255), 
	"RemainingCases" VARCHAR(255), 
	"StartDate" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	"AssetId" VARCHAR(255), 
	"BusinessHoursId" VARCHAR(255), 
	"ContractLineItemId" VARCHAR(255), 
	"ServiceContractId" VARCHAR(255), 
	"SvcApptBookingWindowsId" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "OperatingHours" (
	id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"TimeZone" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Pricebook2" (
	id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "PricebookEntry" (
	id VARCHAR(255) NOT NULL, 
	"UnitPrice" VARCHAR(255), 
	"Pricebook2Id" VARCHAR(255), 
	"Product2Id" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Product2" (
	id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "ServiceContract" (
	id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "WorkBadgeDefinition" (
	id VARCHAR(255) NOT NULL, 
	"IsActive" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"IsCompanyWide" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"ImageUrl" VARCHAR(255), 
	"LimitNumber" VARCHAR(255), 
	"IsLimitPerUser" VARCHAR(255), 
	"LimitStartDate" VARCHAR(255), 
	PRIMARY KEY (id)
);
COMMIT;
