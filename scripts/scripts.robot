*** Keywords ***
####JAVASCRIPT####

###Inserir data no campo type=date (Campo DataLimite do Cadastro de Solicitação)
InputData
    ${DATA}  Get Current Date
    ${DATA}  Add Time To Date   ${DATA}  20 days
    ${DATA}  Convert Date       ${DATA}  result_format=%Y-%m-%d
    Execute JavaScript  document.getElementById('dataLimite').value='${DATA}'

###Clica na primeira Solicitação (Tipo de solicitação)
SelecionaSolicitação
      Execute Javascript  function getElementByXpath(path)
      ...                 { return document.evaluate(path, document, null, XPathResult.ANY_UNORDERED_NODE_TYPE, null).singleNodeValue; }
      ...                 console.log(getElementByXpath("/html[1]/body[1]/div[1]/div[3]/div[1]/div[3]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/a[1]").click());

###Seleciona checkbox para marcar documento inserido
SelecionaCheck
      Execute Javascript  function getElementByXpath(path)
      ...                 { return document.evaluate(path, document, null, XPathResult.ANY_UNORDERED_NODE_TYPE, null).singleNodeValue; }
      ...                 console.log(getElementByXpath("/html[1]/body[1]/div[3]/div[1]/section[1]/form[1]/fieldset[1]/div[3]/table[1]/tbody[1]/tr[1]/td[1]/input[1]").click());

###Insere horário no campo HORA
InsereHora
      Execute Javascript
      ...                 document.getElementById('tHora').value='${HORA}'
