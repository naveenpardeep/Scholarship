// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class Viewpage extends StatefulWidget {
  var Country;
  var Details;

  Viewpage({Key? key, required this.Country, required this.Details})
      : super(key: key);

  @override
  State<Viewpage> createState() => _ViewpageState();
}

class _ViewpageState extends State<Viewpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Country),
      backgroundColor: Color.fromARGB(44, 15, 14, 71)),
        body: SafeArea(
      child: Center(child: Text(widget.Details)),
    ));
  }
}
