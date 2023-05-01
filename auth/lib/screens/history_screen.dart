import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/models/history_task.dart';
import 'package:lopes_talk/models/task.dart';
import 'package:lopes_talk/providers/task_provider.dart';
import 'package:lopes_talk/widgets/history_task_card.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsyncValue = ref.watch(historyTaskListByUserProvider);

    return tasksAsyncValue.when(
      data: (Map<String, List<HistoryTask>> tasksByDate) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
          appBar: AppBar(
            title: const Text(
              'History',
              style: TextStyle(
                color: Color.fromRGBO(255, 253, 227, 1),
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: ListView.builder(
            itemCount: tasksByDate.length,
            itemBuilder: (context, index) {
              String date = tasksByDate.keys.elementAt(index);
              List<HistoryTask> tasks = tasksByDate[date]!;
              return HistoryCard(date: date, tasks: tasks);
            },
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('History List Error: $error'),
    );
  }
}
