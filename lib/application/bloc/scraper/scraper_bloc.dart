import 'package:auto_drive/infra/setup/injection.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/fuel.dart';
import '../../../infra/service/scraper_service.dart';

part 'scraper_bloc.freezed.dart';

part 'scraper_event.dart';

part 'scraper_state.dart';

@injectable
class ScraperBloc extends Bloc<ScraperEvent, ScraperState> {
  final _scraperService = getIt<ScraperService>();

  ScraperBloc() : super(const ScraperState.initial()) {
    on<_FetchFuels>((event, emit) => getFuels(event, emit));
  }

  Future<void> getFuels(_FetchFuels event, Emitter<ScraperState> emit) async {
    try {
      emit(const ScraperState.loading());
      final fuels = await _scraperService.extractData();
      emit(ScraperState.successful(fuels));
    } catch (e) {
      emit(const ScraperState.failed("Something went wrong"));
    }
  }
}
