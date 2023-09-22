part of 'scraper_bloc.dart';

@freezed
class ScraperState with _$ScraperState {
  const factory ScraperState.initial() = InitialState;

  const factory ScraperState.loading() = LoadingState;

  const factory ScraperState.successful(List<Fuel> fuels) = SucessfulState;

  const factory ScraperState.failed(String message) = FailedState;
}
