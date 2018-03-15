import 'package:flutter_mvp/actions/actions.dart';
import 'package:redux/redux.dart';


final currentPageReducer = combineTypedReducers<int>([
  new ReducerBinding<int, BeersPageLoadedAction>(_pageReducer)
]);

int _pageReducer(int state, BeersPageLoadedAction action) {
  return action.page;
}
