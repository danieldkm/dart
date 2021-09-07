class EnviarEmail {
  bool call(String email) {
    print('chamar o metodo call');
    return enviar(email);
  }

  bool enviar(String email) {
    print('chamar o metodo enviar');
    return true;
  }
}
