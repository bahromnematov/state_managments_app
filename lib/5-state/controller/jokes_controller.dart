import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../servise/api_servise.dart';

class JokesController extends GetxController {
  JokesController() {
    getJokes();
  }

  var isLoading = false.obs;
  var jokes = [].obs;

  getJokes() async {
    changeLoading();
    jokes.value = await ApiServise().getJokes();
    changeLoading();
  }

  changeLoading() {
    isLoading.value = !isLoading.value;
  }
}
