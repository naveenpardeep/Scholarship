// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scholarship/ads/adshelper.dart';
import 'package:scholarship/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Viewpage extends StatefulWidget {
  var Country;
  var Details;
  var url;
  Viewpage(
      {Key? key,
      required this.Country,
      required this.Details,
      required this.url})
      : super(key: key);

  @override
  State<Viewpage> createState() => _ViewpageState();
}

class _ViewpageState extends State<Viewpage> {
  final ScrollController controller = ScrollController();
  // TODO: Add _bannerAd
  BannerAd? _bannerAd;
  late Uri uri;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uri = Uri.parse(widget.url);
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
         child:   Scrollbar(
                        controller: controller,
                        
            child: Stack(children: [
          if (_bannerAd != null)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ),
          Padding(
            padding:  EdgeInsets.fromLTRB(12.0,12.0,12.0,30.0),
            child: Center(
                child: SelectableText(
              widget.Details,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
          ),
          Positioned(
            right: 0,
              bottom: 0,
              child: ElevatedButton(
                  onPressed: () async {
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication,
                          webViewConfiguration: const WebViewConfiguration(
                              enableJavaScript: true));
                    }
                  },
                  child: const Text('Click Here for more info')))
        ]))));
  }
}
