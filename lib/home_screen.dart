import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sample_project/food_spot.dart';
import 'package:sample_project/order.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List foodOrdered = [];
  bool _isLoadning = true;
  void setData() {
    setState(() {
      _isLoadning = true;
    });
    setState(() {
      // foodOrdered.add(value)
    });
    setState(() {
      _isLoadning = false;
    });
  }

  static const _alignments = [
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
  ];

  var _index = 1;

  AlignmentGeometry get _alignment => _alignments[_index];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(body: Container(
      child: ListView.builder(
          // itemCount: 2,
          itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.02),
                  child: Text(
                    "Hi Tony",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.02),
                  child: Text(
                    "Welcome back!",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: height * 0.01),
                // Container(
                //   padding: EdgeInsets.all(10),
                //   child: TextField(
                //     decoration: const InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Search...',
                //       prefixIcon: Icon(Icons.search),
                //     ),
                //   ),
                // ),
                SizedBox(height: height * 0.02),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color(0xff70CCFF),
                          Color(0xff0070AE),
                        ])),
                    height: height * 0.16,
                    width: width * 0.9,
                    child: Row(children: [
                      SizedBox(
                        width: width * 0.4,
                        child: Image.asset('assets/images/biryani.png'),
                      ),
                      SizedBox(
                        width: width * 0.4,
                        child: Text(
                          'Todays Special Biryani',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.03),
                  child: Text(
                    "Choose your food spot",
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                // Align(
                //     alignment: Alignment.center,
                //     child: Container(
                //       child: Row(
                //         children: [
                //           AnimatedAlign(
                //             alignment: _alignment,
                //             duration: Duration(milliseconds: 200),
                //             child: GestureDetector(
                //               onHorizontalDragEnd: (e) {
                //                 setState(() {
                //                   _index = 2;
                //                 });
                //               },
                //               onHorizontalDragStart: (e) {
                //                 setState(() {
                //                   _index = 0;
                //                 });
                //               },
                //               child: Container(
                //                 height: height * 0.07,
                //                 width: height * 0.07,
                //                 decoration: BoxDecoration(
                //                     shape: BoxShape.circle,
                //                     color: Colors.white,
                //                     boxShadow: [
                //                       BoxShadow(
                //                         color: Colors.black26,
                //                         blurRadius: 3,
                //                       )
                //                     ]),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20),
                //           gradient: LinearGradient(colors: [
                //             Color(0xff70CCFF),
                //             Color(0xff0070AE),
                //           ])),
                //       height: height * 0.07,
                //       width: width * 0.85,
                //     )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text(
                        'FOODCOURT  /',
                        style: TextStyle(fontSize: width * 0.06),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FoodSpot(name: 'FOODCOURT')),
                            (route) => true);
                      },
                    ),
                    TextButton(
                      child: Text(
                        'DAFFODILS2',
                        style: TextStyle(fontSize: width * 0.06),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodSpot(
                                      name: 'DAFFODILS2',
                                    )),
                            (route) => true);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.03),
                  child: Row(
                    children: [
                      Text(
                        "Your Orders",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.5),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See all',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]);
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width * 0.85,
              height: height * 0.12,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 5,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: height * 0.12,
                      // width: height * 0.12,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/images/fc1.png',
                            fit: BoxFit.cover,
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    ));
  }
}
