import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'apiServiceProvider.dart';
import '../models/task.dart';

final taskListProvider = FutureProvider<List<Task>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  final tasks = await apiService.getTasks();
  return tasks;
});
