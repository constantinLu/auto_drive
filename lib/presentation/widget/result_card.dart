import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String? text;
  final Function() onTap;

  ResultCard({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text ?? ""),
        ),
      ),
    );
  }
}
