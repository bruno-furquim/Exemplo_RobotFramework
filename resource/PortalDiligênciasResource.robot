*** Settings ***
Library     Selenium2Library
Library     String
Library     DateTime
Library     FakerLibrary  locale=pt_BR
Resource    C:
Resource    C:
Resource    C:

*** Keywords ***

###Abertura e login na tela inicial do Portal
Entrar no portal
      Open Browser      ${URL}           ${BROWSER}
      Maximize Browser Window
      Input Text        ${LOC_LOGIN}     ${LOGIN}
      Input Password    ${LOC_SENHA}     ${SENHA}
      Click Button      ${BTN_ENTRAR}

###Aguardar o loading desaparecer da tela - Existem vários loadings
Aguardar loading
      Wait Until Element Is Visible        ${LOADING}  60s
      Wait Until Element Is Not Visible    ${LOADING}  60s

Dado que será necessário criar uma "Nova solicitação"
      Aguardar loading
      Click Element                        ${BTN_NOVASOLICITACAO}

###Criar uma nova Solicitação + Preenche todos os campos
Quando clicar em "Nova solicitação" e preencher os campos obrigatórios
      ${PROCESSO}=          FakerLibrary.CNPJ
      ${CCONTROLECLIENTE}=  Random Number   6
      ${VARALOCAL}=         City
      ${PARTEINTERESSADA}=  Name
      ${PARTECONTRARIA}=    Name
      ${OBSERVACAO}=        Text            500
      ${PREPOSTO}=          Name

      Wait Until Element Is Visible
      ...                 ${MODAL_NOVASOLICITACAO}            10s
      Input Text          ${NUMERO_PROCESSO}                  ${PROCESSO}
      Input Text          ${NUMERO_CONTROLECLI}               ${CCONTROLECLIENTE}
      #Click Button        xpath://button[@id='btnFecharPesquisaServico']
      Click Element       ${UF_SOLICITACAO}
      Wait Until Element Is Visible
      ...                 ${AUTOCOMPLETE_CIDADE_SOLICITACAO}
      Click Element       ${AUTOCOMPLETE_CIDADE}
      Click Element       ${CIDADE_SOLICITACAO}
      Input Text          ${VARA_SOLICITACAO}                 ${VARALOCAL}
      Click Element       ${PROCESSOVITUAL_SOLICITACAO}
      Get Text            ${PARTEINTERESSADA_SOLICITACAO}
      Input Text          ${PARTECONTRARIA_SOLICITACAO}       ${PARTECONTRARIA}
      Click Element       ${PROCESSOSUPERESCIAL_SOLICITACAO}
      Clear Element Text  ${DATALIMITE_SOLICITACAO}
      InputData
      Click Element       ${COMBO_TIPOSOLICITACAO}
      Click Element       ${TIPOSOLICITACAO}
      Wait Until Element Is Enabled
      ...                 ${COMBO_SUBTIPO_SOLICITACAO}  5s
      Click Element       ${COMBO_SUBTIPO_SOLICITACAO}
      Wait Until Element Is Enabled
      ...                 ${WAIT2_SUBTIPO_SOLICITACAO}  5s
      Click Element       ${SUBTIPOSOLICITACAO}
      Wait Until Element Is Enabled
      ...                 ${HORA_SOLICITACAO}           2s
      InsereHora
      Input Text          ${OBSERVACAO_SOLICITACAO}     ${OBSERVACAO}
      Wait Until Page Contains Element
      ...                 ${TXT_VALORESTIMADO}          10s
      ${VALORESTIMADO}=       Get Text              ${TXT_TXTVALORESTIMADO}
      Set Global Variable
      ...                 ${V.ESTIMADO}               ${VALORESTIMADO}
      ${NUMEROVALORESTIMADO}=         Remove String         ${V.ESTIMADO}           Valor estimado solicitação:
      Log To Console      ${NUMEROVALORESTIMADO}
      Click Element       ${TIPOPREPOSTO}
      Click Element       ${ACORDO_SOLICITACAO}
      #Input Text           xpath://input[@id='strLinkTj']     ${LINKTJ}
      Input Text          ${PREPOSTO_SOLICITACAO}       ${PREPOSTO}
      Click Element       ${COMBO_TIPOPREPOSTO}
      Click Element       ${TIPOPREPOSTO_SOLICITACAO}
      Click Element       ${ACORDO_SOLICITACAO}
      Click Element       ${COMBO_PROPOSTADEACORDO}
      Click Button        ${BTN_ENVIARSOLICITACAO}
      Handle Alert        action=ACCEPT
      Wait Until Element Is Visible
      ...                 ${LOADING_SOLICITACAO}
      Aguardar loading
      Wait Until Element Is Not Visible
      ...                 ${MSG_SOLICITACAOSALVA}       15s


Então será criada uma nova solicitação
      ${SOLICITACAO}=       Get Text              ${NUMERO_SOLICITACAO}
      Set Global Variable
      ...                 ${SOLICT}               ${SOLICITACAO}
      ${NEWSOLICT}=         Remove String         ${SOLICT}           Consulta Solicitação -
      Set Global Variable
      ...                 ${NUMEROSOLICITACAO}    ${NEWSOLICT}
      Log To Console      ${NUMEROSOLICITACAO}
      Click Element       ${BTN_FECHARSOLICITACAO}
      Wait Until Element Is Not Visible
      ...                 ${BTN_FECHARSOLICITACAO}

##Caso de teste 02
##InsereDoc - Selecione uma solicitação do tipo Audiência -
Dado que a solicitação foi criada corretamente
      Wait Until Element Is Not Visible     ${MODAL_NOVASOLICITACAO}           10s
      Page Should Contain                   ${TXT_TELAHOME}
      Page Should Contain Button            ${BTN_PESQUISARSOLICITACAO}
      Input Text                            ${BUSCA_PESQUISARSOLICITACAO}      ${NUMEROSOLICITACAO}
      Wait Until Page Contains              ${NUMEROSOLICITACAO}
      Execute Javascript                    document.getElementById('btnPesquisar').click();
      Aguardar loading
      SelecionaSolicitação

Quando acessar a aba documentos
      Aguardar loading
      Click Element                   ${BTN_ABADOCUMENTOS}
      Page Should Contain             ${TXT_TELADOCUMENTOS01}
      Page Should Contain             ${TXT_TELADOCUMENTOS02}
      Page Should Contain             ${TXT_TELADOCUMENTOS03}
      #Page Should Contain Button      ${BTN_ADDARQUIVO}

Então deverá ser possível inserir documentos
      ${DOCUMENTOS}   Capture Page Screenshot
      Choose File     ${BTN_ESCOLHERARQUIVO}    ${DOCUMENTOS}
      #Choose File    xpath://input[@id='arquivo']    C:/Automação de Testes/PortalDiligências/${DOCS}
      Click Button    ${BTN_ADDARQUIVO}
      Handle Alert    action=ACCEPT
      Wait Until Page Contains                  ${MSG_ARQADD}

E remover documentos
      Wait Until Element Is Enabled       ${BTN_EXCLUIRARQUIVO}  3s
      Click Element                       ${BTN_EXCLUIRARQUIVO}
      Handle Alert                        action=ACCEPT
      Wait Until Page Contains            ${MSG_ARQEXCLUIDO}
      Wait Until Page Does Not Contain    ${MSG_ARQEXCLUIDO}     10s

##Caso de teste 03
Dado que será necessário acessar a aba Follow-up
      Wait Until Element Is Not Visible    ${MSG_ARQEXCLUIDO}  10s
      Wait Until Element Is Not Visible    ${MSG_ARQEXCLUIDO}  10s
      Click Element                        ${CMB_ABAFOLLOWUP}
      Page Should Contain                  ${TXT_TELAFOLLOWUP01}
      Page Should Contain                  ${TXT_TELAFOLLOWUP02}
      Page Should Contain Button           ${BTN_ENVIARFOLLOWUP}

Quando selecionar o Follow-up do tipo Anexo de documentos / Arquivos
      Click Element                    ${CMB_ABAFOLLOWUP}
      Wait Until Element Is Visible    xpath://option[contains(text(),'ANEXO DE DOCUMENTOS / ARQUIVOS')]
      Click Element                    xpath://option[contains(text(),'ANEXO DE DOCUMENTOS / ARQUIVOS')]

E inserir a Observação
      ${OBSERVACAO}=        Text                      500
      Input Text            ${OBSERVACAO_FOLLOWUP}    ${OBSERVACAO}

Então ao enviar o follow-up o sistema deverá exibir a mensagem "${MSG_FOLLOWUPARQUIVOS}"
      Page Should Contain Button        ${BTN_ENVIARFOLLOWUP}
      Click Button                      ${BTN_ENVIARFOLLOWUP}
      Handle Alert                      action=ACCEPT
      Wait Until Page Contains          ${MSG_FOLLOWUPARQUIVOS}  10s
      Wait Until Page Does Not Contain  ${MSG_FOLLOWUPARQUIVOS}  10s

##Caso de teste 04
Dado que esteja na tela de documentos
      Click Element                 ${BTN_ABADOCUMENTOS}
      Então deverá ser possível inserir documentos
      Page Should Contain           ${TXT_TELADOCUMENTOS01}
      Page Should Contain           ${TXT_TELADOCUMENTOS02}
      Page Should Contain           ${TXT_TELADOCUMENTOS03}
      Page Should Contain           ${TXT_TELADOCUMENTOS04}
      Page Should Contain Button    ${BTN_ADDARQUIVO}


Quando responder todas as perguntas com "Não - Não - Não"
      Click Element                 ${BTN_DOCUMENTOS_PGT01_NAO}
      Click Element                 ${BTN_DOCUMENTOS_PGT02_NAO}
      Click Element                 ${BTN_DOCUMENTOS_PGT03_NAO}

Então o botão "Enviar" deverá estar desabilitado - Sem ação
      Page Should Not Contain       ${MSG_RESPOSTASSALVAS}
      Page Should Contain Button    ${BTN_ENVIARPERGUNTAS}

##Caso de teste 05
Quando responder todas as perguntas com "Não - Não - Sim"
      # #Remover documento
      # Wait Until Page Contains            Arquivo(s) excluido(s)!  10s
      # Wait Until Page Does Not Contain    Arquivo(s) excluido(s)!  10s
      Click Element                ${BTN_DOCUMENTOS_PGT01_NAO}
      Click Element                ${BTN_DOCUMENTOS_PGT02_NAO}
      Click Element                ${BTN_DOCUMENTOS_PGT03_SIM}

Então o botão "Enviar" deverá estar habilitado - Mensagem de alerta para documentos
      Click Button                        ${BTN_ENVIARPERGUNTAS}
      Wait Until Page Contains            ${TXT_INSEREDOCUMENTOS}   10s
      Wait Until Page Does Not Contain    ${TXT_INSEREDOCUMENTOS}   10s

##Caso de teste 06
Quando responder todas as perguntas com "Não - Sim - Sim"
      Click Element               ${BTN_DOCUMENTOS_PGT01_NAO}
      Click Element               ${BTN_DOCUMENTOS_PGT02_SIM}
      Click Element               ${BTN_DOCUMENTOS_PGT03_SIM}
      #Wait Until Page Contains    ${TXT_INSEREDOCUMENTOS}
      Então o botão "Enviar" deverá estar habilitado - Mensagem de alerta para documentos

Então o botão "Enviar" deverá estar habilitado - Mensagem de sucesso (Não - Sim - Sim)
      SelecionaCheck
      Click Button                       ${BTN_ENVIARPERGUNTAS}
      Wait Until Page Contains           ${MSG_RESPOSTASSALVAS}  10s
      Wait Until Page Does Not Contain   ${MSG_RESPOSTASSALVAS}  10s

##Caso de teste 07
Quando responder todas as perguntas com "Sim - Sim - Sim"
      Click Element                  ${BTN_DOCUMENTOS_PGT01_SIM}
      Wait Until Element Contains    ${BTN_DOCUMENTOS_PGT01_SIM}  Sim
      Wait Until Element Contains    ${BTN_DOCUMENTOS_PGT02_SIM}  Sim
      Wait Until Element Contains    ${BTN_DOCUMENTOS_PGT03_SIM}  Sim
      SelecionaCheck

Então o botão "Enviar" deverá estar habilitado - Mensagem de Sucesso (Sim - Sim - Sim)
      Page Should Contain Button         ${BTN_ENVIARPERGUNTAS}
      Click Button                       ${BTN_ENVIARPERGUNTAS}
      Wait Until Page Contains           ${MSG_RESPOSTASSALVAS}  10s
      Wait Until Page Does Not Contain   ${MSG_RESPOSTASSALVAS}  10s
      E remover documentos
      E remover documentos
      E remover documentos

Quando estiver na tela de follow-up
      Click Element                      ${CMB_ABAFOLLOWUP}
      Wait Until Element Is Visible      xpath://option[contains(text(),'ANEXO DE DOCUMENTOS / ARQUIVOS')]
      Click Element                      xpath://option[contains(text(),'ANEXO DE DOCUMENTOS / ARQUIVOS')]
      Clear Element Text                 ${OBSERVACAO_FOLLOWUP}
      Click Element                      ${BTN_ENVIARFOLLOWUP}
      Page Should Contain                ${TXT_CAMPOVAZIO}
      #Inserir observação do follow-up

Então o follow-up de anexo de documentos deverá ser enviado
      E inserir a Observação
      Click Element                       ${BTN_ENVIARFOLLOWUP}
      Handle Alert                        action=ACCEPT
      Aguardar loading
      Wait Until Page Contains            ${MSG_SUCESSOFOLLOWUP}  10s
      Wait Until Page Does Not Contain    ${MSG_SUCESSOFOLLOWUP}  10s
      Click Element                       ${BTN_FECHARSOLICITACAO}
      Clear Element Text                  ${BUSCA_PESQUISARSOLICITACAO}

      # Click Element                  xpath://li[@id='btnTab3']
      # Wait Until Page Contains       Documento
      # Wait Until Page Contains       Acessar as solicitações que estão Em andamento
      # Wait Until Element Contains    xpath://span[contains(text(),'Salvar Como PDF')]       Salvar Como PDF
      # Wait Until Element Contains    xpath://span[contains(text(),'Excluir Arquivo(s)')]    Excluir Arquivo(s)



##### Refazer - Novo caso de teste para incluir documentos e responder as perguntas.


  # Wait Until Element Is Enabled       xpath://span[@id='closeSolicitacao']
  # Click Element                       xpath://span[@id='closeSolicitacao']

###Verifica se as solicitações estão sendo acessadas
# Acessar as solicitações que estão Em andamento
#   Aguardar loading
#   Click Element    xpath://a[@class='Andamento']
#
# Confirmar acesso na página "Em andamento"
#   Wait Until Page Contains    Número Processo
#   Wait Until Page Contains    Tipo Solicitação
#
# Abrir uma solicitação e confirmar dados
#   Aguardar loading
#   SelecionaSolicitação
#   Aguardar loading
#   Wait Until Page Contains    Consulta Solicitação -
#   Wait Until Page Contains    EM ANDAMENTO
#   Wait Until Page Contains    Solicitação criada por
#   Click Element               xpath: //span[@id='closeSolicitacao']
#
#   Click Element                  xpath://li[@id='btnTab3']
#   Wait Until Page Contains       Documento
#   Wait Until Page Contains       Acessar as solicitações que estão Em andamento
#   Wait Until Element Contains    xpath://span[contains(text(),'Salvar Como PDF')]       Salvar Como PDF
#   Wait Until Element Contains    xpath://span[contains(text(),'Excluir Arquivo(s)')]    Excluir Arquivo(s)
#
#   Click Element                 xpath://li[@id='btnTab4']
#   Wait Until Page Contains      Tipo de Follow-up
#   Wait Until Page Contains      Observação
#   Wait Until Page Contains      Tipo
#   Wait Until Element Contains   xpath://button[@id='btnAddFollowUp']  Enviar Follow-up
#   Click Element                 xpath: //span[@id='closeSolicitacao']

# Demais status de solicitação
#   Set Selenium Speed    1s
#   Click Element               xpath://span[@id='qtdeQuestionamento']
#   Wait Until Page Contains    Número Processo
#   Wait Until Page Contains    Tipo Solicitação
#   SelecionaSolicitação
#   Wait Until Page Contains    Consulta Solicitação -
#   Wait Until Page Contains    Data
#   Wait Until Page Contains    Tipo
#   Wait Until Element Contains    xpath://button[@id='btnAddFollowUp']  Enviar Follow-up
#   Click Element                  xpath: //span[@id='closeSolicitacao']


Sair do portal
  Close Browser
