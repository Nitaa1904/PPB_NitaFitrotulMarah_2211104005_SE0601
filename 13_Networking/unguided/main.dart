import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/homepage.dart';
import 'views/add_note_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/add_note', page: () => AddNotePage()),
      ],
    );
  }
}
