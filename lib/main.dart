import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff19A5B6),
        scaffoldBackgroundColor: const Color(0xff010614),
        fontFamily: 'PlusJakartaSans',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    ),
  );
}
