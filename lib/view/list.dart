import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:scholarship/main.dart';
import 'package:scholarship/view/viewpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  final db = FirebaseFirestore.instance;
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        appBar: AppBar(
          title: const Text('Study Abroad'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: db.collection('notes').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SafeArea(
                  child: Scrollbar(
                      controller: controller,
                      child: ListView.builder(
                          controller: controller,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: ListTile(
                                  textColor: Colors.black,
                                  title: Text("Naveen"),
                                  trailing: Icon(Icons.forward),
                                  leading: Icon(Icons.school),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => Viewpage(
                                                  Country: 'name 3',
                                                  Name: "",
                                                ))));
                                  }),
                            );
                          })),
                );
              }
            }));
  }
}
