import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mvp/models/app_state.dart';
import 'package:flutter_mvp/models/beer.dart';
import 'package:flutter_mvp/presentation/beer_details_screen.dart';
import 'package:flutter_mvp/selectors/selectors.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


class BeerDetails extends StatelessWidget {

  final int id;

  BeerDetails({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) {
        return new _ViewModel.from(store, id);
      },
      builder: (context, vm) {
        return new BeerDetailsScreen(
          beer: vm.beer,
        );
      },
    );
  }
}

class _ViewModel {
  final Beer beer;

  _ViewModel({
    @required this.beer,
  });

  factory _ViewModel.from(Store<AppState> store, int id) {
    final beer = beerSelector(beersSelector(store.state), id);
    return new _ViewModel(
      beer: beer,
    );
  }
}
