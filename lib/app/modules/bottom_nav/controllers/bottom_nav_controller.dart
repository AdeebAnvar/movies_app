import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;
  void onChnagePage(int value) {
    currentIndex.value = value;
  }
}
