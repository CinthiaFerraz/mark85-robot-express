*** Settings ***
Documentation    Cenários de cadastro de tarefas

Resource    ../../resources/base.resource
Resource    ../../resources/Services.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    ${data}    Get fixtures    tasks    create
    
    Reset user from database    ${data}[user]
    
    Submit login form    ${data}[user]

    Go to task form
    Submit task form    ${data}[task]
    Task should be registered    ${data}[task][name]


# Não deve cadastrar tarefa com nome duplicado
#     [Tags]    dup
#     ${data}    Get fixtures    tasks    duplicate

#     Reset user from database    ${data}[user]

#     Create a new task from API    ${data}
    
#     Submit login form    ${data}[user]

#     Go to task form
#     Submit task form    ${data}[task]

#     Go to task form
#     Submit task form    ${data}[task]

#     Notice should be    Oops! Tarefa duplicada.
