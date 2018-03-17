import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvp/models/beer.dart';
import 'package:flutter_mvp/presentation/beer_keys.dart';

class BeerItem extends InheritedWidget {
  final Beer beer;

  BeerItem({
    @required this.beer,
    child
  }) : super(child: child);

  @override
  bool updateShouldNotify(BeerItem oldWidget) {
    return beer != oldWidget.beer;
  }

  static BeerItem of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(BeerItem);
  }
}

class BeerCardItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Beer beer;

  BeerCardItem({
    @required this.onTap,
    @required this.beer,
  });

  @override
  Widget build(BuildContext context) {
    return new BeerItem(
        beer: beer,
        child: new GestureDetector(
            onTap: onTap,
            child: new Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 16.0, right: 16.0),
                child: new Card(
                    child: const BeerHeroItem()
                )
            )
        )
    );
  }
}

class BeerHeaderItem extends StatelessWidget {
  final Beer beer;

  BeerHeaderItem({
    @required this.beer
  });

  @override
  Widget build(BuildContext context) {
    return new BeerItem(
        beer: beer,
        child: new Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
            child: const BeerHeroItem()
        )
    );
  }
}

class BeerHeroItem extends StatelessWidget {

  static const ITEM_HEIGHT = 256.0;

  const BeerHeroItem();

  @override
  Widget build(BuildContext context) {
    final beerItem = BeerItem.of(context);
    return new Hero(
        tag: "beer_tag_${beerItem.beer.id}",
        child: new Material(
            child: new InkWell(
                child: new Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(16.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Image.network(
                        beerItem.beer.imageUrl,
                        width: 112.0,
                        height: ITEM_HEIGHT,
                      ),
                      new Padding(
                          padding: const EdgeInsets.all(16.0)
                      ),
                      new Expanded(
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                beerItem.beer.name,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline,
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: new Text(
                                  beerItem.beer.tagLine,
                                  maxLines: 1,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .body2,
                                ),
                              ),
                              new Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  new Text(
                                    "Since ${beerItem.beer.firstBrewed}",
                                    maxLines: 1,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .body1,
                                  )
                              ),
                              new Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  new Text(
                                    "Alcohol content: ${beerItem.beer.alcoholContent}",
                                    maxLines: 1,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .body1,
                                  )
                              )
                            ],
                          )
                      )
                    ],
                  )
                  ,
                )
            ),
        )
    );
  }

}