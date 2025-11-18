import '../model/policy_data.dart';

final String testUserName = "김남훈";
final String testUserRegion = "성동구";
final String testUserTag = "대학생";

final testPolicies = [
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
  PolicyViewData(
    title: "국가장학금 Ⅰ유형",
    category: "교육",
    deadline: "2025-12-31",
    description: "대학생 등록금 부담 완화를 위한 소득 연계 맞춤형 장학금",
    summary: "",
    matchRate: 95,
  ),
];