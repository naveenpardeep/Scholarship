// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scholarship/ads/adshelper.dart';


class Viewpage extends StatefulWidget {
  var Country;
  var Details;

  Viewpage({Key? key, required this.Country, required this.Details})
      : super(key: key);

  @override
  State<Viewpage> createState() => _ViewpageState();
}

class _ViewpageState extends State<Viewpage> {
 // TODO: Add _bannerAd
  BannerAd? _bannerAd;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Country),
      backgroundColor: Color.fromARGB(44, 15, 14, 71)),
        body: SafeArea(
           child:  Stack
                (
                  children: [
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
       Center(child: Text(widget.Details)),
                  ]
    ))
        );


  }
}
