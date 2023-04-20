import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/models/journey.dart';
import 'package:lopes_talk/providers/journey_provider.dart';
import 'package:lopes_talk/widgets/journey_path_card.dart';

class JourneyPathScreen extends ConsumerWidget {
  const JourneyPathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journeysAsyncValue = ref.watch(journeyListProvider);
    final activeJourneyAsyncValue = ref.watch(activeJourneyProvider);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
      appBar: AppBar(
        title: const Text(
          'Journey Paths',
          style: TextStyle(
            color: Color.fromRGBO(255, 253, 227, 1),
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: journeysAsyncValue.when(
        data: (List<Journey> journeys) {
          return ListView.builder(
            itemCount: journeys.length,
            itemBuilder: (context, index) {
              return JourneyPathCard(journey: journeys[index]);
            },
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text('Journey List Error: $error'),
      ),
    );
  }
}
