import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/models/journey.dart';
import 'package:lopes_talk/models/task.dart';
import 'package:lopes_talk/providers/api_service_provider.dart';
import 'package:lopes_talk/providers/task_provider.dart';
import 'package:lopes_talk/screens/edit_task_screen.dart';

class JourneyTasksCard extends ConsumerWidget {
  const JourneyTasksCard({Key? key, required this.task, required this.journey})
      : super(key: key);

  final Task task;
  final Journey journey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Card(
            color: const Color.fromRGBO(127, 102, 74, 1),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      task.name,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        color: Color.fromRGBO(234, 225, 186, 1),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditTaskScreen(
                                      task: task,
                                      journey: journey,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(171, 178, 109, 1),
                                  minimumSize: const Size(100, 29)),
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              final apiService = ref.read(apiServiceProvider);
                              final deleted = await apiService.deleteTask(task);

                              if (deleted) {
                                // Refresh task lists
                                ref.refresh(taskListProvider(journey));
                                ref.refresh(activeTaskListProvider);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(171, 178, 109, 1),
                                minimumSize: const Size(100, 29)),
                            child: const Text(
                              'Delete',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
