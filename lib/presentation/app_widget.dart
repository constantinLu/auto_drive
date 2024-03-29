import 'package:auto_drive/application/bloc/scraper/scraper_bloc.dart';
import 'package:auto_drive/application/bloc/theme_bloc.dart';
import 'package:auto_drive/domain/extensions/sizeup.dart';
import 'package:auto_drive/presentation/app_theme.dart';
import 'package:auto_drive/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/extensions/util.dart';
import '../infra/app_setup.dart';
import '../infra/setup/injection.dart';
import '../infra/util/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    App.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeBloc>()),
        BlocProvider(create: (context) => getIt<ScraperBloc>()),
      ],
      child: Sizeup(
        builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
          return MaterialApp.router(
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            title: appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.themeData(true, context),
          );
        },
      ),
    );
  }
}
