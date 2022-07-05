import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_project/home_screen.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 150),
          Center(
            child: Container(
              width: 83,
              height: 83,
              color: Color(0xffd9d9d9),
              child: Image.asset('assets/images/tick.png'),
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Done! Successfully completed\n      the payment process.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: 423,
            height: 131,
            color: Color(0xffd9d9d9),
            child: Image.asset('assets/images/pay.png'),
          ),
          SizedBox(height: 30),
          Text(
            "Order is confirmed...",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
            ),
          )
        ],
      ),
    );
  }
}
