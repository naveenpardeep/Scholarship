import 'package:flutter/material.dart';
class Newpost extends StatefulWidget {
  const Newpost({Key? key}) : super(key: key);

  @override
  State<Newpost> createState() => _NewpostState();
}

class _NewpostState extends State<Newpost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('New Positions'),),);
    
  }
}