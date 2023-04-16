class Task {
  String id;
  String name;
  bool status;
  DateTime dateCompleted;
  String userId;
  String journeyId;

  Task({
    required this.id,
    required this.name,
    required this.status,
    required this.dateCompleted,
    required this.userId,
    required this.journeyId,
  });

  // Convert JSON to Task object
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      dateCompleted: DateTime.parse(json['dateCompleted']),
      userId: json['userId'],
      journeyId: json['journeyId'],
    );
  }

  // Convert Task object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'dateCompleted': dateCompleted.toIso8601String(),
      'userId': userId,
      'journeyId': journeyId,
    };
  }
}
