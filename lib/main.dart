import 'package:flutter/material.dart';
import 'package:scholarship/view/listview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Listview(),
    },
  ));
}
