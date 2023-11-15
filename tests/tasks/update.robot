*** Settings ***
Documentation    Cenários de teste de atualização de tarefas

Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder marcar uma tarefa como concluída
    
    ${data}    Get fixtures    tasks    done

    Reset user from database    ${data}[user]

    POST user session    ${data}[user]
    POST a new task      ${data}[task]

    Submit login form    ${data}[user]

    Mark taks as completed    ${data}[task][name]

    Task should be complete    ${data}[task][name]