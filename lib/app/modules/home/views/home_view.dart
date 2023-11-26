import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/widgets/movie_card.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Top Movies'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: controller.fetchAllMovies(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.red.shade900),
                );
              } else if (snapShot.hasData == false) {
                return const Center(
                  child: Text('No Data'),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.moviesList.length,
                  itemBuilder: (BuildContext context, int index) => MovieCard(
                    movie: controller.moviesList[index],
                    onTap: () => controller
                        .onClickSingleMovieCard(controller.moviesList[index]),
                  ),
                );
              }
            }));
  }
}
