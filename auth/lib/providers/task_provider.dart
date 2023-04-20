import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/models/journey.dart';
import 'package:lopes_talk/providers/journey_provider.dart';
import '../providers/api_service_provider.dart';
import '../models/task.dart';

final taskListProvider = FutureProvider.family<List<Task>, Journey>(
  (ref, journey) async {
    final apiService = ref.read(apiServiceProvider);

    final tasks = await apiService.getTasks(journey);
    return tasks;
  },
);

final taskListByUserProvider = FutureProvider<Map<String, List<Task>>>(
  (ref) async {
    final apiService = ref.read(apiServiceProvider);

    final tasks = await apiService.getTasksByUser();
    return tasks;
  },
);

final activeTaskListProvider = FutureProvider<List<Task>>(
  (ref) async {
    final apiService = ref.read(apiServiceProvider);
    final activeJourneyAsyncValue = ref.watch(activeJourneyProvider);

    // Use maybeWhen to safely access the active journey
    Journey? activeJourney = activeJourneyAsyncValue.maybeWhen<Journey?>(
      data: (Journey? journey) => journey,
      orElse: () => null,
    );

    if (activeJourney == null) {
      return []; // Return an empty list if activeJourney is null
    }

    final tasks = await apiService.getTasks(activeJourney);
    return tasks;
  },
);
