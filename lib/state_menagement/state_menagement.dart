import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_pages/splesh_screen/splesh_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Manage())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SpleshScreeen(),
      ),
    );
  }
}

class Manage extends ChangeNotifier{
  bool isCheck = true;

  bool get value{
    return isCheck ;
  }

  void changeValue(newValue) {
    isCheck = newValue;
    notifyListeners();
  }


}
