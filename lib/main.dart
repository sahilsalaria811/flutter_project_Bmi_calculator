import 'package:flutter/material.dart';
import 'Bmi.dart';
import 'package:flutter/src/painting/image_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Bmi(),
    );
  }
}
