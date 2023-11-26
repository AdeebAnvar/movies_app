import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/movie_card.dart';
import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  const SearchScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SearchScreenController());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CupertinoSearchTextField(
              onSubmitted: (String typedData) =>
                  controller.searchMovies(typedData),
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red.shade800,
                ),
              );
            } else if (controller.moviesList.isEmpty) {
              return Center(
                child: Text('search Movies'),
              );
            }
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => MovieCard(
                movie: controller.moviesList[index],
                onTap: () =>
                    controller.onClickSingleMovie(controller.moviesList[index]),
              ),
              itemCount: controller.moviesList.length,
            );
          })
        ],
      ),
    ));
  }
}
