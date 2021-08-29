void main(List<String> args) {
  var idade = '35 anos';
  var idadeCorreto = '35';
  String? nome;

  try {
    // int.parse(idade);
    // nome!.toUpperCase();
    var idadeParse = int.parse(idadeCorreto);
    if (idadeParse == 35) {
      throw Exception();
    }
  } on FormatException catch (e, s) {
    print(e);
    print(s);
    print('Erro ao converter idade');
  } on TypeError {
    print('Erro ao converter idade');
  } on Exception {
    print('Erro idade == 35');
  } catch (erro, stackTrace) {
    print(stackTrace);
    print('Erro ao executar programa');
  } finally {
    print('finally');
  }
}
