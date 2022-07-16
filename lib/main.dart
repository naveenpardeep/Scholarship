import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scholarship/view/listview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: unused_element
  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
    
  }
 // MobileAds.instance.updateRequestConfiguration(RequestConfiguration(testDeviceIds: ["02CD8231BD8956CACD32B66965E2E626"]));


  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Listview(),
    },
  ));
}
