import 'package:auth/widgets/homeTaskCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';
import '../providers/taskProvider.dart';

class TaskList extends ConsumerWidget {
  const TaskList({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsyncValue = ref.watch(taskListProvider);

    return tasksAsyncValue.when(
      data: (List<Task> tasks) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: tasks
                  .map((task) => HomeTaskCard(title: task.name, body: ''))
                  .toList(),
            ),
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Journey List Error: $error'),
    );
  }
}
