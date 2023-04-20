import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/models/task.dart';
import 'package:lopes_talk/providers/api_service_provider.dart';
import 'package:lopes_talk/providers/task_provider.dart';

class HomeTaskCard extends ConsumerWidget {
  const HomeTaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

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
                        fontSize: 15,
                        color: Color.fromRGBO(234, 225, 186, 1),
                      ),
                    ),
                  ),
                  // Conditionally show the 'Complete' button based on task.status
                  task.status == false
                      ? ElevatedButton(
                          onPressed: () async {
                            task.status = true;
                            task.dateCompleted = DateTime.now();
                            final apiService = ref.read(apiServiceProvider);
                            final updated = await apiService.updateTask(task);

                            if (updated) {
                              // Refresh task lists
                              ref.refresh(activeTaskListProvider);
                              ref.refresh(taskListByUserProvider);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(171, 178, 109, 1),
                            minimumSize: const Size(250, 29),
                          ),
                          child: const Text(
                            'Complete',
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
