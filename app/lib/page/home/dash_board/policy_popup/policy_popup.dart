// lib/widgets/policy_detail_dialog.dart
import 'package:flutter/material.dart';

class PolicyDetailDialog extends StatelessWidget {
  final String title;
  final String deadline;
  final String summary;

  const PolicyDetailDialog({
    super.key,
    required this.title,
    required this.deadline,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: SizedBox(
        height: height * 0.78,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목 + 닫기 버튼
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.close, size: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // 마감일 + 마감 임박
                    Row(
                      children: [
                        const Icon(
                          Icons.event_note_outlined,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          deadline,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '마감 임박',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // 요약
                    Text(
                      summary,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 24),
                    const _SectionTitle('지원 내용'),
                    const SizedBox(height: 6),
                    const Text(
                      '최대 1억 원까지 연 1.5~2.7% 금리로 대출 지원',
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),

                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),

                    const _SectionTitle('자격 조건'),
                    const SizedBox(height: 6),
                    const _NumberedList(items: [
                      '만 19세 ~ 34세 청년',
                      '무주택 세대구성원',
                      '연 소득 5,000만원 이하',
                    ]),

                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),

                    const _SectionTitle('필요 서류'),
                    const SizedBox(height: 6),
                    const _NumberedList(items: [
                      '신분증',
                      '임대차계약서',
                      '소득증빙서류',
                      '주민등록등본',
                    ]),

                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),

                    const _SectionTitle('신청 기간'),
                    const SizedBox(height: 6),
                    const Text(
                      '2025-11-01 ~ 2025-12-31',
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),

            // 하단 버튼 영역
            Padding(
              padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding:
                        const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        // TODO: 캘린더 저장
                      },
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                      ),
                      label: const Text('캘린더에 저장'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4C6FFF),
                        foregroundColor: Colors.white,
                        padding:
                        const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        // TODO: 신청하기 링크 이동
                      },
                      icon: const Icon(Icons.login, size: 18),
                      label: const Text('신청하기'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _NumberedList extends StatelessWidget {
  final List<String> items;

  const _NumberedList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < items.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              '${i + 1}. ${items[i]}',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ),
      ],
    );
  }
}