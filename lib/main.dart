import 'package:flutter/material.dart';
import 'package:flutter_mvp/actions/actions.dart';
import 'package:flutter_mvp/middleware/store_beers_middleware.dart';
import 'package:flutter_mvp/models/app_state.dart';
import 'package:flutter_mvp/presentation/home_screen.dart';
import 'package:flutter_mvp/reducers/app_state_reducer.dart';
import 'package:flutter_mvp/routes.dart';
import 'package:flutter_mvp/selectors/selectors.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState.loading(),
    middleware: createStoreBeersMiddleware(),
  );


  MyApp();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        title: "Beers",
        theme: new ThemeData.light(),
        routes: {
           Routes.home: (context) {
            return new StoreBuilder<AppState>(
              onInit: (store) => store.dispatch(new LoadBeersPageAction(currentPageSelector(store.state))),
              builder: (context, store) {
                return new HomeScreen();
              },
            );
          }
        }
      ),
    );
  }

}

