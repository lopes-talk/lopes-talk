import 'package:auth/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dataserviceProvider.dart';

final dataProvider =
    FutureProvider((ref) => ref.watch(dataServiceProvider).fetchData());

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            // ignore: prefer_const_literals_to_create_immutables
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
                image: AssetImage('assets/images/LOPEY.png'),
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
              const TaskList(),
            ],
          ),
        ));
  }
}
