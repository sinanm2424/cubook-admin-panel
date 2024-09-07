import 'package:cu_book_admin_new/root_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cu Admin Panal',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: 'Nunito',
          scaffoldBackgroundColor: Colors.white),
      home: MyHomePage(),
    );
  }
}
