import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constants.dart';
import '../controllers/details_screen_controller.dart';

class DetailsScreenView extends GetView<DetailsScreenController> {
  const DetailsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Hero(
        tag: controller.movieData.value.show!.image?.medium ?? brokenImage,
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          controller.movieData.value.show!.image?.medium ??
                              brokenImage))),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.movieData.value.show?.name ?? '',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.red.shade900,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                controller.movieData.value.show?.summary ?? '',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Genres',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: controller.movieData.value.show!.genres!
                    .map((e) => Text('> $e'))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                controller.movieData.value.show?.language.toString() ?? '',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
