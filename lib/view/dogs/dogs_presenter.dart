import 'package:flutter_mvp/data/dogs_data.dart';

abstract class DogsListView {
  void onLoadDogsComplete(List<String> dogs);
  void navigateToDogImage(String dog);
}

class DogsListPresenter{
  DogsRepository _repository;
  DogsListView _view;

  DogsListPresenter(this._view, this._repository);

  void loadDogs(){
    _repository.getDogBreeds().
      then((List<String> dogs) {
        _view.onLoadDogsComplete(dogs);
    });
  }


  void onTap(String dog) {
    _view.navigateToDogImage(dog);
  }
}