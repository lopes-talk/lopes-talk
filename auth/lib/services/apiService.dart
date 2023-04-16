import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/task.dart';
import '../models/journey.dart';

class ApiService {
  final String baseUrl;
  final UserNotifier userNotifier;

  ApiService({required this.baseUrl, required this.userNotifier});

  // Get Tasks
  Future<List<Task>> getTasks() async {
    User? user = userNotifier.getUser();
    if (user != null) {
      final response = await http.post(
        Uri.parse('$baseUrl/tasks'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user.toJson()),
      );
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        return jsonResponse.map((task) => Task.fromJson(task)).toList();
      } else {
        throw Exception('Failed to load tasks');
      }
    } else {
      throw Exception('User not found');
    }
  }

// Get Journeys
  Future<List<Journey>> getJourneys() async {
    User? user = userNotifier.getUser();

    if (user != null) {
      final response = await http.post(
        Uri.parse('$baseUrl/journey/user'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user.toJson()),
      );
      if (response.statusCode == 200) {
        List<dynamic> journeysData = json.decode(response.body);
        List<Journey> journeys = journeysData
            .map((journeyData) => Journey.fromJson(journeyData))
            .toList();
        return journeys;
      } else {
        throw Exception('Failed to load journeys');
      }
    } else {
      throw Exception('User not found');
    }
  }

  // Create Task
  Future<Task> createTask(Task task) async {
    final response = await http.post(
      Uri.parse('$baseUrl/tasks'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );

    if (response.statusCode == 201) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create task');
    }
  }

  // Update Task
  Future<Task> updateTask(Task task) async {
    final response = await http.put(
      Uri.parse('$baseUrl/tasks/${task.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );

    if (response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update task');
    }
  }

  // Delete Task
  Future<void> deleteTask(String taskId) async {
    final response = await http.delete(Uri.parse('$baseUrl/tasks/$taskId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete task');
    }
  }

  // Create Journey
  Future<Journey> createJourney(Journey journey) async {
    final response = await http.post(
      Uri.parse('$baseUrl/journeys'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(journey.toJson()),
    );

    if (response.statusCode == 201) {
      return Journey.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create journey');
    }
  }

  // Update Journey
  Future<Journey> updateJourney(Journey journey) async {
    final response = await http.put(
      Uri.parse('$baseUrl/journeys/${journey.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(journey.toJson()),
    );

    if (response.statusCode == 200) {
      return Journey.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update journey');
    }
  }
}
