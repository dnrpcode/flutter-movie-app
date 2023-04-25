import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/data/providers/movie_provider.dart';

class HomeController extends GetxController {
  final inputCon = TextEditingController();
  var movie = List<dynamic>.empty().obs;

  final count = 0.obs;
  int b = 2;
  @override
  void onInit() {
    super.onInit();
    getAllMovie();
    inputCon.addListener(_printLatestValue);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    inputCon.dispose();
    super.onClose();
  }

  void _printLatestValue() {
    print('Second text field: ${inputCon.text}');
  }

  void getAllMovie() {
    MovieProvider().getMovie().then((res) {
      movie.value = res['Search'];
      print('object ${res['Search']}');
      movie.refresh();
    });
  }

  void increment() => count.value++;
}
