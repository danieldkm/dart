# Middlewares

## Introdução a middlewares no shelf

intercepta as chamadas tanto no inicio e no final.

## Construindo Middleware de Cors

- lib\application\middlewares\middlewares.dart
- lib\application\middlewares\cors\cors_middlewares.dart

## Middleware de Default Content Type Response

- lib\application\middlewares\defaultContentType\default_content_type.dart

## JWT - Conceitos

## O que é JSON Web Token (JWT)?

JSON Web Token (JWT) é um padrão aberto (RFC 7519) que define uma forma compacta e independente para transmitir informações com segurança entre as partes como um objeto JSON. Essas informações podem ser verificadas e confiáveis porque estão assinadas digitalmente. Os JWTs podem ser assinados usando um segredo (com o algoritmo ***HMAC***) ou um par de chaves públicas / privada usando o ***RSA*** ou ***ECDSA***.

### Autorização

Este é o cenário mais comum para o uso do JWT. Depois que o usuário estiver conectado, cada solicitação subsequente incluirá o JWT, permitndo que o usuário acesse rotas, serviços e recursos permitidos com esse token.

O Single Sign On é um recurso que usa amplamente o JWT atualmente, devido à sua pequena sobrecarga e sua capacidade de ser facilmente usado em diferentes domínios.

## Qual é a estrutura do JSON WEb Token?

Em sua forma compacta, JSON Web Tokens consistem em três partes separadas por pontos (.)
  
- Header
- Payload
- Signature

Portanto, um JWT normalmente se parece com o seguinte:

eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9
.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ
.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c

### Cabeçalho (Header)

O cabeçalho normalmente consiste em duas partes: o tipo do token, que é JWT, e o algoritmo de assinatura que está sendo usado, como HMAC SHA256 ou RSA.

```json
{
  "alg": "HS256",
  "typ": "JWT"
}
```

Então, esse JSON é codigicado em ***Base64Url*** para formar a primeira parte do JWT.

### Payload

A segunda parte do token é o payload, que contém as declarações. As declarações são declarações sobre um entidade (normalmente, o usuário) e dados adicionais.

Trata-se de um conjunto de declarações predefinidas que não são obrigatórias, mas recomendadas, para fornecer um conjunto de declarações úteis e interopéráveis. Alguns deles são: ***iss*** (issuer), ***exp*** (expiration time), ***sub*** (subject), ***aud*** (audience) e ***others***.

> Observe que os nome das declarações têm apenas três caracteres, já que o JWT deve ser compacto.

```json
{
  "sub": "1234567890",
  "name": "John Doe",
  "admin": true,
  "iat": 1516239022
}
```

### Signature (Assinatura)

Para criar a parte da assinatura, você deve pegar o cabeçalho codificado, o payload codificada, uma senha, o algoritmo especificado no cabeçalho e assiná-lo.

Por exemplo, se você deseja usar o algorimto HMAC SHA256, a assinatura será criada da seguinte maneira:

```js
HMACSHA256(
  base64UrlEncode(header) + "." +
  base64UrlEncode(payload),
  secret
)
```

## Middleware de segurança

```bash
dart pub add jaguar_jwt
```
