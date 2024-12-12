import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required dictionaryService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
