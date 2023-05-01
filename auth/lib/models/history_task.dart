class HistoryTask {
  String id;
  String name;
  DateTime? dateCompleted;
  String userId;

  HistoryTask({
    required this.id,
    required this.name,
    required this.dateCompleted,
    required this.userId,
  });

  // Convert JSON to HistoryTask object
  factory HistoryTask.fromJson(Map<String, dynamic> json) {
    return HistoryTask(
      id: json['id'],
      name: json['name'],
      dateCompleted: json['dateCompleted'] != null
          ? DateTime.parse(json['dateCompleted'])
          : null, // Handle the null case here
      userId: json['userId'],
    );
  }

  // Convert Task object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dateCompleted': dateCompleted?.toIso8601String(),
      'userId': userId,
    };
  }
}
