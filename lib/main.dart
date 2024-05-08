import 'package:flutter/material.dart';
import 'package:to_do_app_ahmed/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  // Open Hive box
  var box = await Hive.openBox('mybox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO Do App',
        theme: ThemeData(
        primarySwatch: Colors.brown ,
      ),
      home: const Home_page(),
    );
  }
}
