import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvp/models/beer.dart';
import 'package:flutter_mvp/presentation/beer_item.dart';

class BeerDetailsScreen extends StatelessWidget {

  final Beer beer;

  BeerDetailsScreen({
    Key key,
    @required this.beer
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Beers"),
      ),
      body: new ListView(
          children: <Widget>[
            new BeerHeaderItem(beer: beer),
            new Padding(
                padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    top: 24.0
                ),
                child: new Text(
                  "Nice for pairing with:",
                  style: Theme
                      .of(context)
                      .textTheme
                      .title,
                )
            ),
            new Padding(
                padding: const EdgeInsets.all(24.0),
                child: new Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _getChips(context, beer),
                )
            ),
            new Padding(
              padding: const EdgeInsets.all(24.0),
              child: new Text(
                beer.description,
                style: Theme
                    .of(context)
                    .textTheme
                    .body1
                    .copyWith(fontSize: 18.0),

              ),
            )

          ]
      ),
    );
  }

  List<Widget> _getChips(BuildContext context, Beer beer) {
    List<Widget> chips = new List();
    beer.foodPairing.forEach((food) =>
        chips.add(
            new GestureDetector(
              onTap: () => _onChipTap(food),
              child: new Chip(
                label: new Text(food),
                backgroundColor: Theme
                    .of(context)
                    .accentColor,
                labelStyle: Theme
                    .of(context)
                    .primaryTextTheme
                    .body1
                    .copyWith(
                    color: Theme
                        .of(context)
                        .secondaryHeaderColor
                ),
              ),
            )
        )
    );

    return chips;
  }

  _onChipTap(String food) {
    debugPrint(food);
  }

}
