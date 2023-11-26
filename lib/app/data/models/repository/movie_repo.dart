import 'dart:developer';

import 'package:dio/dio.dart';
import '../movie_models.dart';

class MovieRepo {
  final String baseUrl = 'https://api.tvmaze.com/search/shows?q=';
  Dio dio = Dio();
  Future<List<MoviesModel>> fetchMovies() async {
    try {
      final Response<dynamic> response = await dio.get('${baseUrl}all');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<MoviesModel> moviesList = data
            .map((e) => MoviesModel.fromJson(e))
            .cast<MoviesModel>()
            .toList();
        return moviesList;
      } else {
        return <MoviesModel>[];
      }
    } catch (e) {
      log(e.toString());
      return <MoviesModel>[];
    }
  }

  Future<List<MoviesModel>> searchMovies(String keyword) async {
    try {
      final Response<dynamic> response = await dio.get('$baseUrl$keyword');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<MoviesModel> moviesList = data
            .map((e) => MoviesModel.fromJson(e))
            .cast<MoviesModel>()
            .toList();
        log(moviesList.toString());
        return moviesList;
      } else {
        return <MoviesModel>[];
      }
    } catch (e) {
      log(e.toString());
      return <MoviesModel>[];
    }
  }
}
