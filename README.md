# academia-do-flutter

## Módulo 2 - Configurando Ambiente de Desenvolvimento

### Extensões VSCode Recomendações
- ADB Interface for VSCode
- Better Comments
- bloc
- Bracket Pair Colorizer 2 
- CodeSnap
- Dart Data Class Generator
- Error lens
- Flutter & Dart Utilities -> Feito pelo prof.
- IntelliJ IDEA Keybindings

## Módulo 3 - Dart Fundamentos
### **[DartPad](https://dartpad.dev/?null_safety=true)**

Ferramenta web de linha de comando

### Conceitos importantes
- 100% OO
- int, double, null, etc é um tipo objeto dentro do dart
- tudo no dart é um objeto/classe
- existe funções e variaveis de nivel superior (Global)

### Primeiro Projeto

**Criar projeto por linha de Comando**
```bash
dart create -t console-full dart_fundamentos

# setar o nullsafety
dart pub upgrade --null-safety
```

**Criar projeto por VS Code**
- View -> Command Palette -> Dart: Create

### Variáveis

### Imutabilidade

Sempre que possível utilizar o ```final```


## Módulo 4 - Dart Funções e Coleções

**Criar projeto por linha de Comando**
```bash
dart create -t console-full dart_funcoes_colecoes
```

### Sets
- Não deixa adicionar valores duplicados
```dart
  // Convertendo uma lista em sets com .toSet()
  var numerosLista = <int?>[];
  print(numerosLista.toSet());
```

## Módulo 5 - Dart POO( Programação Orientada a Objeto)

### Fundamentos
**Abstração**: 
- Assim como no nosso cotidiano nos abstraímos de certas dificuldades para atingirmos nossas metas, na programação orientada a objetos não poderia ser diferente. Afinal, programamos para automatizar processos do nosso dia a dia.

- **Abstração quer dizer**: "Processo pelo qual se isolam características, considerando os que tenham em comum certos grupos de objetos"

- A ideia que essa definição transmite é que não devemos nos preocupar com características menos importantes, ou seja, acidentais. Devemos, neste caso nos concentrar apenas nos aspectos essencias.

- Não existe pior prática em programação do que a repetição de código. Isto leva a um código frágil, propício a resultados inesperados. Quanto mais código são repetidos pela aplicação, mais difícil vai se tornando sua manutenção. Isso porque facilmente se pode esquecer de atualizar algum ponto que logo levará a uma inconsistência.

<img src="assets/abstracao.png" center />