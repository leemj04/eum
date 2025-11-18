import 'package:flutter/foundation.dart';

import '../../../model/road_map_item.dart';

class RoadMapController extends ChangeNotifier {
  List<RoadMapItem> items = [];

  Future<void> loadDummy() async {
    items = [
      RoadMapItem(
        id: 1,
        totalPolicies: 0,
        completedPolicies: 0,
        plannedCount: 0,
        inProgressCount: 0,
        doneCount: 0,
        receivedBenefits: 0,
        isEmptyCard: true,   // 로드맵 1은 비어있는 템플릿 UI
      ),
      RoadMapItem(
        id: 2,
        totalPolicies: 4,
        completedPolicies: 0,
        plannedCount: 4,
        inProgressCount: 0,
        doneCount: 0,
        receivedBenefits: 0,
      ),
    ];

    notifyListeners();
  }
}
