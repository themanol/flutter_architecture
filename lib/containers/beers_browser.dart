import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mvp/actions/actions.dart';
import 'package:flutter_mvp/models/app_state.dart';
import 'package:flutter_mvp/models/beer.dart';
import 'package:flutter_mvp/presentation/beer_list.dart';
import 'package:flutter_mvp/selectors/selectors.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class BeersBrowser extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return new BeerList(
          beers: vm.beers,
        );
      },
    );
  }

}

class _ViewModel {
  final List<Beer> beers;
  final bool loading;
  final Function onEndScroll;

  _ViewModel({
    @required this.beers,
    @required this.loading,
    @required this.onEndScroll
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
        beers: beersSelector(store.state),
        loading: isLoadingSelector(store.state),
        onEndScroll: () {
          store.dispatch(new LoadBeersPageAction(currentPageSelector(store.state)));
        }
    );
  }

}