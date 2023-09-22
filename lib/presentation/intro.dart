import 'dart:async';

import 'package:auto_drive/presentation/tabs.dart';
import 'package:flutter/material.dart';

import '../infra/util/assets.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    super.initState();
    delayScreen();
  }

  delayScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Tabs()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(imageIntro),
      ),
    );
  }
}
