import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvp/containers/app_loading.dart';
import 'package:flutter_mvp/models/beer.dart';
import 'package:flutter_mvp/presentation/beer_keys.dart';
import 'package:flutter_mvp/presentation/loading_indicator.dart';
import 'package:flutter_mvp/presentation/beer_item.dart';

class BeerList extends StatelessWidget {

  final List<Beer> beers;


  BeerList({
    Key key,
    @required this.beers,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new AppLoading(builder: (context, loading) {
      return loading
          ? new LoadingIndicator(key: BeerKeys.beersLoading)
          : _buildListView();
    });
  }

  ListView _buildListView() {
    return new ListView.builder(
      key: BeerKeys.beersList,
      itemCount: beers.length,
      itemBuilder: (BuildContext context, int index) {
        final beer = beers[index];
        return new BeerItem(
          beer: beer,
          onTap: () => _onBeerTap(context, beer),
        );
      },
    );
  }

  _onBeerTap(BuildContext context, Beer beer) {}

}