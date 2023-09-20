import 'package:flutter/material.dart';
class C7 extends StatefulWidget {
  const C7({Key? key}) : super(key: key);

  @override
  State<C7> createState() => _C7State();
}

class _C7State extends State<C7> {
  final List<Map> myProducts =
  List.generate(10, (index) => {"id": index, "name": "Product ${index+1}"})
      .toList();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 5/3 ,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: myProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(15)),
                child: Text(myProducts[index]["name"]),
              );
            }),
      ),
    );
  }
}
