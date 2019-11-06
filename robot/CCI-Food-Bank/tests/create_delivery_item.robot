*** Settings ***

Resource        robot/CCI-Food-Bank/resources/FoodBank.resource
Suite Setup     Open Test Browser
Suite Teardown  Delete Records and Close Browser

*** Test Cases ***

Via API
    # Create test values
    ${account_name} =        Generate Random String
    ${description} =         Generate Random String
    ${scheduled_date} =      Get Current Date
    ...                        result_format=datetime

    # Create needed data
    &{account} =             API Create Account  
    ...                        ${account_name}
    &{delivery} =            API Create Delivery
    ...                        scheduled_date=${scheduled_date}
    ...                        status=Scheduled
    ...                        supplier=&{account}[Id]

    # Create delivery via the API
    &{item} =                API Create Delivery Item
    ...                        delivery=&{delivery}[Id]
    ...                        description=${description}
    ...                        storage_requirements=Frozen

    Validate Delivery Item   id=&{item}[Id]
    ...                      delivery=&{delivery}
    ...                      description=${description}
    ...                      storage_requirements=Frozen

Via UI
    # Create test values
    ${account_name} =       Generate Random String
    ${description} =        Generate Random String
    ${scheduled_date} =     Get Current Date
    ...                       result_format=datetime

    # Create needed data
    &{account} =            API Create Account  
    ...                       ${account_name}
    &{delivery} =           API Create Delivery
    ...                       scheduled_date=${scheduled_date}
    ...                       status=Scheduled
    ...                       supplier=&{account}[Id]

    # Create the Delivery in the browser
    Go to page              Home  Delivery_Item__c
    Click Object Button     New
    Wait for modal          New  Delivery Item
    Populate Lookup Field   Delivery  &{delivery}[Name]
    Populate Field          Description  ${description}
    Populate Picklist       Storage Requirements  Refrigerated
    Click Modal Button      Save
    Wait Until Modal Is Closed

    # Set Delivery Item for delete on suite teardown
    ${item_id} =            Get Current Record Id
    Store Session Record    Delivery_Item__c  ${item_id}

    Validate Delivery Item  id=${item_id}
    ...                     delivery=&{delivery}
    ...                     description=${description}
    ...                     storage_requirements=Refrigerated

*** Keywords ***
Validate Delivery Item
    [Arguments]  ${id}  ${delivery}  ${description}  ${storage_requirements}

    # Validate via API
    &{item} =            Salesforce Get  Delivery_Item__c  ${id}
    Should Be Equal      &{item}[Delivery__c]  &{delivery}[Id]
    Should Be Equal      &{item}[Description__c]  ${description}
    Should Be Equal      &{item}[Storage_Requirements__c]  ${storage_requirements}

    # Validate via UI
    Go To Page           Detail  Delivery_Item__c  ${id}
    Page Should Contain  &{delivery}[Name]
    Page Should Contain  ${description}
    Page Should Contain  ${storage_requirements}