import 'package:flutter_mvp/actions/actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineTypedReducers<bool>([
  new ReducerBinding<bool, BeersPageLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}