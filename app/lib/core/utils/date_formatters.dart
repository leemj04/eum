import 'package:intl/intl.dart';

// 날짜 및 시간 관련 포맷팅 함수들을 정의합니다.
class DateFormatters {
  // 예: 2023-10-27
  static String yyyyMMdd(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // 예: 2023년 10월 27일
  static String yyyyMMddKorean(DateTime date) {
    return DateFormat('yyyy년 MM월 dd일').format(date);
  }

  // 예: 오후 2:30
  static String ampmHourMinute(DateTime date) {
    return DateFormat('a h:mm', 'ko_KR').format(date);
  }
}
