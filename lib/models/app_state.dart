import 'package:flutter_mvp/models/beer.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Beer> beers;
  final num currentPage;

  AppState({this.isLoading = false,
    this.beers = const [],
    this.currentPage = 0
  });

  factory AppState.loading() => new AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    List<Beer> beers,
  }) {
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      beers: beers ?? this.beers
    );
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      beers.hashCode ^
      currentPage.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading &&
              beers == other.beers &&
              currentPage == other.currentPage;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, beers: $beers, currentPage: $currentPage}';
  }
}