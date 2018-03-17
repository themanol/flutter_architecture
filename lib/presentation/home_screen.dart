import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvp/containers/beers_browser.dart';
import 'package:flutter_mvp/data/search_parameters.dart';
import 'package:flutter_mvp/presentation/beer_keys.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen() : super(key: BeerKeys.homeScreen);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Beers"),
          actions: <Widget>[
            new IconButton( // action button
                icon: new Icon(Icons.search),
                onPressed: () {
                  _searchPressed(context);
                }
            )
          ],
        ),
        body: new BeersBrowser()
    );
  }


  Future<Null> _searchPressed(BuildContext context) async {
    final searchQuery = await showDialog<Map<SearchParameters, String>>(
        context: context,
        child: new _SystemPadding(
          child: new SimpleDialog(
            title: const Text('Select filters'),
            children: <Widget>[
              new Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: new TextField(
                    decoration: new InputDecoration(
                        labelText: "Name"
                    ),
                  )
              ),
              new Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: new TextField(
                    decoration: new InputDecoration(
                        labelText: "Food for pairing"
                    ),
                  )
              ),

              new Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new TextField(
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                              labelText: "Min %",
                            ),
                          )
                      ),
                      new Padding(
                          padding: const EdgeInsets.only(left: 16.0)
                      ),
                      new Expanded(
                          child: new TextField(
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                              labelText: "Max %",
                            ),
                          )
                      )
                    ],
                  )
              ),
              new Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.pop(context, new Map());
                    },
                    child: const Text("Search"),
                    color: Theme.of(context).accentColor,
                    textColor: Theme.of(context).secondaryHeaderColor,
                  )
              ),
            ],
          ),
        )
    );

  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}