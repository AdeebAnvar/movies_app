import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/models/movie_models.dart';
import '../../../data/models/repository/movie_repo.dart';
import '../../../routes/app_pages.dart';

class SearchScreenController extends GetxController {
  RxList<MoviesModel> moviesList = <MoviesModel>[].obs;
  RxBool isLoading = false.obs;
  Future<List<MoviesModel>> searchMovies(String searchedData) async {
    try {
      isLoading.value = true;
      moviesList.value = await MovieRepo().searchMovies(searchedData);
      log(moviesList.toString());
      isLoading.value = false;
      return moviesList;
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
      return [];
    }
  }

  void onClickSingleMovie(MoviesModel singleMovieData) =>
      Get.toNamed(Routes.DETAILS_SCREEN, arguments: singleMovieData);
}
