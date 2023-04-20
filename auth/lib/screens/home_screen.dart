import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/models/journey.dart';
import 'package:lopes_talk/models/task.dart';
import 'package:lopes_talk/providers/journey_provider.dart';
import 'package:lopes_talk/providers/task_provider.dart';
import 'package:lopes_talk/widgets/home_task_card.dart';
import '../providers/dataservice_provider.dart';

final dataProvider =
    FutureProvider((ref) => ref.watch(dataServiceProvider).fetchData());

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeJourneyAsyncValue = ref.watch(activeJourneyProvider);
    // listens for task update events
    ref.watch(activeTaskListProvider);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Color.fromRGBO(255, 253, 227, 1),
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ref.watch(dataProvider).when(
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stackTrace) =>
                        Text('Home Screen Error: $error'),
                    data: (data) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data[0]['quote'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '- ${data[0]['author'] as String}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
            const Divider(
              color: Colors.black,
              height: 25,
              thickness: 1,
              indent: 30,
              endIndent: 30,
            ),
            const Image(
              width: 450,
              height: 350,
              image: AssetImage('assets/images/LOPEY_3.png'),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Text(
                'Journey Path',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Zeyada',
                  color: Color.fromRGBO(138, 104, 34, 1),
                ),
              ),
            ),
            activeJourneyAsyncValue.when(
              data: (Journey? activeJourney) {
                if (activeJourney == null) {
                  return const Center(child: Text('Follow a journey path!'));
                }
                final tasksAsyncValue = ref.watch(activeTaskListProvider);
                return tasksAsyncValue.when(
                  data: (List<Task> tasks) {
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return HomeTaskCard(task: tasks[index]);
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => Text('Task List Error: $error'),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Active Journey Error: $error'),
            ),
          ],
        ),
      ),
    );
  }
}
