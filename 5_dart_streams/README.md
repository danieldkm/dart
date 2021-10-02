# Módulo 7 - Dart Streams

## Introdução

### Assíncrono
Assíncrono em dart é representado por duas classes:
  - Future (Futuro)
  - Stream (Fluxo)

### Future & Streams
- Um <ins>**Future**</ins> é usado para representar um valor ou um erro que estará disponível em algum momento no **Futuro**.
- Uma <ins>**Stream**</ins> tem a mesma característica de um Future em um momento futuro você receberá um valor ou um erro em algum momento.

Mas qual a diferença, se stream também é um futuro?
- Um <ins>**Future**</ins> você recebera um único resultado (Sucesso ou Erro).
- Uma <ins>**Stream**</ins> é uma combinação de <ins>**Futures**</ins>, dessa forma com <ins>**Streams**</ins> você poderá receber vários valores.

Resumindo no _future_ você irá receber um unico valor, ja na _stream_ permanece aberto, podendo encadear varios futures e pode ser fechado quando quiser.

## Stream.periodic e await for
## Parando uma Stream com Take e TakeWhile
Transformação

### Take
limita quantas vezes a stream vai receber algo.
### TakeWhile
Executa enquanto a condição é verdadeira.

## Descartando dados com Skip e SkipWhile
## .toList recebendo todos os dados de uma vez só
## Escutando nossa stream com Listener
## Filtrando dados com Where
# Vários ouvintes na stream com .asBroadcast
- so pode ter apenas um `listen`
- mas podemos dividir, ou seja mais de uma pessoa ouvindo essa `stream`, com o broadcast
- permitindo assim vários subscribers
- a stream continuar ativa enquando não solicitar o encerramento.

