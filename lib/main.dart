// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:myapp/pages/home_page.dart';

Future<void> main(List<String> args) async {
  //initilize the hive
  await Hive.initFlutter();
  // open the box
  var Box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
  
}

