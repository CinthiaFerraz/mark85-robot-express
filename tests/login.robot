*** Settings ***
Documentation    Cenários de autenticação do usuário

Library    Collections
Resource    ../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder logar com um usuário pré-cadastrado

    ${user}        Create Dictionary
    ...            name=Cinthia Ferraz
    ...            email=cinthia@hotmail.com
    ...            password=teste10

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Submit login form    ${user}
    #User should be logged in    ${user}[name]

Não deve logar com senha inválida
    [Tags]    invalid
    ${user}        Create Dictionary
    ...            name=Cinthia Ferraz
    ...            email=cinthia@hotmail.com
    ...            password=teste10

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Set To Dictionary    ${user}    password=123456

    Submit login form    ${user}
    Notice should be    Ocorreu um erro ao fazer login, verifique suas credenciais.