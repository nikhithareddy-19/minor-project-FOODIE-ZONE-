import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sample_project/food_spot.dart';
import 'package:sample_project/payment.dart';

class order extends StatefulWidget {
  order({Key? key, required this.foodOrdered}) : super(key: key);
  List foodOrdered;
  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  static const _alignments = [
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
    findTotal();
  }

  bool _isLoadning = true;
  int totalAmount = 0;
  List foodOrdered = [];
  void findTotal() {
    setState(() {
      _isLoadning = true;
    });
    for (int i = 0; i < foodOrdered.length; i++) {
      setState(() {
        totalAmount = totalAmount + (foodOrdered[i][4] as int);
      });
    }
    setState(() {
      _isLoadning = false;
    });
  }

  void setData() {
    setState(() {
      _isLoadning = true;
    });
    setState(() {
      foodOrdered = widget.foodOrdered;
    });
    setState(() {
      _isLoadning = false;
    });
  }

  var _index = 1;

  AlignmentGeometry get _alignment => _alignments[_index];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: _isLoadning
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: height,
                child: Column(
                  children: [
                    Container(
                      height: height * 0.9,
                      child: ListView.builder(
                          itemCount: widget.foodOrdered.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.arrow_back)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.2, top: height * 0.02),
                                    child: const Text(
                                      'Order',
                                      style: const TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              );
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: width * 0.5,
                                        child: Column(
                                          children: [
                                            Text('${foodOrdered[index][1]}'),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    if (foodOrdered[index][3] >
                                                        0) {
                                                      setState(() {
                                                        foodOrdered[index][3] =
                                                            foodOrdered[index]
                                                                    [3] -
                                                                1;
                                                        foodOrdered[index][4] =
                                                            foodOrdered[index]
                                                                    [4] *
                                                                foodOrdered[
                                                                    index][3];
                                                        findTotal();
                                                      });
                                                    }
                                                  },
                                                  child: Text('-'),
                                                ),
                                                Text(
                                                    '${foodOrdered[index][3]}'),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      foodOrdered[index][3] =
                                                          foodOrdered[index]
                                                                  [3] +
                                                              1;
                                                      foodOrdered[index][4] =
                                                          foodOrdered[index]
                                                                  [4] *
                                                              foodOrdered[index]
                                                                  [3];
                                                      findTotal();
                                                    });
                                                  },
                                                  child: Text('+'),
                                                ),
                                              ],
                                            ),
                                            Text('${foodOrdered[index][4]}'),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          height: height * 0.12,
                                          // width: height * 0.12,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15),
                                              ),
                                              child: Image.asset(
                                                '${widget.foodOrdered[index - 1][0]}',
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
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Total',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "$totalAmount",
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(colors: [
                                          Color(0xff70CCFF),
                                          Color(0xff0070AE),
                                        ])),
                                    height: height * 0.07,
                                    width: width * 0.5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: MaterialButton(
                                        child: const Text('ORDER NOW'),
                                        onPressed: () {
                                          for (int i = 0;
                                              i < foodOrdered.length;
                                              i++) {
                                            FirebaseFirestore.instance
                                                .collection('orders')
                                                .add({
                                              'Count': foodOrdered[i][3],
                                              'name': foodOrdered[i][1],
                                              'price': foodOrdered[i][4],
                                              'paid': foodOrdered[i][2],
                                            });
                                          }

                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      payment()),
                                              (route) => false);
                                        },
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }
}
