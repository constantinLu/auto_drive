import 'package:flutter/material.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Card(
          elevation: 5,
          child: Center(child: Text("This will be the reminders, for insurance, etc"))),
    );
  }
}
