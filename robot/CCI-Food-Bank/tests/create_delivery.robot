*** Settings ***

Resource        robot/CCI-Food-Bank/resources/FoodBank.resource
Suite Setup     Open Test Browser
Suite Teardown  Delete Records and Close Browser

*** Test Cases ***

Via API
    # Create test values
    ${account_name} =    Generate Random String
    ${scheduled_date} =  Get Current Date
    ...                    result_format=datetime
    ...                    increment=1 day

    # Create needed data
    &{account} =         API Create Account  
    ...                    ${account_name}

    # Create delivery via the API
    &{delivery} =        API Create Delivery
    ...                    status=Scheduled
    ...                    supplier=&{account}[Id]

    Validate Delivery    id=&{delivery}[Id]
    ...                  status=Scheduled
    ...                  supplier=${account_name}

Via UI
    # Create test values
    ${account_name} =      Generate Random String

    # Create needed data
    API Create Account     ${account_name}

    # Create the Delivery in the browser
    Go to page             Home  Delivery__c
    Click Object Button    New
    Wait for modal         New  Delivery
    Populate Lookup Field  Supplier  ${account_name}
    Populate Picklist      Status  Scheduled
    Click Modal Button     Save
    Wait Until Modal Is Closed

    # Set Delivery for delete on suite teardown
    ${delivery_id} =       Get Current Record Id
    Store Session Record   Delivery__c  ${delivery_id}

    Validate Delivery      id=${delivery_id}
    ...                    status=Scheduled
    ...                    supplier=${account_name}

*** Keywords ***
Validate Delivery
    [Arguments]  ${id}  ${status}  ${supplier}

    # Validate via API
    &{delivery} =        Salesforce Get  Delivery__c  ${id}
    &{account} =         Salesforce Get  Account  &{delivery}[Supplier__c]
    Should Be Equal      &{delivery}[Status__c]  ${status}
    Should Be Equal      &{account}[Name]  ${supplier}

    # Validate via UI
    Go To Page           Detail  Delivery__c  ${id}
    Page Should Contain  ${status}
    Page Should Contain  ${supplier}