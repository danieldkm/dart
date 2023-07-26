# Introdução a Backend

## Monólito

- Monólito siginifica "obra construída em uma só pedra"
- Todo seu sistema está em um único código fonte e obrigatoriamente em um núnico servidor

### Monólito - Benefícios

- Desenvolvimento mais "Ágil"
- Menor complexidade inicial

## Monólito - Desvantagens

- Manutenção
- Escalabilidade
- Complexidade

## Sistemas em 2 Camadas

- Front-end
- Backend
  - Web Service (SOAP)
  - Rest Service

## Micro Service

Consiste na quebra do seu monólito em várias aplicaçãoes completas pequenas e independentes

### Micro Service - Benefícios

- Fácil entendimento e desenvolvimento do projeto;
- Fácil e rápida implantação (build e deploy);
- Redução do tempo de startup, pois os microservices são menores que aplicações monolítias em termos de código;
- Possibilidade de aplicar a melhor ferramente para um determinado trabalho.

### Micro Service - Desvantagens

- Dificuldade em implantar e operar sistemas distribuídos;
- Implantar uma alteração em um serviço utilizando por muitos sistemas demanda coordenação e cautela.

## Webservice Restfull

- Estilo de arquitetura de software responsável pela comunicação (troca de informações) entre sistemas.
- Esse tipo de serviço não mantem estado, sendo assim ele passa pelo processo de:
  - Inicia
  - Executa
  - Finaliza
- São acessados pelos métodos http (get, post, put, path, delete)
- Cada método é exposto por uma URL chamada de endpoint

### Webservice Restfull - Verbos Http

- Post:   Responsável por inserir um novo registro
- Put:    Responsável por alterar um dado
- Patch:  Responsável por alterar algum dado no próprio payload enviado
- Delete: Responsável por deletar o objeto chamado
- Get:    Responsável por buscar os dados

### Webservice Restfull - Endpoint

- Sempre utilize substantivos
- Não utilza palavras como salvar, atualizar
- Exemplos
  - Salvar Fornecedor
    - Método post
    - Endpoint: /fornecedor
  - Alterar Fornecedor
    - Método Put
    - Endpoint: /fornecedor/{id}
  - Buscar todos
    - Método Get
    - Endpoint: /fornecedores
    - Filtros: queryStrings
    - Ex: /fornecedires?estado=SP&cidade=São Paulo
  - Salvar Produtos Fornecedor
    - Método post
    - Endpoint: /fornecedor/{id}/produto
  - Alterar Produto
    - Método Put
    - Endpoint: /fornecedor/{id}/produto/{id}
  - Buscar todos produtos
    - Método Get
    - Endpoint: /fornecedor/{id}/produtos
