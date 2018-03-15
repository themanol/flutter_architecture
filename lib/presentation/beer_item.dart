import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvp/models/beer.dart';
import 'package:flutter_mvp/presentation/beer_keys.dart';

class BeerItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Beer beer;

  BeerItem({
    @required this.onTap,
    @required this.beer,
  });

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Row(
          children: <Widget>[
            new Image.network(
              beer.imageUrl,
              width: 112.0,
              height: 256.0,
            ),
            new Padding(
                padding: const EdgeInsets.all(16.0)
            ),
            new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      beer.name,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: new Text(
                        beer.tagLine,
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
                          "Since ${beer.firstBrewed}",
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
      ,
    );
  }
}