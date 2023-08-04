import 'package:flutter/material.dart';

const klightcolor = Colors.white;
const kdarkcolor = Color(0xff121318);
const ktextdarkmode = Colors.white;
const ktextlightmode = Colors.black;

ThemeData lite = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: klightcolor,
  primaryColor: ktextlightmode,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal,brightness: Brightness.light)
);

ThemeData dark = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: kdarkcolor,
  primaryColor: ktextdarkmode,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal,brightness: Brightness.dark)
);

