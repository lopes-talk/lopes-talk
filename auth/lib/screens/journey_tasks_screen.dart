import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/models/journey.dart';
import 'package:lopes_talk/models/task.dart';
import 'package:lopes_talk/providers/task_provider.dart';
import 'package:lopes_talk/screens/add_task_screen.dart';
import 'package:lopes_talk/widgets/journey_task_card.dart';

class JourneyTasksScreen extends ConsumerWidget {
  const JourneyTasksScreen({Key? key, required this.journey}) : super(key: key);

  final Journey journey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsyncValue = ref.watch(taskListProvider(journey));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
      appBar: AppBar(
        title: Text(
          journey.name,
          style: const TextStyle(
            color: Color.fromRGBO(255, 253, 227, 1),
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTaskScreen(
                      journey: journey,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(171, 178, 109, 1),
                minimumSize: const Size(100, 29),
              ),
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: tasksAsyncValue.when(
              data: (List<Task> tasks) {
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return JourneyTasksCard(
                      journey: journey,
                      task: tasks[index],
                    );
                  },
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Task List Error: $error'),
            ),
          ),
        ],
      ),
    );
  }
}
