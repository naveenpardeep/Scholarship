import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:scholarship/main.dart';
import 'package:scholarship/view/viewpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Listview extends StatefulWidget {
  Listview({Key? key}) : super(key: key);

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  final db = FirebaseFirestore.instance;
  List<Object> scholarship = [];

  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        appBar: AppBar(
          title: const Text('Study Abroad'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: db.collection('scho').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SafeArea(
                    child: Scrollbar(
                        controller: controller,
                        child: ListView(
                          children: snapshot.data!.docs.map((doc) {
                            return Card(
                              child: ListTile(
                                title: Text(doc['country']),
                              ),
                            );
                          }).toList(),
                        )));
              }
            }));
  }
}
