import 'package:flutter_mvp/data/beers_data.dart';
import 'package:meta/meta.dart';

@immutable
class Beer {
  final int id;
  final String name;
  final num alcoholContent;
  final String tagLine;
  final String firstBrewed;
  final String description;
  final String imageUrl;
  final List<String> foodPairing;

  Beer(this.id, this.name,this.alcoholContent, this.tagLine, this.firstBrewed, this.description,
      this.imageUrl, this.foodPairing);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ tagLine.hashCode ^ firstBrewed.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Beer &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  String toString() {
    return 'Beer{name: $name, id: $id}';
  }

  BeerEntity toEntity() {
    return new BeerEntity(
        id,
        name,
        alcoholContent,
        tagLine,
        firstBrewed,
        description,
        imageUrl,
        foodPairing);
  }

  static Beer fromEntity(BeerEntity entity) {
    return new Beer(
        entity.id,
        entity.name,
        entity.alcoholContent,
        entity.tagLine,
        entity.firstBrewed,
        entity.description,
        entity.imageUrl,
        entity.foodPairing
    );
  }
}