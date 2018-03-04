import 'package:flutter_mvp/data/dogs_data.dart';

abstract class DogDetailsView {
  void onLoadImageComplete(String imageUrl);
}

class DogDetailsPresenter{
  DogsRepository _repository;
  String _dog;
  DogDetailsView _view;

  DogDetailsPresenter(this._view, this._dog, this._repository);

  void loadDogImageUrl(){
    _repository.getBreedRandomImage(_dog).
      then((String url) {
        _view.onLoadImageComplete(url);
    });
  }

}