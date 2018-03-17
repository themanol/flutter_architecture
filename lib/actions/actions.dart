import 'package:flutter_mvp/models/beer.dart';


class LoadBeersPageAction {
  final int page;

  LoadBeersPageAction(this.page);
}

class BeersPageLoadedAction{
  final int page;
  final List<Beer> beers;

  BeersPageLoadedAction(this.page, this.beers);

  @override
  String toString() {
    return 'BeersPageLoaded{page: $page, beers: $beers}';
  }

}

