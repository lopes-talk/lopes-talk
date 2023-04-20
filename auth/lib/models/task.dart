class Task {
  String id;
  String name;
  bool status;
  DateTime? dateCompleted;
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
      dateCompleted: json['dateCompleted'] != null
          ? DateTime.parse(json['dateCompleted'])
          : null, // Handle the null case here
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
      'dateCompleted': dateCompleted?.toIso8601String(),
      'userId': userId,
      'journeyId': journeyId,
    };
  }

  var test = {
    "id": "643863e9f54b256d589516b0",
    "name": "Task 0",
    "status": false,
    "dateCompleted": null,
    "userId": "643863e7f54b256d589516a0",
    "journeyId": "643863e9f54b256d589516af"
  };
}
