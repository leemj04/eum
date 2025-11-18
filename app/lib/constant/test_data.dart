import '../model/policy_data.dart';

final String testUserName = "김남훈";
final String testUserRegion = "성동구";
final String testUserTag = "대학생";

final testPolicies = [
  PolicyViewData(
    title: "청년 지원 정책 1",
    category: "취업",
    deadline: "2024-12-31",
    description: "이 정책은 청년들의 취업을 지원하기 위한 다양한 프로그램과 혜택을 제공합니다.",
    summary: "이 정책은 청년들의 취업을 지원하기 위한 다양한 프로그램과 혜택을 제공합니다.",
    matchRate: 95,
    isUrgent: true,
  ),
  PolicyViewData(
    title: "청년 지원 정책 2",
    category: "창업",
    deadline: "2024-11-30",
    description: "이 정책은 청년 창업가들을 위한 자금 지원 및 멘토링 프로그램을 포함합니다.",
    summary: "이 정책은 청년 창업가들을 위한 자금 지원 및 멘토링 프로그램을 포함합니다.",
    matchRate: 88,
  ),
  PolicyViewData(
    title: "청년 지원 정책 3",
    category: "주거",
    deadline: "2024-10-15",
    description: "이 정책은 청년들의 주거 안정을 위해 저렴한 임대주택과 주거비 지원을 제공합니다.",
    summary: "이 정책은 청년들의 주거 안정을 위해 저렴한 임대주택과 주거비 지원을 제공합니다.",
    matchRate: 76,
  ),
];