// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'dart:io';

// class MyGoogle_ads extends StatefulWidget {
//   const MyGoogle_ads({Key? key}) : super(key: key);
//
//   @override
//   State<MyGoogle_ads> createState() => _MyGoogle_adsState();
// }
//
// class _MyGoogle_adsState extends State<MyGoogle_ads> {
//   BannerAd? bannerAd;
//   bool isLoaded = false;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     bannerAd = BannerAd(
//       size: AdSize.banner,
//       adUnitId: Platform.isAndroid ? 'ca-app-pub-3940256099942544/6300978111' : 'ca-app-pub-3940256099942544/2934735716',
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {
//           setState(() {
//             isLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (ad, error) {
//           print("banner Ad Error :-- $error");
//         },
//       ),
//       request: AdRequest(),
//     );
//     bannerAd!.load();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoaded ? AdWidget(ad: bannerAd!): CircularProgressIndicator();
//   }
// }
