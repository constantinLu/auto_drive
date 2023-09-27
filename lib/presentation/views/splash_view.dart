import 'dart:async';

import 'package:auto_drive/domain/extensions/route_ext.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../infra/util/assets.dart';
import '../router/app_router.gr.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    delayScreen();
  }

  delayScreen() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, () => context.push(const DashboardWidget()));
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
