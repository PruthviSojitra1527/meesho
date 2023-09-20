import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:meesho/decoration/color.dart';
import 'package:meesho/decoration/textstyle.dart';
import 'package:meesho/state_menagement/state_menagement.dart';

// void main() {
//   runApp(const Meesho());
// }
//bool result = await InternetConnectionChecker().hasConnection;
// if(result == true) {
//   print('YAY! Free cute dog pics!');
// } else {
//   print('No internet :( Reason:');
//   print(InternetConnectionChecker().lastTryResults);
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Help()
      ),
    ),
  );
}

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  String result = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetConecction();
  }

  checkInternetConecction() {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        setState(() {
          result = 'connected';
        });
      } else {
        setState(() {
          result = 'No Internet! check your internet connection...';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return result == 'connected' ? MyApp() : Center(
      child: Container(
        alignment: Alignment.center,
        child: Center(
          child: Text(
          result, style: stylebold(20.0, darkFontGrey),
      ),
        ),
    ),);
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: MyCheck(),
//       ),
//     ),
//   );
// }
//
// class MyCheck extends StatefulWidget {
//   const MyCheck({Key? key}) : super(key: key);
//
//   @override
//   State<MyCheck> createState() => _MyCheckState();
// }

// class _MyCheckState extends State<MyCheck> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<CheckValue>(
//       create: (BuildContext context) {
//         return CheckValue();
//       },
//       child: Consumer<CheckValue>(
//           builder: (BuildContext context, provider, Widget? child) {
//         return Center(
//           child:
//         );
//       }),
//     );
//   }
// }


