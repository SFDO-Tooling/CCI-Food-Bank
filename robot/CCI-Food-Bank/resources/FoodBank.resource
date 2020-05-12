*** Settings ***

Resource  cumulusci/robotframework/Salesforce.robot
Library   cumulusci.robotframework.PageObjects
Library   robot/CCI-Food-Bank/resources/pageobjects/Delivery.py
Library   robot/CCI-Food-Bank/resources/pageobjects/DeliveryItem.py
Library   DateTime

*** Keywords ***

API Create Account
    [Arguments]  ${name}
    ${account_id} =  Salesforce Insert  Account
    ...                Name=${name}
    &{account} =     Salesforce Get  Account  ${account_id}
    [return]  &{account}

API Create Delivery
    [Arguments]       ${status}  ${supplier}
    ${delivery_id} =  Salesforce Insert  Delivery__c
    ...                 Status__c=${status}
    ...                 Supplier__c=${supplier}
    &{delivery} =     Salesforce Get  Delivery__c  ${delivery_id}
    [return]          &{delivery}

API Create Delivery Item
    [Arguments]   ${delivery}  ${description}  ${storage_requirements}
    ${item_id} =  Salesforce Insert  Delivery_Item__c
    ...             Delivery__c=${delivery}
    ...             Description__c=${description}
    ...             Storage_Requirements__c=${storage_requirements}
    &{item} =     Salesforce Get  Delivery_Item__c  ${item_id}
    [return]      &{item}