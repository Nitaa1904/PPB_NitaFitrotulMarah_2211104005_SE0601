import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs; // State yang reaktif

  void increment() => count++;
}
