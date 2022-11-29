# EanPictures
Ean Pictures e Data Load

Como utilizar

[Api eanpictures.com.br]

Endpoints:

chamada: /api/gtin/:id
exemplo: http://www.eanpictures.com.br:9000/api/gtin/78932609
* note que 78932609 é o código EAN / código de barras do produto

Se *ENCONTRAR* a foto do produto, isso devolve um arquivo do tipo png contendo a foto do produto.
Se não encontrar a foto, devolve HTTP ERROR 404
*****************************************************************


chamada: /api/descricao/:id
exemplo: http://www.eanpictures.com.br:9000/api/descricao/78932609
* note que 78932609 é o código EAN / código de barras do produto

Se *ENCONTRAR* a descrição do produto, devolve texto contendo a mesma

Se NAO ENCONTRAR a descrição do produto, devolve json contendo:
{"Status":"404","Status_Desc":"Descricao nao encontrada para o ean: 7893260454"}


********************************************************************

chamada: /api/um2/:id
exemplo: http://www.eanpictures.com.br:9000/api/um2/BD
* note que BD é o código da unidade de medida que voce quer saber o que significa

Se *ENCONTRAR*  a unidade de medida, devolve texto contendo a descrição
Se NÃO ENCONTRAR, devolve json contendo:
{"Status":"404","Status_Desc":"Descricao nao encontrada para a unidade de medida: BDS"}

*******************************************************************

chamada: /api/um/:id
exemplo: http://www.eanpictures.com.br:9000/api/um/BD
* note que BD é o código da unidade de medida que voce quer saber o que significa

Se *ENCONTRAR*  a unidade de medida, devolve json:
{"Status":"200","Status_Desc":"Ok","id":"BD","nome":"BALDE\/BANDEJA"}

Se NÃO ENCONTRAR, devolve json contendo:
{"Status":"404","Status_Desc":"Descricao nao encontrada para a unidade de medida: BD1"}

************************************************************************

Chamada: /api/desc/:id
exemplo: http://www.eanpictures.com.br:9000/api/desc/78932609
* note que 78932609 é o código EAN / código de barras do produto

Se *ENCONTRAR*  a unidade de medida, devolve json:
{"Status":"200","Status_Desc":"Ok","Nome":"Chiclets Adams Hortela","Ncm":"17041000","Cest_Codigo":"1800200","Embalagem":"Unidade","QuantidadeEmbalagem":"1","Marca":"ADAMS","Categoria":"MERCEARIA","Peso":"","id_categoria":"15","tributacao":""}

Se NÃO ENCONTRAR, devolve json contendo:
{"Status":"404","Status_Desc":"Descricao nao encontrada para o ean: 789326091"}

**************************************************************************

Chamada: /api/desc200/:id
exemplo: http://www.eanpictures.com.br:9000/api/desc200/78932609
* note que 78932609 é o código EAN / código de barras do produto

Se *ENCONTRAR*  a unidade de medida, devolve json:
{"Status":"200","Status_Desc":"Ok","Nome":"Chiclets Adams Hortela","Ncm":"17041000","Cest_Codigo":"1800200","Embalagem":"Unidade","QuantidadeEmbalagem":"1","Marca":"ADAMS","Categoria":"MERCEARIA","Peso":"","id_categoria":"15","tributacao":""}

Se NÃO ENCONTRAR, devolve json contendo:
{"Status":"404","Status_Desc":"404","Nome":"404","Ncm":"404","Cest_Codigo":"404","Embalagem":"404","QuantidadeEmbalagem":"0","Marca":"404","Categoria":"404","Peso":"0","id_categoria":"0","tributacao":"404"}

******************************************************************************

Chamada: /api/desc_ini/:id
exemplo: http://www.eanpictures.com.br:9000/api/desc_ini/78932609
* note que 78932609 é o código EAN / código de barras do produto

Se *ENCONTRAR*  a unidade de medida, devolve texto no formato INI:
[GENERAL] Nome=Chiclets Adams Hortela Ncm=17041000 Cest_Codigo=1800200 Embalagem=Unidade QuantidadeEmbalagem=1 Marca=ADAMS Categoria=MERCEARIA Peso id_categoria=15 tributacao


Se NÃO ENCONTRAR, devolve json contendo:
{"Status":"404","Status_Desc":"Descricao nao encontrada para o ean: 789326091"}

*******************************************************************************

Chamada: /api/fotoexiste/:id
exemplo: http://www.eanpictures.com.br:9000/api/fotoexiste/78932609
* note que 78932609 é o código EAN / código de barras do produto

Se *ENCONTRAR*  a a foto na nossa base de dados, devolve texto: Sim

Se NÃO ENCONTRAR, devolve texto: Nao

