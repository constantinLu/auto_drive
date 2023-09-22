part of 'scraper_bloc.dart';

@freezed
class ScraperEvent with _$ScraperEvent {
  const factory ScraperEvent.fetchFuels() = _FetchFuels;
}
