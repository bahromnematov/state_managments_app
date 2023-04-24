import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CounterController extends GetxController{

  var count = 0.obs;
  void increment(){
    count++;
  }

  void decrement(){
    count--;
  }

}