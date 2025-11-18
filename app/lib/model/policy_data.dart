class PolicyViewData {
  final String title;
  final String category;
  final String deadline;
  final String description;
  final String summary;
  final int matchRate;
  final bool isUrgent;

  PolicyViewData({
    required this.title,
    required this.category,
    required this.deadline,
    required this.description,
    required this.summary,
    required this.matchRate,
    this.isUrgent = false,
  });
}