import 'package:flutter/material.dart';
class Moreinfopage extends StatefulWidget {
  const Moreinfopage({Key? key}) : super(key: key);

  @override
  State<Moreinfopage> createState() => _MoreinfopageState();
}

class _MoreinfopageState extends State<Moreinfopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('More Info page')),
    );
    
  }
}