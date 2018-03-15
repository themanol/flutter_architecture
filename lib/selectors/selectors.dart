import 'package:flutter_mvp/models/app_state.dart';
import 'package:flutter_mvp/models/beer.dart';

bool isLoadingSelector(AppState state) => state.isLoading;

List<Beer> beersSelector(AppState state) => state.beers;

int currentPageSelector(AppState state) => state.currentPage;