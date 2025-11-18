class RoadMapItem {
  final int id;                // 로드맵 번호
  final int totalPolicies;
  final int completedPolicies;
  final int plannedCount;
  final int inProgressCount;
  final int doneCount;
  final int receivedBenefits;
  final bool isEmptyCard;      // 첫 번째 로드맵처럼 내용 없이 비어있는 경우

  RoadMapItem({
    required this.id,
    required this.totalPolicies,
    required this.completedPolicies,
    required this.plannedCount,
    required this.inProgressCount,
    required this.doneCount,
    required this.receivedBenefits,
    this.isEmptyCard = false,
  });
}
