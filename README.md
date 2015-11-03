BluePrint doc show
===

Interface simples para chamada de urls que retornam arquivos Markdown e processa a formatação usando o tema padrão da biblioteca Aglio

## Dependência
Esse projeto depende de node.js e demais bibliotecas indicadas no package.json

## Utilização
Executar o comando

```
$:> npm install

$:> grunt
```

Abrir o navegador conforme a porta apresentada do servidor

## URLs disponíveis

http://localhost:3030/ - Home que apresenta campo para informar a URL do arquivo de Markdown

http://localhost:3030/doc?url={url-md} - Página que irá processar a página do arquivo de markdown e apresentar a formatação conforme o uso do Aglio no template padrão
