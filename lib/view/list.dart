import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Abroad'),
      ),
      body: SafeArea(
        child: Scrollbar(
            controller: controller,
            child: ListView.builder(
                controller: controller,
                itemBuilder: (BuildContext context, int index) {
                  return Text('1');
                })),
      ),
    );
  }
}
