// 폼 필드 등의 유효성 검사를 위한 함수들을 정의합니다.
class Validators {
  // 이메일 형식 검사
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return '이메일을 입력해주세요.';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return '올바른 이메일 형식이 아닙니다.';
    }
    return null;
  }

  // 비밀번호 형식 검사 (최소 8자)
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }
    if (value.length < 8) {
      return '비밀번호는 8자 이상이어야 합니다.';
    }
    return null;
  }

  // 비어있는지 확인
  static String? notEmpty(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? '해당 필드'}는 비워둘 수 없습니다.';
    }
    return null;
  }
}
