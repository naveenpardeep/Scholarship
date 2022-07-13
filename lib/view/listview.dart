import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:scholarship/main.dart';
import 'package:scholarship/view/viewpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scholarship/ads/adshelper.dart';


class Listview extends StatefulWidget {
  Listview({Key? key}) : super(key: key);

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {

  // TODO: Add _bannerAd
  BannerAd? _bannerAd;

  final db = FirebaseFirestore.instance;
  List<Object> scholarship = [];

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
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Color.fromARGB(44, 174, 121, 226),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(44, 174, 121, 226),
          title: const Text('Study Abroad'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: db.collection('scholarship').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SafeArea(
                child:  Stack
                (children: [
                  if (_bannerAd != null) 
                             Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            )
                           
                           ,
                     Scrollbar(
                        controller: controller,
                        child: 
                          
                           ListView(
                          children: snapshot.data!.docs.map((doc) {
                           

                          return Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                            child: ListTile(
                                textColor: Colors.black,
                                leading: Icon(Icons.school),
                                trailing: Icon(Icons.forward),
                                title: Text(doc['country']),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Viewpage(
                                              Country: doc['country'],
                                              Details: doc['details'])));
                                }),
                          );
                          }).toList(),
                        ))
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
