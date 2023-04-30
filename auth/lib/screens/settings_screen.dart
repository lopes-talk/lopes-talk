import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/models/user.dart';
import 'package:lopes_talk/providers/user_provider.dart';
import 'package:lopes_talk/widgets/big_card.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final pronouns = user!.pronouns;
    final fristName = user.firstName;
    final lastName = user.lastName;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
      appBar: AppBar(
        title: const Text(
          'Settings',
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
            BigCard(
                title: 'Profile',
                body: "Pronouns: $pronouns\nName: $fristName $lastName"),
          ],
        ),
      ),
    );
  }
}
