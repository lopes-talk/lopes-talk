class Task {
  String id;
  String name;
  bool status;
  String userId;
  String journeyId;

  Task({
    required this.id,
    required this.name,
    required this.status,
    required this.userId,
    required this.journeyId,
  });

  // Convert JSON to Task object
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      status: json['status'],
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
      'userId': userId,
      'journeyId': journeyId,
    };
  }
}
