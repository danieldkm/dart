# Dart Consumo de APIs

## Príncipios

- JSON

## Subindo backend dartion

- feito pelo time flutterando
- `dart pub global activate dartion`

```bash
mkdir backend
cd backend
dartion init
# modificando arquivo db.json
# startar api
dartion serve
# http://localhost:3031/alunos/1
```

## Entendendo o porque existe cada camada

- pattern repository
  - repositories
  - services
  - controller

## Interpretando nosso JSON e mapeando para o dart

- criando classes que representa o json aluno

## Trabalhando com JSON no Dart

- json.decode => traduz o json strig para objeto
- json.encode => traduz o objeto para json

## Convertendo JSON para Modelos - Aula muito importante!!!

- toMap: é um método que pega o objeto e transforma em um Map<String, dynamic>.
- fromMap: é um construtor que vai pegar um MAP e transformar em um objeto.
- toJson: é um metodo que retornar uma string json do meu objeto.
- fromJson: é um método que baseado em uma string json retorna um objeto.

## Acessando nosso backend

- add pacote http

## desafio

- acessar o link https://gist.github.com/rodrigorahman/97705da4adbead0c33bdfc104f8c2a94