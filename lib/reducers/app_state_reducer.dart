import 'package:flutter_mvp/models/app_state.dart';
import 'package:flutter_mvp/reducers/beers_reducer.dart';
import 'package:flutter_mvp/reducers/current_page_reducer.dart';
import 'package:flutter_mvp/reducers/loading_reducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    isLoading: loadingReducer(state.isLoading, action),
    beers: beersReducer(state.beers, action),
    currentPage: currentPageReducer(state.currentPage, action),
  );
}