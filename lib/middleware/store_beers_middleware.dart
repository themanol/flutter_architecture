import 'package:flutter_mvp/actions/actions.dart';
import 'package:flutter_mvp/data/beers_data.dart';
import 'package:flutter_mvp/data/beers_data_impl.dart';
import 'package:flutter_mvp/models/app_state.dart';
import 'package:flutter_mvp/models/beer.dart';
import 'package:flutter_mvp/selectors/selectors.dart';
import 'package:redux/redux.dart';

const PER_PAGE = 25;

List<Middleware<AppState>> createStoreBeersMiddleware([
  BeerRepository repository = const BeerRepositoryImpl()
]) {
  final loadBeers = _createLoadBeers(repository);

  return combineTypedMiddleware([
    new MiddlewareBinding<AppState, LoadBeersPageAction>(loadBeers)
  ]);
}


Middleware<AppState> _createLoadBeers(BeerRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.getBeers(currentPageSelector(store.state) + 1, PER_PAGE).then(
          (beers) {
        store.dispatch(
            new BeersPageLoadedAction(
              currentPageSelector(store.state) + 1,
              beers.map(Beer.fromEntity).toList(),
            )
        );
      },
    ); //.catchError((_) => store.dispatch(new TodosNotLoadedAction()));
    next(action);
  };
}