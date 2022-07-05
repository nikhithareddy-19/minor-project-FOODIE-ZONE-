import 'package:flutter/material.dart';
import 'package:sample_project/order.dart';

class FoodSpot extends StatefulWidget {
  FoodSpot({Key? key, required this.name}) : super(key: key);
  String name;

  @override
  State<FoodSpot> createState() => _foodcourt();
}

class _foodcourt extends State<FoodSpot> {
  List foodItems = [
    ['assets/images/fc1.png', 'Manchuriya Noodles', false, 1, 60],
    ['assets/images/fc2.png', 'Egg Noodles', false, 1, 70],
    ['assets/images/fc3.png', 'Chicken Noodles', false, 1, 70],
    ['assets/images/fc4.png', 'Biriyani', false, 1, 100],
    ['assets/images/fc5.png', 'Veg Noodles', false, 1, 80],
  ];
  void selectItem(int index) {
    setState(() {
      foodItems[index][2] = !foodItems[index][2];
      if (foodItems[index][2]) {
        foodOrdered.add(foodItems[index]);
      } else {
        foodOrdered.remove(foodItems[index]);
      }
    });
  }

  List foodOrdered = [];

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.1, top: height * 0.02),
                child: Text(
                  '${widget.name}',
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: height * 0.08,
            padding: EdgeInsets.all(13),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            width: width * 0.85,
            height: height * 0.7,
            child: GridView.builder(
                itemCount: foodItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    width: width * 0.40,
                    height: height * 0.50,
                    decoration: BoxDecoration(
                      color:
                          index % 2 == 0 ? Colors.blue : Colors.lightBlue[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.15,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image.asset(
                              foodItems[index][0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                foodItems[index][1],
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  selectItem(index);
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: foodItems[index][2]
                                        ? Colors.green
                                        : Colors.white,
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Color(0xff70CCFF),
                        Color(0xff0070AE),
                      ])),
                  height: height * 0.055,
                  width: width * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: MaterialButton(
                      child: const Text('Order'),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => order(
                                      foodOrdered: foodOrdered,
                                    )),
                            (route) => true);
                      },
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
