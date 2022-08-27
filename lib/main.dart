import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/items_feature/item_details_page.dart';
import 'package:todo_app/items_feature/new_item_page.dart';

import 'home_feature/home_page.dart';

void main() async {
  // needs to call native libraries or components like camera gps bluetooth
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
   Hive.openBox('todo_items'); //1 box represents 1 table in sql

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
