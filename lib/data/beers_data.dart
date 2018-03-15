import 'dart:async';

class BeerEntity {
  final int id;
  final String name;
  final String tagLine;
  final String firstBrewed;
  final String description;
  final String imageUrl;
  final List<String> foodPairing;

  const BeerEntity(this.id, this.name, this.tagLine, this.firstBrewed,
      this.description, this.imageUrl, this.foodPairing);

  factory BeerEntity.fromMap(Map<String, dynamic> map) {
    return new BeerEntity(
        map['id'],
        map['name'],
        map['tagline'],
        map['first_brewed'],
        map['description'],
        map['image_url'],
        map['food_pairing']);
  }
}

abstract class BeerRepository {
  Future<List<BeerEntity>> getBeers(int page);

  Future<BeerEntity> getBeer(int id);

}