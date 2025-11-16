class SearchPolicies {
  const SearchPolicies();

  Future<void> call(String query) async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}

