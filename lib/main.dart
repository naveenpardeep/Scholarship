import 'package:flutter/material.dart';
import 'package:scholarship/view/list.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const List(),
    },
  ));
}
