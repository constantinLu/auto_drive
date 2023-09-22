import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'infra/setup/injection.dart';
import 'presentation/app_widget.dart';

void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  systemOrientation();
  runApp(const MyApp());
}

Future<void> systemOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
