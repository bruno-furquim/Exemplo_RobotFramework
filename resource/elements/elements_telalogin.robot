*** Variables ***
###ACESSO AO SISTEMA
${LOGIN}                      brunofurquim
${SENHA}                      123456
${BROWSER}                    chrome
${URL}                        http://
${LINKTJ}                     http://www.tj.com.br

###LOCATORS TELA DE LOGIN
${LOC_LOGIN}                  id=strUsuario
${LOC_SENHA}                  id=strSenha

#Esqueci minha senha
${ESQ_LOGIN}                  xpath://input[@placeholder='Usuário']
${ESQ_EMAIL}                  xpath://input[@placeholder='E-mail']

###BOTÕES
${BTN_ENTRAR}                 xpath://button[@id='btnEntrar']
${BTN_ENVIARESQUECISENHA}     xpath://button[@class='btn btn-primary btnEnviar']

###MENSAGENS
${MSG_USUARIOINVALIDO}        *Usuário ou Senha inválidos.

###DIVERSOS
${LINK_ESQUECI_SENHA}         xpath//a[@class='senha']
