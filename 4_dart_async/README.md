# Módulo 6 - Dart Async

## Async (Assincronismo)
---
## Futures
---
## Async Await
---
## Future.forEach e Future.wait

---
## Event Loop na VM Dart

### Event Loop - O que é?
- É um padrão de projeto que espera despachar eventos ou mensagens em um programa.
- Em Resumo ele é responsável por executar todos os processo dentro do sistema em uma determinada ordem.
### Event Loop - Como funciona?
- Event loop funciona com o conceito de Filas onde dentro dele existem 2 tipos de filas;
  - Filas de Event
  - Filas de MicroTask

### Filas de Event
- São sempre FIFO (First in First Out).
- Será sempre uma execução assíncrona.
- Tem Baixa prioridade de execução (Se comparado as microTask)
- Deve executar os processo pesados (Leitura, Http, Banco de dados, etc)

### Filas de MicroTasks
- São sempre FIFO (First in First Out).
- Será sempre uma execução síncrona.
- Tem Alta prioridade.
- Deve ser uma execução Rápida.

### Como funciona =>
<img src="assets/event-loop-1.png"/>

---