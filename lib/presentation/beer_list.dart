import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mvp/containers/app_loading.dart';
import 'package:flutter_mvp/containers/beer_details.dart';
import 'package:flutter_mvp/models/beer.dart';
import 'package:flutter_mvp/presentation/beer_keys.dart';
import 'package:flutter_mvp/presentation/loading_indicator.dart';
import 'package:flutter_mvp/presentation/beer_item.dart';

class BeerList extends StatelessWidget {

  final List<Beer> beers;
  final Function onEndScroll;

  BeerList({
    Key key,
    @required this.beers,
    @required this.onEndScroll,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new AppLoading(builder: (context, loading) {
      return _buildListView(loading);
    });
  }

  ListView _buildListView(bool loading) {
    return new ListView.builder(
      key: BeerKeys.beersList,
      itemCount: loading ? beers.length + 1 : beers.length,
      itemBuilder: (BuildContext context, int index) {
        if (loading) {
          if (index == beers.length) {
            return new Padding(
                padding: const EdgeInsets.all(32.0),
                child: new LoadingIndicator(
                    key: BeerKeys.beersLoading
                )
            );
          }
        } else {
          if (index == beers.length - 1) {
            onEndScroll();
          }
        }

        final beer = beers[index];
        return new BeerCardItem(
          beer: beer,
          onTap: () => _onBeerTap(context, beer),
        );
      },
    );
  }

  _onBeerTap(BuildContext context, Beer beer) {
    Navigator
        .of(context)
        .push(new PageRouteBuilder(
      pageBuilder: (_, __, ___) => new BeerDetails(id: beer.id),
    ));
  }

}

