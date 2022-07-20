import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scholarship/view/listview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scholarship/view/newpost.dart';

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
  runApp(Main());
 
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int currentindex=0;
  List tabs= [
    Newpost(),
     Listview(),
    
   
  ];
@override
void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp( title: 'Study Abroad',
    home: Scaffold( backgroundColor: Colors.black,
    body: tabs[currentindex],
    bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.black
      ,
      iconSize: 30,
      selectedFontSize: 10,unselectedFontSize: 8,items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.green,),label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.school_rounded,color: Colors.green,),label: ''),
    ],
    onTap: (index){
      setState(() {
        currentindex=index;
      });
    },),
    )
    );
  }
}