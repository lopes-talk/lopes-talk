import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/journey.dart';
import 'apiServiceProvider.dart';

final journeyListProvider = FutureProvider<List<Journey>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  final journeys = await apiService.getJourneys();
  return journeys;
});
