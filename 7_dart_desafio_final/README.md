# Módulo 9 - Dart desafio final
# pre-requisitos
- rode o script.sql

# Desafio
- Buscar estados e popular os dados da tabela de estados
  - [Estados](https://servicodados.ibge.gov.br/api/v1/localidades/estados)
- Buscar o distrito e salvar o nome
  - [Distritos](https://servicodados.ibge.gov.br/api/v1/localidades/estados/35/distritos)

# Comandos
```bash
# criando projeto dart
dart create -t console-full dart_desafio_final
# subindo mysql
docker-compose -f docker-compose.mysql.yml up
```

# Objeto
```javascript
const estado = {
  id: 11,
  sigla: "RO",
  nome: "Rondônia",
  regiao: {
    id: 1,
    sigla: "N",
    nome: "Norte"
  }
}
```
```javascript
const distrito = {
  id: 350010505,
  nome: "Adamantina",
  municipio: {
    id: 3500105,
    nome: "Adamantina",
    microrregiao: {
      id: 35035,
      nome: "Adamantina",
      mesorregiao: {
        id: 3508,
        nome: "Presidente Prudente",
        UF: {
          id: 35,
          sigla: "SP",
          nome: "São Paulo",
          regiao: {
            id: 3,
            sigla: "SE",
            nome: "Sudeste"
          }
        }
      }
    },
    regiao-imediata: {
      id: 350019,
      nome: "Adamantina - Lucélia",
      regiao-intermediaria: {
        id: 3505,
        nome: "Presidente Prudente",
        UF: {
          id: 35,
          sigla: "SP",
          nome: "São Paulo",
          regiao: {
            id: 3,
            sigla: "SE",
            nome: "Sudeste"
          }
        }
      }
    }
  }
}
```