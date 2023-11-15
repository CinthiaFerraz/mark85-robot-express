*** Settings ***
Documentation    Cenários de teste de remoção de tarefas

Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder apagar uma tarefa indesejada
    
    ${data}    Get fixtures    tasks    delete

    Reset user from database    ${data}[user]

    POST user session    ${data}[user]
    POST a new task      ${data}[task]

    Submit login form    ${data}[user]

    Request removal          ${data}[task][name]
    Task should not exist    ${data}[task][name]