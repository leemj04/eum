// UI 레이어 및 비즈니스 로직에서 사용될 순수한 사용자 객체입니다.
// 이 객체는 데이터 레이어의 UserModel에 의존하지 않습니다.

class UserEntity {
  final String id;
  final String email;
  final String name;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
  });
}
