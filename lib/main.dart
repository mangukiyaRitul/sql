
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql/showdata.dart';

import 'Homepage.dart';

 Database? db ;

void main() {
  runApp(
          MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          centerTitle: true,

        ),
        useMaterial3: true,
      ),
      home:showdata(),
      // home: const CreatUpdate(),
    );
  }
}