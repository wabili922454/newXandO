// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:practise_flut/homes/home1.dart';
import 'package:practise_flut/homes/home3.dart';
import 'package:practise_flut/tictactoe/game.dart';
import 'package:practise_flut/tictactoe/game1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Game1());
  }
}
