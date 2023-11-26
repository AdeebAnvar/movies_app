import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/models/movie_models.dart';
import '../../../data/models/repository/movie_repo.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  RxList<MoviesModel> moviesList = <MoviesModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchAllMovies()
        .then((List<MoviesModel> movielist) => moviesList.value = movielist);
  }

  Future<List<MoviesModel>> fetchAllMovies() async {
    try {
      final List<MoviesModel> response = await MovieRepo().fetchMovies();
      log(response.toString());
      return response;
    } catch (e) {
      log(e.toString());

      return <MoviesModel>[];
    }
  }

  void onClickSingleMovieCard(MoviesModel singleMovieData) =>
      Get.toNamed(Routes.DETAILS_SCREEN, arguments: singleMovieData);
}
