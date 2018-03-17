import 'package:flutter_mvp/actions/actions.dart';
import 'package:flutter_mvp/models/beer.dart';
import 'package:redux/redux.dart';


final beersReducer = combineTypedReducers<List<Beer>>([
  new ReducerBinding<List<Beer>, BeersPageLoadedAction>(_setLoadedBeersPage),
]);

List<Beer> _setLoadedBeersPage(List<Beer> state, BeersPageLoadedAction action) {
  List<Beer> newState = new List.from(state);
  newState.addAll(action.beers);
  return newState;
}
