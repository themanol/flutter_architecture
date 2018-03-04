import 'package:flutter/material.dart';
import 'package:flutter_mvp/data/dogs_data_impl.dart';
import 'package:flutter_mvp/view/details/dog_details_presenter.dart';

class DogDetailsPage extends StatelessWidget {

  final String _dog;

  DogDetailsPage(this._dog);


  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text(_dog),
            ),
            body: new DogDetails(_dog)
        ));
  }

}

class DogDetails extends StatefulWidget {
  final String _dog;

  DogDetails(this._dog);

  @override
  State<StatefulWidget> createState() => new _DogDetailsState(_dog);

}

class _DogDetailsState extends State<DogDetails> implements DogDetailsView {
  final String _dog;
  bool _isLoading;
  String imageUrl;
  DogDetailsPresenter _presenter;

  _DogDetailsState(this._dog) {
    _presenter = new DogDetailsPresenter(this, _dog, new DogsRepositoryImpl());
  }

  @override
  Widget build(BuildContext context) {
    var widget;
    if (_isLoading) {
      widget = new Center(
          child: new Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: new CircularProgressIndicator()
          )
      );
    } else {
      widget = new Center(
          child: new Image.network(imageUrl)
      );
    }
    return widget;
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadDogImageUrl();
  }

  @override
  void onLoadImageComplete(String imageUrl) {
    setState(() {
      this.imageUrl = imageUrl;
      _isLoading = false;
    });
  }

}