import 'package:shared_preferences/shared_preferences.dart';

// SharedPreferences를 사용하여 간단한 데이터를 로컬에 저장하고 불러오는 클래스입니다.
// (예: 사용자 인증 토큰, 앱 설정 등)
class SharedPreferencesManager {
  SharedPreferencesManager._privateConstructor();
  static final SharedPreferencesManager _instance = SharedPreferencesManager._privateConstructor();
  factory SharedPreferencesManager() {
    return _instance;
  }

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // String 저장
  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // String 불러오기
  String? getString(String key) {
    return _prefs?.getString(key);
  }

  // 데이터 삭제
  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  // 모든 데이터 삭제
  Future<void> clear() async {
    await _prefs?.clear();
  }
}
