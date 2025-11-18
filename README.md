![poster](./logo) 
## e:um
청년과 정책을 이어주는 AI 기반 맞춤형 청년정책 추천 및 인생 로드맵 설계 서비스

e:um은 대한민국 청년(20~30대)들이 복잡하고 분산된 정부·지자체·기관의 청년 정책, 장학금, 복지 혜택 정보 등을 한 곳에서 쉽게 찾고, AI가 개인 맞춤형으로 추천해주는 서비스입니다.

## 🏗️ 프로젝트 구조

```
e:um/
├── mobile/                    # Flutter 모바일 앱
│   ├── lib/
│   │   ├── core/             # 공통 유틸, 라우팅, 테마
│   │   │   ├── config/       # 환경 설정
│   │   │   │   ├── app_config.dart
│   │   │   │   └── api_endpoints.dart
│   │   │   ├── constants/    # 상수 정의
│   │   │   │   ├── app_constants.dart
│   │   │   │   └── string_constants.dart
│   │   │   ├── error/        # 에러 처리
│   │   │   │   ├── exceptions.dart
│   │   │   │   └── failures.dart
│   │   │   ├── routes/       # 전역 라우팅
│   │   │   │   ├── app_router.dart
│   │   │   │   └── route_paths.dart
│   │   │   ├── theme/        # 테마 및 스타일
│   │   │   │   ├── app_colors.dart
│   │   │   │   ├── app_text_styles.dart
│   │   │   │   └── app_theme.dart
│   │   │   └── utils/        # 유틸리티 함수
│   │   │       ├── validators.dart
│   │   │       ├── date_formatters.dart
│   │   │       ├── shared_preferences_manager.dart
│   │   │       └── notification_service.dart
│   │   ├── data/             # 데이터 접근 계층
│   │   │   ├── datasources/  # API 호출 및 로컬 캐시
│   │   │   │   ├── remote/   # 원격 API
│   │   │   │   │   ├── auth_remote_datasource.dart
│   │   │   │   │   ├── policy_remote_datasource.dart
│   │   │   │   │   ├── roadmap_remote_datasource.dart
│   │   │   │   │   ├── ai_remote_datasource.dart
│   │   │   │   │   ├── chat_remote_datasource.dart
│   │   │   │   │   └── calendar_remote_datasource.dart
│   │   │   │   └── local/    # 로컬 캐시
│   │   │   │       ├── auth_local_datasource.dart
│   │   │   │       └── policy_cache_datasource.dart
│   │   │   ├── models/       # DTO/응답 매핑
│   │   │   │   ├── auth/     # login_request/response, user
│   │   │   │   ├── policy/   # policy, category, list response
│   │   │   │   ├── roadmap/  # roadmap, block
│   │   │   │   ├── calendar/ # event
│   │   │   │   ├── chat/     # message, session
│   │   │   │   └── common/api_response_model.dart
│   │   │   └── repositories/ # 리포지토리 구현
│   │   │       ├── auth_repository_impl.dart
│   │   │       ├── policy_repository_impl.dart
│   │   │       ├── roadmap_repository_impl.dart
│   │   │       ├── ai_repository_impl.dart
│   │   │       ├── chat_repository_impl.dart
│   │   │       └── calendar_repository_impl.dart
│   │   ├── domain/           # 비즈니스 로직 계층
│   │   │   ├── entities/     # 도메인 엔터티
│   │   │   │   ├── auth/
│   │   │   │   ├── policy/
│   │   │   │   ├── roadmap/
│   │   │   │   ├── calendar/
│   │   │   │   └── chat/
│   │   │   ├── repositories/ # 리포지토리 인터페이스
│   │   │   │   ├── auth_repository.dart
│   │   │   │   ├── policy_repository.dart
│   │   │   │   ├── roadmap_repository.dart
│   │   │   │   ├── ai_repository.dart
│   │   │   │   ├── chat_repository.dart
│   │   │   │   └── calendar_repository.dart
│   │   │   └── usecases/     # 유스케이스
│   │   │       ├── auth/
│   │   │       ├── policy/
│   │   │       ├── roadmap/
│   │   │       ├── ai_recommendation/
│   │   │       ├── chat/
│   │   │       └── calendar/
│   │   └── presentation/     # UI 계층 (도입 예정)
│   │       ├── providers/    # 상태 관리
│   │       ├── screens/      # 화면 컴포넌트
│   │       │   ├── splash/
│   │       │   ├── auth/
│   │       │   ├── dashboard/
│   │       │   ├── policy/
│   │       │   ├── ai/
│   │       │   ├── roadmap/
│   │       │   ├── calendar/
│   │       │   └── chat/
│   │       └── widgets/      # 재사용 위젯
│   ├── page/                 # 초기 버전 화면 (정리 예정)
│   ├── widgets/              # 초기 버전 위젯 (정리 예정)
│   ├── ios/                  # iOS 프로젝트
│   ├── android/              # Android 프로젝트
│   ├── pubspec.yaml          # Flutter 의존성
│   └── analysis_options.yaml # 코드 분석 규칙
│
└── api/                      # Node.js 백엔드 서버
    ├── src/
    │   ├── routes/           # API 라우트
    │   │   ├── auth/         # 인증 관련
    │   │   ├── policy/       # 정책 관련
    │   │   ├── roadmap/      # 로드맵 관련
    │   │   ├── ai/           # AI 추천
    │   │   ├── chat/         # 챗봇
    │   │   └── calendar/     # 캘린더
    │   ├── controllers/      # 컨트롤러
    │   ├── services/         # 비즈니스 로직
    │   ├── models/           # 데이터 모델
    │   ├── middleware/       # 미들웨어
    │   └── utils/            # 유틸리티
    ├── config/               # 설정 파일
    ├── server.js             # 서버 진입점
    ├── package.json          # Node.js 의존성
    └── .env.example          # 환경 변수 예시
```
