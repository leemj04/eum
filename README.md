# e:um - 청년과 정책을 이어주는 AI 기반 맞춤형 청년정책 추천 및 인생 로드맵 설계 서비스

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

## 🚀 실행 방법

### 1. 백엔드 API 서버 실행

#### 로컬 환경에서 실행

1. **Node.js 의존성 설치**
```bash
cd api
npm install
```

2. **환경 변수 설정**
```bash
cp .env.example .env
# .env 파일을 열어 필요한 환경 변수 설정
```

3. **서버 실행**
```bash
# 개발 모드
npm run dev

# 프로덕션 모드
npm start
```

서버가 `http://localhost:3000`에서 실행됩니다.

#### Docker로 실행

```bash
cd api
docker-compose up -d
```

### 2. Flutter 모바일 앱 실행

#### 사전 준비
- Flutter SDK 3.5+ 설치
- Dart SDK 3.5+ 설치
- iOS/Android 개발 환경 설정

#### 로컬 환경에서 실행

1. **Flutter 의존성 설치**
```bash
cd mobile
flutter pub get
```

2. **iOS 실행 (macOS 필요)**
```bash
cd ios
pod install
cd ..
flutter run -d ios
```

3. **Android 실행**
```bash
flutter run -d android
```

4. **macOS 실행 (옵션)**
```bash
flutter config --enable-macos-desktop
flutter run -d macos
```

#### 프로덕션 빌드

```bash
# Android APK
flutter build apk --release

# iOS IPA (macOS 필요)
flutter build ios --release

# Android App Bundle
flutter build appbundle --release
```

#### 개발 도구

```bash
# 코드 분석
flutter analyze

# 테스트 실행
flutter test

# 캐시 정리
flutter clean && flutter pub get
```

## 📋 API 스펙

### 주요 엔드포인트

#### 인증
- `POST /api/auth/register` - 회원가입
- `POST /api/auth/login` - 로그인
- `POST /api/auth/logout` - 로그아웃
- `GET /api/auth/profile` - 프로필 조회

#### 정책
- `GET /api/policies` - 정책 목록 조회
- `GET /api/policies/:id` - 정책 상세 조회
- `GET /api/policies/categories` - 카테고리 목록
- `GET /api/policies/search` - 정책 검색

#### AI 추천
- `POST /api/ai/recommend` - 맞춤형 정책 추천
- `POST /api/ai/chat` - AI 챗봇 대화

#### 로드맵
- `GET /api/roadmaps` - 로드맵 목록
- `GET /api/roadmaps/:id` - 로드맵 상세
- `POST /api/roadmaps` - 로드맵 생성
- `PUT /api/roadmaps/:id` - 로드맵 수정
- `DELETE /api/roadmaps/:id` - 로드맵 삭제

#### 캘린더
- `GET /api/calendar/events` - 일정 목록
- `POST /api/calendar/events` - 일정 추가
- `PUT /api/calendar/events/:id` - 일정 수정
- `DELETE /api/calendar/events/:id` - 일정 삭제

### 기술 스택

#### 모바일 앱 (Flutter)
- **Framework**: Flutter 3.5+
- **언어**: Dart 3.5+
- **상태 관리**: Provider / Riverpod (도입 예정)
- **아키텍처**: Clean Architecture (3-Layer)
- **주요 패키지**:
  - `http` / `dio`: API 통신
  - `shared_preferences`: 로컬 저장소
  - `flutter_local_notifications`: 알림
  - `intl`: 국제화 및 날짜 포맷
  - `provider`: 상태 관리 (예정)
- **플랫폼**: iOS, Android, macOS (옵션)

#### 백엔드 (API)
- **Framework**: Node.js + Express.js
- **언어**: JavaScript / TypeScript
- **데이터베이스**: PostgreSQL / MongoDB
- **AI/ML**: 
  - OpenAI API
  - LangChain (예정)
- **인증**: JWT
- **ORM**: Sequelize / Prisma
- **패키지 관리**: npm

## 🔧 주요 기능

### 1. 정책 탐색 및 검색
- **카테고리별 탐색**: 취업, 창업, 주거, 복지, 교육 등 카테고리별 정책 분류
- **검색 기능**: 키워드 기반 정책 검색
- **상세 정보**: 신청 자격, 혜택, 신청 방법, 마감일 등 상세 정보 제공
- **즐겨찾기**: 관심 정책 저장 및 관리

### 2. AI 맞춤형 추천
- **프로필 기반 추천**: 나이, 지역, 관심사, 상황 등을 고려한 개인화 추천
- **AI 챗봇**: 자연어 대화를 통한 정책 상담 및 안내
- **실시간 업데이트**: 새로운 정책 알림 및 추천

### 3. 로드맵 설계 및 관리
- **단계별 로드맵**: 목표 달성을 위한 단계별 정책 활용 계획
- **진행률 추적**: 각 단계별 완료 상태 관리
- **맞춤형 생성**: AI 기반 자동 로드맵 생성
- **수정 및 공유**: 로드맵 편집 및 다른 사용자와 공유

### 4. 캘린더 및 알림
- **마감일 관리**: 정책 신청 마감일 자동 등록
- **로컬 알림**: 중요 일정 푸시 알림
- **일정 동기화**: 캘린더 통합 관리

### 5. 사용자 인증 및 프로필
- **회원가입/로그인**: 이메일 및 소셜 로그인 (예정)
- **프로필 관리**: 개인 정보 및 관심사 설정
- **토큰 관리**: JWT 기반 보안 인증

## 📝 개발 가이드

### Flutter 앱 개발

1. **Clean Architecture 준수**
   - `presentation` → `domain` → `data` 의존성 방향 유지
   - UI는 UseCase만 호출, Repository 직접 접근 금지
   - 모델(DTO)과 엔터티 분리

2. **상태 관리**
   - Provider/Riverpod 사용 예정
   - `presentation/providers/`에 상태 관리 로직 배치

3. **코딩 규칙**
   - `analysis_options.yaml` 기반 lints 준수
   - Flutter 공식 스타일 가이드 따르기
   - 의미 있는 변수명 및 함수명 사용

4. **에러 핸들링**
   - `core/error/`의 Exception과 Failure 활용
   - 사용자 친화적인 에러 메시지 표시

5. **테스트 작성**
   - Unit Test: 비즈니스 로직
   - Widget Test: UI 컴포넌트
   - Integration Test: 전체 흐름

### 백엔드 API 개발

1. **RESTful API 설계**
   - 명확한 엔드포인트 네이밍
   - HTTP 메서드 적절히 사용 (GET, POST, PUT, DELETE)
   - 상태 코드 정확히 반환

2. **데이터베이스 설계**
   - 정규화된 테이블 구조
   - 인덱스 최적화
   - 마이그레이션 관리

3. **보안**
   - JWT 토큰 검증
   - 입력값 검증 및 sanitization
   - CORS 설정
   - Rate limiting

4. **AI 통합**
   - OpenAI API 연동
   - 프롬프트 엔지니어링
   - 응답 캐싱 및 최적화

## 🐛 트러블슈팅

### Flutter 관련

**iOS Pod 관련 오류**
```bash
cd ios
pod deintegrate
pod install
cd ..
```

**빌드 오류 발생 시**
```bash
flutter clean
flutter pub get
flutter pub upgrade
```

**Android 빌드 문제**
- `android/app/build.gradle`에서 minSdkVersion 확인
- Android Studio에서 Gradle 동기화

**로컬 알림이 작동하지 않을 때**
- iOS: Info.plist에 권한 설정 확인
- Android: AndroidManifest.xml 및 채널 생성 확인

### 백엔드 관련

**서버 시작 오류**
```bash
# 포트 충돌 확인
lsof -i :3000

# 노드 모듈 재설치
rm -rf node_modules
npm install
```

**데이터베이스 연결 실패**
- `.env` 파일의 데이터베이스 설정 확인
- 데이터베이스 서버 실행 상태 확인

**API 응답 지연**
- 쿼리 최적화
- 캐싱 전략 검토
- API 호출 횟수 제한

## 📚 참고 자료

- [Flutter 공식 문서](https://flutter.dev/docs)
- [Dart 공식 문서](https://dart.dev/guides)
- [Clean Architecture in Flutter](https://resocoder.com/flutter-clean-architecture-tdd/)
- [Provider 패키지](https://pub.dev/packages/provider)
- [Node.js 공식 문서](https://nodejs.org/docs)
- [Express.js 가이드](https://expressjs.com/guide)

## 📄 라이선스

본 프로젝트는 해커톤/프로토타입 용도로 시작되었으며, 별도 고지 전까지는 내부 사용을 전제로 합니다.

## 👥 팀 정보

e:um은 청년들의 더 나은 미래를 위해 노력하는 팀입니다.

---

**Made with ❤️ by e:um Team**
