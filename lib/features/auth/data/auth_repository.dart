class AuthRepository {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // имитация запроса
    return email == 'test@test.com' && password == 'qwerty123';
  }
}
