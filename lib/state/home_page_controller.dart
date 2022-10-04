import 'package:get/get.dart';

class ActiveIndex extends GetxController {
  RxInt index = 0.obs;

  void updateIndex(int index) {
    this.index.value = index;
    update();
  }
}
