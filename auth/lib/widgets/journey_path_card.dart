import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/models/journey.dart';
import 'package:lopes_talk/providers/api_service_provider.dart';
import 'package:lopes_talk/providers/journey_provider.dart';
import 'package:lopes_talk/screens/journey_tasks_screen.dart';

class JourneyPathCard extends ConsumerWidget {
  const JourneyPathCard({Key? key, required this.journey}) : super(key: key);

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
                      journey.name,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        color: Color.fromRGBO(234, 225, 186, 1),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        JourneyTasksScreen(journey: journey),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(171, 178, 109, 1),
                              ),
                              child: const Text(
                                'See More',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !journey.active,
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  final apiService =
                                      ref.read(apiServiceProvider);
                                  final journeys = ref
                                      .watch(journeyListProvider)
                                      .maybeWhen<List<Journey>>(
                                        data: (List<Journey> journeys) =>
                                            journeys,
                                        orElse: () => [],
                                      );
                                  await apiService.updateJourney(
                                      journeys, journey);
                                  ref.refresh(activeJourneyProvider);
                                  ref.refresh(journeyListProvider);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(171, 178, 109, 1),
                                ),
                                child: const Text(
                                  'Follow Path',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
