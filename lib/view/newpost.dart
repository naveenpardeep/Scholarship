import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:scholarship/main.dart';
import 'package:scholarship/view/viewpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scholarship/ads/adshelper.dart';

class Newpost extends StatefulWidget {
  const Newpost({Key? key}) : super(key: key);

  @override
  State<Newpost> createState() => _NewpostState();
}

class _NewpostState extends State<Newpost> {

  // TODO: Add _bannerAd
  BannerAd? _bannerAd;

  final db = FirebaseFirestore.instance;
 

  final ScrollController controller = ScrollController();
@override
void initState() {
    // TODO: implement initState
    super.initState();

  // TODO: Load a banner ad
  BannerAd(
    adUnitId: AdHelper.bannerAdUnitId,
    request: const AdRequest(),
    size: AdSize.banner,
    listener: BannerAdListener(
      onAdLoaded: (ad) {
        setState(() {
          _bannerAd = ad as BannerAd;
        });
      },
      onAdFailedToLoad: (ad, err) {
        print('Failed to load a banner ad: ${err.message}');
        ad.dispose();
      },
    ),
  ).load();

  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructorsr
    return Scaffold(
      backgroundColor: Color.fromARGB(44, 157, 140, 173),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(44, 174, 121, 226),
          title: const Text('New Open Positions'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: db.collection('openposition').orderBy("id",descending: true).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SafeArea(
                child:  Stack
                (children: [
                  
                
                     Scrollbar(
                        controller: controller,
                        child: 
                          
                           ListView(
                          children: snapshot.data!.docs.map((doc){
                           
                     return Container(
                               height: 250,
                          child: 
                           Card( 
                                
                          color: Colors.black,
                            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight: Radius.circular(60))),
                            child: ListTile(
                               
                              contentPadding: const EdgeInsets.fromLTRB(40,1,40,20),
                                textColor: Colors.white,
                              //  leading: Icon(Icons.school,color: Colors.green,),
                              //  trailing: Icon(Icons.forward,color: Colors.green,textDirection: TextDirection.ltr,),
                                title: Text(doc['title'],textAlign: TextAlign.center,textScaleFactor: 1.5,),
                                subtitle: Text(doc['details'],maxLines: 6,),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Viewpage(
                                              Country: doc['title'],
                                              Details: doc['details'],
                                              url: doc['link'],)));
                                }),
                          ));
                          }).toList(),
                        ))
                      ,
                        if (_bannerAd != null) 
                Positioned( top: 0, child:  Align(
              alignment: Alignment.topCenter,
              child: Container( 
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ))
                           
                           ,
                        ]
                ));
              }
            }));
  }
  @override
void dispose() {
  // TODO: Dispose a BannerAd object
  _bannerAd?.dispose();

  

  super.dispose();
}

}
