class RegisterUser {
  const RegisterUser();

  Future<void> call(String email, String password, String name) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
