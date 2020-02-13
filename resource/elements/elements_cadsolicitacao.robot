*** Variables ***

#LOCATORS TELA DE NOVA SOLICITACAO
${MODAL_NOVASOLICITACAO}              xpath://div[@id='solicitacao']//div[@class='modal-content']
${NUMERO_PROCESSO}                    xpath://input[@id='cadNumeroProcesso']
${NUMERO_CONTROLECLI}                 xpath://input[@id='cadControleCliente']
${UF_SOLICITACAO}                     xpath://select[@id='cadUF']//option[contains(text(),'SP')]
${AUTOCOMPLETE_CIDADE_SOLICITACAO}    xpath://div[@id='autocompleteCidade_chosen']//a[@class='chosen-single']
${AUTOCOMPLETE_CIDADE}                xpath://div[@id='autocompleteCidade_chosen']
${CIDADE_SOLICITACAO}                 xpath://li[contains(text(),'BAURU')]
${VARA_SOLICITACAO}                   xpath://input[@id='cadVara']
${PROCESSOVITUAL_SOLICITACAO}         xpath://select[@id='cmbProcessoVirtual']//option[contains(text(),'NÃO')]
${PARTEINTERESSADA_SOLICITACAO}       xpath://input[@id='cadParteInteressada']
${PARTECONTRARIA_SOLICITACAO}         xpath://input[@id='cadParteContraria']
${PROCESSOSUPERESCIAL_SOLICITACAO}    xpath://select[@id='cmbProcessoSuperespecial']//option[contains(text(),'SIM')]
${COMBO_TIPOSOLICITACAO}              xpath://div[@id='comboTiposSolicitacao_chosen']
${TIPOSOLICITACAO}                    xpath://div[@id='iTipo']//li[3]
${WAIT_SUBTIPO_SOLICITACAO}           xpath://div[@id='iSubTipo']
${WAIT2_SUBTIPO_SOLICITACAO}          xpath://select[@id='comboSubTiposSolicitacao']
${COMBO_SUBTIPO_SOLICITACAO}          xpath://div[@id='comboSubTiposSolicitacao_chosen']
${SUBTIPOSOLICITACAO}                 xpath://li[contains(text(),'INICIAL')]
${DATALIMITE_SOLICITACAO}             xpath://input[@id='dataLimite']
${HORA_SOLICITACAO}                   xpath://input[@id='tHora']
${OBSERVACAO_SOLICITACAO}             xpath://textarea[@id='Obs']
${COMBO_TIPOPREPOSTO}                 xpath://select[@id='comboTiposPreposto']
${TIPOPREPOSTO_SOLICITACAO}           xpath://option[contains(text(),'DO CLIENTE')]
${PREPOSTO_SOLICITACAO}               xpath://input[@id='strTipoPreposto']
${TIPOPREPOSTO}                       xpath://option[contains(text(),'DO ESCRITORIO/CORRESPONDENTE')]
${ACORDO_SOLICITACAO}                 xpath://select[@id='blnAcordo']
${COMBO_PROPOSTADEACORDO}             xpath://select[@id='blnAcordo']//option[contains(text(),'Sim')]
${LOADING_SOLICITACAO}                xpath:/html[1]/body[1]/div[7]/div[1]/img[1]
${NUMERO_SOLICITACAO}                 xpath:/html[1]/body[1]/div[3]/div[1]/h3[1]/div[1]/table[1]/tbody[1]/tr[1]/td[1]
${BUSCA_PESQUISARSOLICITACAO}         xpath://input[@id='idSolicitacao']
${OBSERVACAO_FOLLOWUP}                xpath://textarea[@id='ObsFollowUp']
${CMB_ABAFOLLOWUP}                    xpath:/html[1]/body[1]/div[3]/div[1]/div[3]/ul[1]/li[3]

###BOTÕES
${BTN_NOVASOLICITACAO}                xpath://button[@id='btnSolicitacao']
${BTN_ENVIARSOLICITACAO}              xpath://button[@id='btnEnviarSolicitacao']
${BTN_FECHARSOLICITACAO}              xpath://span[@id='closeSolicitacao']
${BTN_PESQUISARSOLICITACAO}           xpath://button[@id='btnPesquisar']
${BTN_ABADOCUMENTOS}                  xpath://li[@id='btnTab3']
${BTN_ADDARQUIVO}                     xpath://button[@id='btnAddArquivo']
${BTN_EXCLUIRARQUIVO}                 xpath:/html[1]/body[1]/div[3]/div[1]/section[1]/form[1]/fieldset[1]/div[3]/table[1]/tbody[1]/tr[1]/td[4]/button[1]/span[1]
${BTN_EXCLUIRARQUIVO02}               xpath:/html[1]/body[1]/div[3]/div[1]/section[1]/form[1]/fieldset[1]/fieldset[1]/button[1]
${BTN_ESCOLHERARQUIVO}                xpath://input[@id='arquivo']
${BTN_ENVIARFOLLOWUP}                 xpath://button[@id='btnAddFollowUp']
${BTN_DOCUMENTOS_PGT01_SIM}           xpath:/html[1]/body[1]/div[3]/div[1]/section[1]/form[2]/fieldset[1]/div[2]/i[1]/select[1]/option[2]
${BTN_DOCUMENTOS_PGT01_NAO}           xpath:/html[1]/body[1]/div[3]/div[1]/section[1]/form[2]/fieldset[1]/div[2]/i[1]/select[1]/option[3]
${BTN_DOCUMENTOS_PGT02_SIM}           xpath:/html[1]/body[1]/div[3]/div[1]/section[1]/form[2]/fieldset[1]/div[4]/i[1]/select[1]/option[2]
${BTN_DOCUMENTOS_PGT02_NAO}           xpath:/html[1]/body[1]/div[3]/div[1]/section[1]/form[2]/fieldset[1]/div[4]/i[1]/select[1]/option[3]
${BTN_DOCUMENTOS_PGT03_SIM}           xpath:/html[1]/body[1]/div[3]/div[1]/section[1]/form[2]/fieldset[1]/div[6]/i[1]/select[1]/option[2]
${BTN_DOCUMENTOS_PGT03_NAO}           xpath:/html[1]/body[1]/div[3]/div[1]/section[1]/form[2]/fieldset[1]/div[6]/i[1]/select[1]/option[3]
${BTN_ENVIARPERGUNTAS}                xpath://button[@id='btnEnviarPerguntas']

###MENSAGENS
${MSG_SOLICITACAOSALVA}               xpath://span[contains(text(),'Solicitação salva !')]
${MSG_ARQADD}                         Sucesso! Arquivo(s) adicionado(s)!
${MSG_ARQEXCLUIDO}                    Arquivo(s) excluido(s)!
${MSG_FOLLOWUPARQUIVOS}               Insira arquivos na solicitação antes de gerar o tipo de Follow-up ANEXO DE DOCUMENTOS / ARQUIVOS
${MSG_RESPOSTASSALVAS}                Respostas salvas!
${MSG_SUCESSOFOLLOWUP}                Follow-Up adicionado!

###TEXTOS NAS TELAS
${TXT_TELADOCUMENTOS01}               * Extensões que podem ser salvas como PDF
${TXT_TELADOCUMENTOS02}               Você adicionou todos os arquivos necessários para este ato?
${TXT_TELADOCUMENTOS03}               Você já descreveu todas as orientações necessárias para a realização da audiência?
${TXT_TELADOCUMENTOS04}               Você deseja que a Finch junte arquivos no Protocolo Eletrônico?
${TXT_TELAFOLLOWUP01}                 Tipo de Follow-up
${TXT_TELAFOLLOWUP02}                 Observação
${TXT_TELAHOME}                       Solicitações
${TXT_INSEREDOCUMENTOS}               Selecione o(s) documento(s) a ser(em) protocolado(s)!
${TXT_CAMPOVAZIO}                     Os campos destacados em vermelho estão vazios ou contém valores inválidos.
${TXT_VALORESTIMADO}                  xpath://h4[@class='valorEstimado']
${TXT_TXTVALORESTIMADO}               xpath:/html[1]/body[1]/div[3]/div[1]/form[1]/section[1]/h4[1]

###IMAGENS
${LOADING}                            xpath:/html[1]/body[1]/div[7]/div[1]/img[1]

###DIVERSOS
${HORA}=                          09:00
${DOCS}                           TesteDoc2.docx
