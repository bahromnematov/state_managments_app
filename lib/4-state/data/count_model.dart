import 'package:get/get.dart';

class CountModel {
  var count = 0.obs;
  var countOfChanging = 0.obs;

  CountModel({required this.count, required this.countOfChanging});

  void increment() {
    countOfChanging++;
  }
}
