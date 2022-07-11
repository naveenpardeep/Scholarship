// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Viewpage extends StatefulWidget {
  var Country;
  var Name;

  Viewpage({Key? key, required this.Country, required this.Name})
      : super(key: key);

  @override
  State<Viewpage> createState() => _ViewpageState();
}

class _ViewpageState extends State<Viewpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Text("view page  for scholarship"),
    ));
  }
}
