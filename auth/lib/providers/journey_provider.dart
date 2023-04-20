import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/journey.dart';
import '../providers/api_service_provider.dart';

final journeyListProvider = FutureProvider<List<Journey>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  final journeys = await apiService.getJourneys();
  return journeys;
});

final activeJourneyProvider = FutureProvider<Journey?>((ref) async {
  try {
    final journeys = await ref.watch(journeyListProvider.future);

    // Find the active journey in the list
    final activeJourney = journeys.firstWhere((journey) => journey.active);

    return activeJourney;
  } catch (err) {
    return null;
  }
});
