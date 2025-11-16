class GetCurrentUserStatus {
  const GetCurrentUserStatus();

  Future<bool> call() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return false;
  }
}

