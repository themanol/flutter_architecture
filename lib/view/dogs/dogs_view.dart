import 'package:flutter/material.dart';
import 'package:flutter_mvp/data/dogs_data_impl.dart';
import 'package:flutter_mvp/view/details/dog_details_view.dart';
import 'package:flutter_mvp/view/dogs/dogs_presenter.dart';

class DogsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Dogs"),
        ),
        body: new DogList()
    );
  }
}

class DogList extends StatefulWidget {
  DogList({ Key key }) : super(key: key);

  @override
  _DogListState createState() => new _DogListState();
}

class _DogListState extends State<DogList> implements DogsListView {

  List<String> _dogs;

  bool _isLoading;

  DogsListPresenter _presenter;

  _DogListState(){
    _presenter = new DogsListPresenter(this, new DogsRepositoryImpl());
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadDogs();
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
      widget = new ListView.builder(
          itemCount: _dogs.length,
          itemBuilder: (BuildContext context, int position) {
            return getRow(position);
          });
    }
    return widget;
  }

  @override
  void onLoadDogsComplete(List<String> dogs) {
    setState(() {
      _dogs = dogs;
      _isLoading = false;
    });
  }

  Widget getRow(int position) {
   return new _DogItem(
       _dogs[position],
        () { _presenter.onTap(_dogs[position]);}
   );

  }

  @override
  void navigateToDogImage(String dog) {
    Navigator.push(context, new MaterialPageRoute<Null>(
        builder: (BuildContext context) => new DogDetailsPage(dog)
    ));
  }

}

class _DogItem extends ListTile {

  _DogItem(String dog, GestureTapCallback onItemTap) :
        super(
          title: new Text(dog),
          leading: new CircleAvatar(
              child: new Text(dog[0])
          ),
          onTap: onItemTap
      );

}