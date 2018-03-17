import 'package:flutter_mvp/actions/actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineTypedReducers<bool>([
  new ReducerBinding<bool, BeersPageLoadedAction>(_setLoaded),
  new ReducerBinding<bool, LoadBeersPageAction>(_setLoading)
]);

bool _setLoaded(bool state, action) {
  return false;
}

bool _setLoading(bool state, action) {
  return true;
}