class Journey {
  String id;
  String name;
  String userId;
  bool active;

  Journey({
    required this.id,
    required this.name,
    required this.userId,
    required this.active,
  });

  // Convert JSON to Journey object
  factory Journey.fromJson(Map<String, dynamic> json) {
    return Journey(
      id: json['id'],
      name: json['name'],
      userId: json['userId'],
      active: json['active'],
    );
  }

  // Convert Journey object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'userId': userId,
      'active': active,
    };
  }
}
