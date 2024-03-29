
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final TextEditingController SouceController = TextEditingController();
  final TextEditingController DestinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    DateTime now = DateTime.now();
    String formattedDate = "${now.day}-${now.month}-${now.year}";
    String formattedTime = "${now.hour}:${now.minute}:${now.second}";

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    child: Container(
                  color: const Color(0xffd44d57),
                  height: 320,
                  width: w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Positioned(
                          left: 10,
                          top: 20,
                          child: Text(
                            "Bus tickets",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 22),
                          )),
                      Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://play-lh.googleusercontent.com/5ZxVI65M9_yQQHgsY2f_lvSFD9E4Oqvfgxkg-E-MZwWt1M65-6HLY3twREAubQtZqqo"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20)),
                          )),
                      Positioned(
                  
                          top: 70,
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              width: w - 20,
                              height: 220,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: <Widget>[
                                   Positioned(
                                      top: 20,
                                      left: 20,
                                      right: 20,
                                      child: Column(
                                        children: [
                                          TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Enter souce location',
                                              suffixIcon: IconButton(onPressed: (() {
                                                //
                                              }), icon: Icon(Icons.search))
                                            ),
                                          ),
                                        TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Enter destination location',
                                              suffixIcon: IconButton(onPressed: (() {
                                                //
                                              }), icon: Icon(Icons.search))
                                            ),
                                          )
                                          
                                        ],
                                      )),

                                 Positioned(
                                      top: 130,
                                      left: 20,
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              
                                              const Text("Time : ",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                             const  SizedBox(
                                                width: 15,
                                              ),
                                    
                                              Text(
                                                formattedTime,
                                                style:const  TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                         const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                                formattedDate,
                                                style:const  TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black),
                                              )
                                        ],
                                      )),
                                  Positioned(
                                      top: 165,
                                      left: 20,
                                      right: 20,
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xffd44d57),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: TextButton(
                                          onPressed: () {
                                            // search page
                                          },
                                          child: const Center(
                                              child: Text(
                                            "SEARCH",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 18),
                                          )),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "You Can Also Book",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    width: 100,
                    margin: const EdgeInsets.all(10),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.bus_alert,
                          color: Color(0xffd44d57),
                          size: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Cab/Bus Hire",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    width: 100,
                    margin: const EdgeInsets.all(10),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.train,
                          color: Color(0xffd44d57),
                          size: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Red Rail",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All buses",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                       
                      },
                      child: const Text("Show all",
                          style: TextStyle(fontSize: 15)))
                ],
              ),
            ),
            const SizedBox(
              height: 1,
            ),
              Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Special buses",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        
                      },
                      child: const Text("Show all",
                          style: TextStyle(fontSize: 15)))
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
