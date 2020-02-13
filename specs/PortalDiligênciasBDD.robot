*** Settings ***
Resource        C:
Suite Setup     Entrar no portal
Suite Teardown  Sair do portal

*** Test Cases ***

# Caso de teste 00: Login inválido (erro)
#     Dado que acesso o portal (Suite Setup)
#     Quando inserido login e senha inválido
#     Então deverá ser exibida mensagem de erro

Caso de teste 01: Criar Nova Solicitação
    [Tags]  CriarSolicitacao
    Dado que será necessário criar uma "Nova solicitação"
    Quando clicar em "Nova solicitação" e preencher os campos obrigatórios
    Então será criada uma nova solicitação

Caso de teste 02: Inserir documento na Solicitação
    [Tags]  InsereRemoveDoc
    Dado que a solicitação foi criada corretamente
    Quando acessar a aba documentos
    Então deverá ser possível inserir documentos
    E remover documentos

Caso de teste 03: Enviar follow-up sem documento (Anexo de Documentos / Arquivos)
    [Tags]  RespondeFollowUP
    Dado que será necessário acessar a aba Follow-up
    Quando selecionar o Follow-up do tipo Anexo de documentos / Arquivos
    E inserir a Observação
    Então ao enviar o follow-up o sistema deverá exibir a mensagem "Insira arquivos na solicitação antes de gerar o tipo de Follow-up ANEXO DE DOCUMENTOS / ARQUIVOS"

Caso de teste 04: Responder perguntas (Não - Não - Não)
    [Tags]  RespondePerguntas01
    Dado que esteja na tela de documentos
    Quando responder todas as perguntas com "Não - Não - Não"
    Então o botão "Enviar" deverá estar desabilitado - Sem ação

Caso de teste 05: Responder perguntas (Não - Não - Sim)
    [Tags]  RespondePerguntas02
    Dado que esteja na tela de documentos
    Quando responder todas as perguntas com "Não - Não - Sim"
    Então o botão "Enviar" deverá estar habilitado - Mensagem de alerta para documentos

Caso de teste 06: Responder perguntas (Não - Sim - Sim)
    [Tags]  RespondePerguntas03
    Dado que esteja na tela de documentos
    Quando responder todas as perguntas com "Não - Sim - Sim"
    Então o botão "Enviar" deverá estar habilitado - Mensagem de sucesso (Não - Sim - Sim)

Caso de teste 07: Responder perguntas (Sim - Sim - Sim)
    [Tags]  RespondePerguntas04
    Dado que esteja na tela de documentos
    Quando responder todas as perguntas com "Sim - Sim - Sim"
    Então o botão "Enviar" deverá estar habilitado - Mensagem de Sucesso (Sim - Sim - Sim)

Caso de teste 08: Enviar Follow-Up com documento anexado
    [Tags]  EnviaFupDocumento
    Quando estiver na tela de follow-up
    Então o follow-up de anexo de documentos deverá ser enviado

# Caso de teste 03: Procurar solicitações por Status
#     [Tags]  VerificarSolCriadas
#     Dado que esteja na tela de solicitações
#     Quando selecionar as solicitações "Em andamento"
#     Então serão visualizadas as solicitações "Em andamento"
#     E confirmar se outros tipos estão acessíveis
#
# Caso de teste 04: Cancelar Solicitação
#     [Tags]  CancelarSol
#     Dado que esteja necessário conferir as solicitações canceladas
#     Quando acessar as canceladas
#     Então deverão ser exibidas as solicitações
# Caso de teste XX: Verificar se filtros estão funcionando corretamente
#     [Tags]  VerificarFiltros
#     Dado que precise realizar a pesquisa de solicitações
#     Quando preencher os filtros de pesquisa
#     Então será realizada a pesquisa
