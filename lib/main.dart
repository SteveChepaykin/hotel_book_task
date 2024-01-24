import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book_task/pages/hotelslist_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        fontFamily: 'SF-Pro-Display',
      ),
      home: const HotelListPage(),
    );
  }
}
