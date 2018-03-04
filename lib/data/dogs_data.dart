import 'dart:async';

abstract class DogsRepository{
  Future<List<String>> getDogBreeds();
  Future<String> getBreedRandomImage(String breed);
}