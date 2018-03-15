import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvp/containers/beers_browser.dart';
import 'package:flutter_mvp/presentation/beer_keys.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen() : super(key: BeerKeys.homeScreen);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Beers"),
      ),
      body: new BeersBrowser()
    );
  }
}