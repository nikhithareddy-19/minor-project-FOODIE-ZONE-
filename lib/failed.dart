import 'package:flutter/material.dart';
import 'package:sample_project/home_screen.dart';
class failed extends StatefulWidget {
  const failed({ Key? key }) : super(key: key);

  @override
  _failedState createState() => _failedState();
}

class _failedState extends State<failed> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Icon(Icons.arrow_back),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.05, top: height * 0.08),
              child: const Text(
    "Sorry,payment failed!",
    style: TextStyle(
        color: Colors.black,
        fontSize: 28,
    ),
)
            ),
          ],
        ),
        SizedBox(height: height*0.05),
        Center(
          child: Container(
    width: 188,
    height: 176,
   child: Image.asset('assets/images/fail.png'),
),
        ),
         SizedBox(height: height*0.02),
      Text(
    "Order Failed!",
    style: TextStyle(
        color: Color(0xffb31a1a),
        fontSize: 28,
    ),
    
),
 SizedBox(height: height*0.05),
Text(
    "We could not acquire  payment",
    style: TextStyle(
        color: Colors.black,
        fontSize: 28,
    ),
),
 SizedBox(height: height*0.02),
Text(
    "Unfortunately, your order is rejected.\nPlease complete the payment process\nto confirm your order",
    style: TextStyle(
        color: Colors.black,
        fontSize: 20,
    ),
),
 SizedBox(height: height*0.05),
 Align(
            alignment: Alignment.center,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      Color(0xff70CCFF),
                      Color(0xff0070AE),
                    ])),
                height: height * 0.1,
                width: width * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                    child: const Text('Pay Now'),
                    onPressed: () {
                      
                    },
                  ),
                )),
          ),
           SizedBox(height: height*0.05),
           Row(
            children: <Widget>[
              const Text('Back to home page'),
              TextButton(
                child: const Text(
                  '/Try again?',
                  style: TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => true);
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),

        ],
        ),
      
    );
  }
}