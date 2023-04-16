import 'package:auth/providers/journeyProvider.dart';
import 'package:auth/widgets/journeyPathCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/journey.dart';

class JourneyList extends ConsumerWidget {
  const JourneyList({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journeysAsyncValue = ref.watch(journeyListProvider);

    return journeysAsyncValue.when(
      data: (List<Journey> journeys) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: journeys
                  .map((journey) => JourneyPathCard(
                      title: journey.name, body: '', active: journey.active))
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
