import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> main(List<String> args) async {
  await buscarCep('01001000');
  await buscarCep('999999999');
  await salvarPost();
  await atualizarPost();
  // await buscarPosts();
}

Future<void> atualizarPost() async {
  var url = 'https://jsonplaceholder.typicode.com/posts/1';
  var mapaRequest = {
    'title': 'Post novo',
    'body': 'Descricao do post',
    'userId': 1
  };
  var response = await http.put(
    Uri.parse(url),
    body: jsonEncode(
      mapaRequest,
    ),
    // headers: {'Content-type': ''},
  );

  print(response.statusCode);
  print(response.body);
}

Future<void> salvarPost() async {
  var url = 'https://jsonplaceholder.typicode.com/posts/';
  var mapaRequest = {
    'title': 'Post novo',
    'body': 'Descricao do post',
    'userId': 1
  };
  var response = await http.post(
    Uri.parse(url),
    body: jsonEncode(
      mapaRequest,
    ),
  );

  print(response.statusCode);
  print(response.body);
}

Future<void> buscarPosts() async {
  var url = 'https://jsonplaceholder.typicode.com/posts/';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var responseData = jsonDecode(response.body);
    if (responseData is List) {
      responseData.forEach((element) => print(element['id']));
    }
  }
}

Future<void> buscarCep(cep) async {
  var url = 'https://viacep.com.br/ws/${cep}/json/';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode >= 200 && response.statusCode < 300) {
    var responseData = jsonDecode(response.body);
    if (responseData is Map) {
      print(responseData['cep']);
      print(responseData['logradouro']);
    }
  } else {
    print('Ocorreu um problema mensagem ${response.reasonPhrase}');
    // print(response.statusCode);
    // print(response.body);
    // print(response.reasonPhrase);
  }
}
