import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvp/data/dogs_data.dart';
import 'package:http/http.dart' as http;

class DogsRepositoryImpl implements DogsRepository {

  static const _DogsApiUrl = 'https://dog.ceo/api/';
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<String> getBreedRandomImage(String breed) {
    final String path = "breed/$breed/images/random";
    return http.get(_DogsApiUrl + path)
        .then((http.Response response) {
      if (response.statusCode == HttpStatus.OK) {
          final String jsonBody = response.body;
          final dogsJson = _decoder.convert(jsonBody);
          return dogsJson['message'];
        }
      });
  }

  @override
  Future<List<String>> getDogBreeds() {
    final String path = "breeds/list";
    return http.get(_DogsApiUrl + path)
        .then((http.Response response) {
      if (response.statusCode == HttpStatus.OK) {
        final String jsonBody = response.body;
        final dogsJson = _decoder.convert(jsonBody);
        return dogsJson['message'];
      }
    });
  }

}