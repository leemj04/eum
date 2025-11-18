import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime(2026, 1, 1);
  DateTime? _selectedDay;

  // 더미 데이터 (나중에 컨트롤러 / API 연동)
  // 날짜별로 한 가지 카테고리만 있는 걸로 가정
  final Map<DateTime, PolicyCategory> _events = {
    DateTime(2026, 1, 2): PolicyCategory.job,        // 핑크
    DateTime(2026, 1, 14): PolicyCategory.welfare,   // 하늘색
    DateTime(2026, 1, 16): PolicyCategory.housing,   // 파란색
  };

  PolicyCategory? _getCategoryForDay(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return _events[key];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== 상단 타이틀 =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '캘린더',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '저장한 정책을 한눈에 확인하고 관리하세요!',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.calendar_today_outlined,
                    size: 24,
                    color: Color(0xFF111827),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Divider(height: 1, color: Color(0xFFE5E7EB)),
            const SizedBox(height: 16),

            // ===== 캘린더 카드 =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                locale: 'ko_KR',
                daysOfWeekHeight: 32,
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextFormatter: (date, locale) =>
                  '${date.year}년 ${date.month}월',
                  leftChevronIcon: const Icon(Icons.chevron_left, size: 20),
                  rightChevronIcon: const Icon(Icons.chevron_right, size: 20),
                  headerPadding: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  weekendTextStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                  defaultTextStyle: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF4B5563),
                  ),
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  selectedDecoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF111827),
                  ),
                  selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9CA3AF),
                  ),
                  weekendStyle: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                selectedDayPredicate: (day) =>
                _selectedDay != null &&
                    day.year == _selectedDay!.year &&
                    day.month == _selectedDay!.month &&
                    day.day == _selectedDay!.day,
                onDaySelected: (selected, focused) {
                  setState(() {
                    _selectedDay = selected;
                    _focusedDay = focused;
                  });
                },
                onPageChanged: (focused) {
                  _focusedDay = focused;
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    final category = _getCategoryForDay(day);
                    if (category == null) {
                      return Center(
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                      );
                    }
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: category.color,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                  todayBuilder: (context, day, focusedDay) {
                    final category = _getCategoryForDay(day);
                    if (category == null) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF111827),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }
                    // today + event일 때는 이벤트 색 유지
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: category.color,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ===== 카테고리 범례 =====
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: PolicyCategory.values
                  .map((c) => _CategoryLegendDot(category: c))
                  .toList(),
            ),

            const SizedBox(height: 24),
            const Divider(height: 1, color: Color(0xFFE5E7EB)),
            const SizedBox(height: 16),

            // ===== 하단 일정 리스트 (간단 버전) =====
            Text(
              '${_focusedDay.year}-${_focusedDay.month}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),

            ..._events.entries
                .where((e) =>
            e.key.year == _focusedDay.year &&
                e.key.month == _focusedDay.month)
                .toList()
                .map(
                  (e) => _EventRow(
                date: e.key,
                category: e.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===============================
// 카테고리 정의
// ===============================
enum PolicyCategory {
  housing,      // 주거 (파랑)
  education,    // 교육
  job,          // 일자리 (핑크)
  welfare,      // 복지문화 (하늘/노랑)
  participation // 참여권리 (연두)
}

extension PolicyCategoryExt on PolicyCategory {
  String get label {
    switch (this) {
      case PolicyCategory.housing:
        return '주거';
      case PolicyCategory.education:
        return '교육';
      case PolicyCategory.job:
        return '일자리';
      case PolicyCategory.welfare:
        return '복지문화';
      case PolicyCategory.participation:
        return '참여권리';
    }
  }

  Color get color {
    switch (this) {
      case PolicyCategory.housing:
        return const Color(0xFF4C6FFF); // 파랑
      case PolicyCategory.education:
        return const Color(0xFF6366F1); // 보라빛 파랑
      case PolicyCategory.job:
        return const Color(0xFFE879F9); // 핑크
      case PolicyCategory.welfare:
        return const Color(0xFF7DD3FC); // 하늘색
      case PolicyCategory.participation:
        return const Color(0xFF6EE7B7); // 연두
    }
  }
}

// ===============================
// 범례 Dot 위젯
// ===============================
class _CategoryLegendDot extends StatelessWidget {
  final PolicyCategory category;

  const _CategoryLegendDot({required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: category.color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          category.label,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF4B5563),
          ),
        ),
      ],
    );
  }
}

// ===============================
// 하단 일정 한 줄
// ===============================
class _EventRow extends StatelessWidget {
  final DateTime date;
  final PolicyCategory category;

  const _EventRow({
    required this.date,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final dayText = '${date.month}월 ${date.day}일';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: category.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            dayText,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            category.label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}
