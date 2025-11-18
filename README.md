# e:um - 청년과 정책을 잇다

e:um은 대한민국 청년(20~30대)이 복잡하고 분산된 정부·지자체·기관의 청년 정책, 장학금, 복지 혜택을 한 곳에서 쉽게 찾고, AI가 개인 맞춤형으로 추천해 주는 Flutter 모바일 앱입니다. 정책 탐색, AI 추천, 로드맵 구성, 캘린더 알림까지 앱 내에서 연결합니다.


## 주요 기능(현재/계획)
- 정책 탐색: 카테고리/검색 기반 목록 및 상세 보기
- AI 추천(계획): 사용자 프로필 기반 정책/로드맵 추천
- 로드맵(계획): 단계별 수행 로드맵 생성/수정/진행률 관리
- 캘린더·알림(부분 준비): 마감일/신청일 등록 및 로컬 알림
- 인증(계획): 회원가입/로그인/토큰 캐싱


## 기술 스택
- Flutter 3.5+ / Dart 3.5+
- 상태 관리: Provider/Riverpod 도입 예정(초기 버전은 MaterialApp + 간단 페이지)
- 패키지(현재):
  - intl, shared_preferences, flutter_local_notifications
- 백엔드(연동 예정): Node.js 기반 API (정책/AI/로드맵/채팅/캘린더)


## 프로젝트 구조(요약)
Flutter 앱 기준의 정리된 3-Layer(또는 Clean Architecture) 지향 구조로 구성되어 있습니다.

```
lib/
  main.dart
  core/                      # 공통/플랫폼 무관 유틸, 라우팅, 테마 등
    config/
      app_config.dart        # 환경 설정(예: API Base URL) - 필요 시 작성
      api_endpoints.dart     # 백엔드 엔드포인트 경로 상수 - 필요 시 작성
    constants/
      app_constants.dart
      string_constants.dart
    error/
      exceptions.dart
      failures.dart
    routes/
      app_router.dart        # 전역 라우팅 설정(MaterialApp.router 등) - 필요 시 작성
      route_paths.dart
    theme/
      app_colors.dart
      app_text_styles.dart
      app_theme.dart
    utils/
      validators.dart
      date_formatters.dart
      shared_preferences_manager.dart
      notification_service.dart

  data/                      # 외부/원천 데이터 접근 계층
    datasources/
      remote/                # 원격 API 호출
        auth_remote_datasource.dart
        policy_remote_datasource.dart
        roadmap_remote_datasource.dart
        ai_remote_datasource.dart
        chat_remote_datasource.dart
        calendar_remote_datasource.dart
      local/
        auth_local_datasource.dart
        policy_cache_datasource.dart
    models/                  # DTO/응답 매핑
      auth/...               # login_request/response, user
      policy/...             # policy, category, list response
      roadmap/...            # roadmap, block
      calendar/...           # event
      chat/...               # message, session
      common/api_response_model.dart
    repositories/
      auth_repository_impl.dart
      policy_repository_impl.dart
      roadmap_repository_impl.dart
      ai_repository_impl.dart
      chat_repository_impl.dart
      calendar_repository_impl.dart

  domain/                    # 비즈니스 규칙 계층
    entities/                # 순수 Dart 엔터티
      auth/...  policy/...  roadmap/...  calendar/...  chat/...
    repositories/            # 리포지토리 계약(인터페이스)
      auth_repository.dart
      policy_repository.dart
      roadmap_repository.dart
      ai_repository.dart
      chat_repository.dart
      calendar_repository.dart
    usecases/                # 유스케이스(인터랙터)
      auth/...  policy/...  roadmap/...  ai_recommendation/...  chat/...  calendar/...

  presentation/              # UI 레이어(계획). 현재는 간단한 Page/Widget 사용
    providers/...            # 상태 관리(도입 예정)
    screens/...              # Splash/Login/Dashboard/Policy/Roadmap/Calendar/AI/Chat
    widgets/...              # 공통 위젯 모음

  # 초기 버전에서 사용 중인 단순 경로(점진적으로 presentation/로 정리 예정)
  page/                      # 예: home 등 일부 화면
  widgets/                   # 예: policy_card 등 재사용 위젯
```

참고: 실제 파일 유무/이름은 진행 상황에 따라 일부 다를 수 있습니다. 위 구조는 목표 구조이며, 현재는 최소 화면으로 앱을 시동합니다.


## 실행 방법
사전 준비: Flutter 설치 및 iOS/Android/macOS 개발 환경을 갖춥니다.

1) 의존성 설치
```
flutter pub get
```

2) iOS (시뮬레이터)
```
open ios/Runner.xcworkspace
# Xcode에서 Signing 설정 후
flutter run -d ios
```

3) Android (에뮬레이터/디바이스)
```
flutter run -d android
```

4) macOS (옵션)
```
flutter config --enable-macos-desktop
flutter run -d macos
```

문제 발생 시 아래 트러블슈팅을 참고하세요.


## 환경설정(AppConfig)과 API 엔드포인트
백엔드 연동을 시작하기 전 아래처럼 환경 변수를 정의하는 것을 권장합니다.
- `lib/core/config/app_config.dart`: 환경별 설정(예: baseUrl)
- `lib/core/config/api_endpoints.dart`: 정책/로드맵/AI/채팅/캘린더 등 엔드포인트 경로 상수

예시(가이드):
- AppConfig에 `const String baseUrl = "http://localhost:3000";`와 같은 값을 둡니다.
- api_endpoints.dart에 `/policies`, `/roadmaps`, `/chat`, `/calendar` 등의 경로 상수를 정의합니다.

초기 버전은 더미 데이터/로컬 캐시로 동작할 수 있으며, 실제 API 연동 시 http/dio 등 클라이언트를 추가하세요.


## 라우팅(AppRouter) 가이드
- 단일 화면으로 시작할 땐 `MaterialApp(home: ...)` 으로 충분합니다.
- 화면이 늘어나면 `MaterialApp.router` + `AppRouter`(go_router/auto_route 등)로 전환해,
  `lib/core/routes/app_router.dart`에서 라우팅 테이블을 관리하세요.
- `route_paths.dart`에는 경로 상수를 모아두면 유지보수에 유리합니다.

현재 버전은 최소 화면으로 시동되며, 라우팅 확장은 추후 단계에서 적용됩니다.


## 개발 가이드
- 코딩 규칙: `analysis_options.yaml` 기반 lints 준수
- 레이어드 아키텍처: core/data/domain/presentation 간 의존 방향 유지
  - presentation -> domain(usecases) -> repositories(interface) -> data(impl)
- 모델/엔터티 분리: API 응답(DTO)와 도메인 엔터티를 구분
- 상태 관리: Provider/Riverpod를 screens/providers에 배치 예정
- 알림: `flutter_local_notifications` 초기화는 앱 시작 시 1회 수행


## 자주 겪는 이슈와 해결법
- iOS Pod 관련 오류
  - `cd ios && pod install && cd ..`
  - Xcode에서 Signing Team 설정 확인
- 로컬 알림 권한/초기화 문제
  - iOS: 알림 권한 요청 필요, Android: 채널 생성 확인
- 패키지 의존성 충돌
  - `flutter clean && flutter pub get`
- 빌드/런 버튼 옆 X 마크(분석 경고)
  - main.dart의 import 경로/미사용 import 확인
  - 존재하지 않는 파일 참조 제거 또는 해당 파일 생성


## 빠른 확인(스모크 테스트)
- 앱이 정상 시동되는지 확인하고, 홈 화면에서 기본 버튼/네비게이션이 동작하는지 체크합니다.
- 추가 기능(정책 목록/상세, AI 추천 등)은 모듈 단위로 점진 구현합니다.


## 라이선스
본 저장소는 해커톤/프로토타입 용도로 시작되었으며, 별도 고지 전까지는 내부 사용을 전제로 합니다.
