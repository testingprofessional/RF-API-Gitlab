*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Get User Successfully
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com

    ${response}=    GET On Session
    ...    jsonplaceholder
    ...    /users/1
    ...    expected_status=200

    Should Be Equal As Integers    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}[username]    Bret

Get User Email Successfully
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com

    ${response}=    GET On Session
    ...    jsonplaceholder
    ...    /users/1
    ...    expected_status=200

    Should Be Equal As Strings    ${response.json()}[email]    Sincere@april.biz
