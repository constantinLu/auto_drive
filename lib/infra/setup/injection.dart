import 'package:auto_drive/application/bloc/scraper/scraper_bloc.dart';
import 'package:auto_drive/application/bloc/theme_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../service/scraper_service.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
void setup() {
  getIt.registerSingleton<ScraperService>(ScraperService());
  getIt.registerSingleton<ScraperBloc>(ScraperBloc());
  getIt.registerSingleton<ThemeBloc>(ThemeBloc());
  //print(getIt.isRegistered<ScraperService>());
  //getIt.init();
}
