import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:memeapp/selectionpage.dart';
import 'package:memeapp/splsh.dart';
import 'package:memeapp/test.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:splsh(), //test(),
    );
  }
}
