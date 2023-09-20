import 'package:auto_drive/util/palette.dart';
import 'package:flutter/material.dart';

import 'widget/intro.dart';

void main() {
  runApp(const MyApp());
}

const APP_NAME = 'Auto Drive';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //TODO: add logo and auth by fingerprint
      //TODO: add logo and wait for 0.5 seconds to go to the home screen
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //useMaterial3: true
        colorScheme: ColorScheme.fromSwatch(primarySwatch:Palette.white)
            .copyWith(secondary: Palette.white),
      ),
      home: const Intro(),
    );
  }
}
