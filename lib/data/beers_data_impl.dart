import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvp/data/beers_data.dart';
import 'package:http/http.dart' as http;


class BeerRepositoryImpl implements BeerRepository {

  static const _BeersApi = 'https://api.punkapi.com/v2/beers/';
  static final JsonDecoder _decoder = new JsonDecoder();
  static final Map<int, BeerEntity> _cache = new Map();


  const BeerRepositoryImpl();

  @override
  Future<List<BeerEntity>> getBeers(int page) {
    var client = new http.Client();
    return client.get(_BeersApi + "?page=$page").then((http.Response response) {
      if (response.statusCode == HttpStatus.OK) {
        return _parseBeersJson(response.body);
      }
    }).whenComplete(client.close);
  }

  List<BeerEntity> _parseBeersJson(String json) {
    List beersJson = _decoder.convert(json);
    return beersJson.map((beerJson) {
      BeerEntity beer = new BeerEntity.fromMap(beerJson);
      _putInCache(beer);
      return beer;
    }).toList();
  }

  @override
  Future<BeerEntity> getBeer(int id) async {
    if (_cache.containsKey(id)) {
      return _cache[id];
    } else {
      var client = new http.Client();
      return client.get(_BeersApi + "$id").then((http.Response response) {
        if (response.statusCode == HttpStatus.OK) {
          Map beerJson = _decoder.convert(response.body);
          return new BeerEntity.fromMap(beerJson);
        }
      }).whenComplete(client.close);
    }
  }

  void _putInCache(BeerEntity beer) {
    _cache[beer.id] = beer;
  }

}