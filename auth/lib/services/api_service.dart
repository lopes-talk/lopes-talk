import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lopes_talk/providers/user_provider.dart';
import '../models/user.dart';
import '../models/task.dart';
import '../models/journey.dart';

class ApiService {
  final String baseUrl;
  final UserNotifier userNotifier;

  ApiService({required this.baseUrl, required this.userNotifier});

  // Get Tasks
  Future<List<Task>> getTasks(Journey activeJourney) async {
    final response = await http.post(
      Uri.parse('$baseUrl/task/journey'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(activeJourney.toJson()),
    );
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      List<dynamic> taskData = responseData['data'];
      List<Task> tasks =
          taskData.map((taskData) => Task.fromJson(taskData)).toList();
      return tasks;
    } else {
      throw Exception('Failed to load tasks');
    }
  }

// Get Tasks By User
  Future<Map<String, List<Task>>> getTasksByUser() async {
    User? user = userNotifier.getUser();

    if (user != null) {
      final response = await http.post(
        Uri.parse('$baseUrl/task/user'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user.toJson()),
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        List<dynamic> taskData = responseData['data'];
        List<Task> tasks =
            taskData.map((taskData) => Task.fromJson(taskData)).toList();

        // Filter tasks with task.status = true
        tasks = tasks.where((task) => task.status == true).toList();

        // Sort tasks by task.dateCompleted in descending order
        tasks.sort((a, b) =>
            (b.dateCompleted ?? DateTime.fromMicrosecondsSinceEpoch(0))
                .compareTo(
                    a.dateCompleted ?? DateTime.fromMicrosecondsSinceEpoch(0)));

        // Group tasks by date
        Map<String, List<Task>> groupedTasks = {};
        for (Task task in tasks) {
          if (task.dateCompleted != null) {
            String dateStr =
                task.dateCompleted!.toIso8601String().split('T')[0];
            if (groupedTasks.containsKey(dateStr)) {
              groupedTasks[dateStr]!.add(task);
            } else {
              groupedTasks[dateStr] = [task];
            }
          }
        }
        return groupedTasks;
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
        var responseData = json.decode(response.body);
        List<dynamic> journeysData = responseData['data'];
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
  Future<bool> createTask(String name, String userId, String journeyId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/task'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "name": name,
        "userId": userId,
        "journeyId": journeyId,
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print('Failed to create task');
      return false;
    }
  }

  // Update Task
  Future<bool> updateTask(Task task) async {
    final response = await http.put(
      Uri.parse('$baseUrl/task'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Failed to update task');
      return false;
    }
  }

  // Delete Task
  Future<bool> deleteTask(Task task) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/task'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Failed to delete task with status code ${response.statusCode}');
      return false;
    }
  }

  // Create Journey
  Future<Journey> createJourney(Journey journey) async {
    final response = await http.post(
      Uri.parse('$baseUrl/journeys'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(journey.toJson()),
    );

    if (response.statusCode == 200) {
      return Journey.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create journey');
    }
  }

  Future<List<Journey>> updateJourney(
      List<Journey> journeys, Journey activeJourney) async {
    List<Journey> updatedJourneys = [];

    for (Journey journey in journeys) {
      if (journey.id == activeJourney.id) {
        journey.active = true;
      } else {
        journey.active = false;
      }

      final response = await http.put(
        Uri.parse('$baseUrl/journey'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(journey.toJson()),
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        updatedJourneys.add(Journey.fromJson(responseData['data']));
      } else {
        throw Exception('Failed to update journey');
      }
    }

    return updatedJourneys;
  }
}
