import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/models/journey.dart';
import 'package:lopes_talk/models/task.dart';
import 'package:lopes_talk/providers/api_service_provider.dart';
import 'package:lopes_talk/providers/journey_provider.dart';
import 'package:lopes_talk/providers/task_provider.dart';

class EditTaskScreen extends ConsumerWidget {
  EditTaskScreen({
    super.key,
    required this.task,
    required this.journey,
  });

  final Task task;
  final Journey journey;
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    taskController.text = task.name;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
      appBar: AppBar(
        title: const Text(
          'Edit Task',
          style: TextStyle(
            color: Color.fromRGBO(255, 253, 227, 1),
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
            child: RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Task',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Clean bathroom, read book, journal...',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: ElevatedButton(
                onPressed: () async {
                  task.name = taskController.text;
                  final apiService = ref.read(apiServiceProvider);
                  final updated = await apiService.completeTask(task);

                  if (updated) {
                    // Refresh task lists
                    ref.refresh(
                      taskListProvider(journey),
                    );
                    ref.refresh(activeTaskListProvider);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(171, 178, 109, 1),
                    minimumSize: const Size(100, 29)),
                child: const Text(
                  'Edit Task',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                )),
          ),
        ],
      ),
    );
  }
}
