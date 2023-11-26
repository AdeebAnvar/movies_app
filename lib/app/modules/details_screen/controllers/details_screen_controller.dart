import 'package:get/get.dart';

import '../../../data/models/movie_models.dart';

class DetailsScreenController extends GetxController {
  Rx<MoviesModel> movieData = MoviesModel().obs;
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    if (Get.arguments != null) {
      movieData.value = Get.arguments as MoviesModel;
    }
  }

  void back() => Get.back();
}
