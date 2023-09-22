import 'package:auto_drive/application/bloc/scraper/scraper_bloc.dart';
import 'package:auto_drive/application/bloc/theme_bloc.dart';
import 'package:auto_drive/domain/model/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../infra/app_setup.dart';
import '../infra/setup/injection.dart';
import '../infra/util/constants.dart';
import 'intro.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final _appRouter = getIt<AppRouter>();

    App.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeBloc>()),
        BlocProvider(create: (context) => getIt<ScraperBloc>()),
      ],
      child: MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData(false, context),
        home: Intro(),
      ),
    );
  }
}
