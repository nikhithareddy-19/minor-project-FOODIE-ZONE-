import 'package:flutter/material.dart';
import 'package:sample_project/signup.dart';
class start2 extends StatefulWidget {
  const start2({ Key? key }) : super(key: key);

  @override
  _start2State createState() => _start2State();
}

class _start2State extends State<start2> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      
    body:
Container(
    width: 428,
    height: 926,
    color: Color(0xff7b6369),
    padding: const EdgeInsets.only(right: 10, bottom: 104, ),
    child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:[
            Container(
                width: double.infinity,
                height: height*0.5,
                child: Image.asset('assets/images/start2.png'),
),
            
            Text(
    "The Fastest in\nPreparing Food",
    style: TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontStyle: FontStyle.italic,
    ),
),
Text(
    "Our job is to filling your tummy\nwith delicious food!!",
    style: TextStyle(
        color: Color(0xff4a2020),
        fontSize: 28,
    ),
),
SizedBox(height:height*0.05),
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
                    child: const Text('Get Started'),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => signup()),
                          (route) => true);
                    },
                  ),
                )),
          ),
            
        ],
    ),
),
);
  }
}