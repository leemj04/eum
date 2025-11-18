import 'package:eum/constant/test_data.dart';
import 'package:flutter/material.dart';
import '../../../widgets/policy_card.dart';

class FindPolicyPage extends StatefulWidget {
  const FindPolicyPage({super.key});

  @override
  State<FindPolicyPage> createState() => _FindPolicyPageState();
}

class _FindPolicyPageState extends State<FindPolicyPage> {
  
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              "정책 탐색",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "카테고리 별로 다양한 청년 정책을 살펴보세요!",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

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
                      fontWeight: FontWeight.w600,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected
                            ? const Color(0xFF7D8FFF)
                            : Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                    showCheckmark: false,
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(width: 8),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "내 조건에 맞는 정책",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.separated(
                itemCount: testPolicies.length,
                itemBuilder: (context, index) {
                  return PolicyCard(
                    policy: testPolicies[index],
                    // onTap: () { ... }  // 팝업도 여기서 나중에 연결 가능
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(height: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
