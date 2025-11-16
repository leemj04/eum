abstract class CalendarRepository {
  Future<void> getEvents();
  Future<void> addEvent(Map<String, dynamic> event);
  Future<void> updateEvent(String id, Map<String, dynamic> patch);
  Future<void> deleteEvent(String id);
}

