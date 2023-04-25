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
        appBarTheme: const AppBarTheme(backgroundColor: Color(0x44000000)),
        primaryColor: const Color(0xff19A5B6),
        scaffoldBackgroundColor: const Color(0xff010614),
        fontFamily: 'PlusJakartaSans',
        iconTheme: const IconThemeData(color: Color(0xFFC4D2E9)),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF0B1A3E),
          brightness: Brightness.dark,
          onSecondary: const Color(0xFFC4D2E9),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    ),
  );
}
