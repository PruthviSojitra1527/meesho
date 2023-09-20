import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyRazorPay extends StatefulWidget {
  const MyRazorPay({Key? key}) : super(key: key);

  @override
  State<MyRazorPay> createState() => _MyRazorPayState();
}

class _MyRazorPayState extends State<MyRazorPay> {
  Razorpay? razorpay;

  var amountcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    razorpay = Razorpay();
    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, payment_success);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, payment_error);
  }
  payment_success() {
    print("payment successfully done....");
  }

  payment_error() {
    print("payment error.....");
  }

  payment() {
    var options = {
      'key': 'rzp_test_U5fKj454uoyfBg',
      'amount': num.parse(amountcontroller.text) * 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com',
      }
    };
    try {
      razorpay!.open(options);
    } catch (error) {
      print("errorrr in razorpay:$error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: amountcontroller,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  payment();
                },
                child: Text("Pay Now"))
          ],
        ),
      ),
    );
  }


}
