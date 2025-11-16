import 'package:eum/core/utils/shared_preferences_manager.dart';

// 로컬 저장소에서 인증 관련 데이터를 관리합니다. (예: 인증 토큰)

abstract class AuthLocalDataSource {
  Future<void> saveAuthToken(String token);
  String? getAuthToken();
  Future<void> clearAuthToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferencesManager sharedPreferencesManager;
  AuthLocalDataSourceImpl({required this.sharedPreferencesManager});

  static const String _authTokenKey = 'AUTH_TOKEN';

  @override
  Future<void> saveAuthToken(String token) async {
    await sharedPreferencesManager.setString(_authTokenKey, token);
  }

  @override
  String? getAuthToken() {
    return sharedPreferencesManager.getString(_authTokenKey);
  }

  @override
  Future<void> clearAuthToken() async {
    await sharedPreferencesManager.remove(_authTokenKey);
  }
}
