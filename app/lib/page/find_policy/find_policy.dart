
import 'package:flutter/material.dart';
import '../../model/policy_data.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/policy_card.dart';

class FindPolicyPage extends StatefulWidget {
  const FindPolicyPage({super.key});

  @override
  State<FindPolicyPage> createState() => _FindPolicyPageState();
}

class _FindPolicyPageState extends State<FindPolicyPage> {
  int _currentIndex = 3;

  final List<PolicyViewData> _policies = [
    PolicyViewData(
      title: "청년 전·월세 보증금 대출",
      category: "주거",
      deadline: "2025-12-31",
      description: "청년의 주거비 부담 완화를 위한 전월세 보증금 대출 지원",
      summary: "",
      matchRate: 0, // In the image, this one doesn't have a matchRate but a "마감 임박" tag
      isUrgent: true,
    ),
    PolicyViewData(
      title: "청년 월세 특별 지원",
      category: "주거",
      deadline: "2025-12-31",
      description: "청년의 주거비 부담 완화를 위한 전월세 보증금 대출 지원",
      summary: "",
      matchRate: 95,
    ),
    PolicyViewData(
      title: "청년 내일채움공제",
      category: "취업",
      deadline: "2025-12-31",
      description: "청년 장기근속을 지원하기 위한 자산 형성 지원 사업",
      summary: "",
      matchRate: 95,
    ),
    PolicyViewData(
      title: "국가장학금 Ⅰ유형",
      category: "교육",
      deadline: "2025-12-31",
      description: "대학생 등록금 부담 완화를 위한 소득 연계 맞춤형 장학금",
      summary: "",
      matchRate: 95,
    ),
  ];

  final List<String> _categories = [
    "전체",
    "주거",
    "교육",
    "취업",
    "창업",
    "복지",
    "문화"
  ];
  String _selectedCategory = "주거";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        title: const Text("이음",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text("정책 탐색",
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("카테고리 별로 다양한 청년 정책을 살펴보세요!",
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "검색어를 입력해 주세요.",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  final isSelected = category == _selectedCategory;
                  return ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      }
                    },
                    backgroundColor: Colors.white,
                    selectedColor: const Color(0xFF7D8FFF),
                    labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: isSelected
                              ? const Color(0xFF7D8FFF)
                              : Colors.grey[300]!,
                          width: 1),
                    ),
                    showCheckmark: false,
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 8),
              ),
            ),
            const SizedBox(height: 24),
            const Text("내 조건에 맞는 정책",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _policies.length,
              itemBuilder: (context, index) {
                return PolicyCard(policy: _policies[index]);
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 12),
            ),
             const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // TODO: Navigate to other pages based on index
        },
      ),
    );
  }
}
