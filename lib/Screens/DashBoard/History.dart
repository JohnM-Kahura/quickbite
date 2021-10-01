import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickbite/Config/colors.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
bool isAdmin =false;
  List orders = [];
  @override
  void initState() {
    super.initState();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('order');
    collectionReference.snapshots().listen((snapshot) {
      orders = snapshot.docs;
      print(orders);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Container(
                  child: Column(
                    children: [
                      Row(children: [
                        Container(
                          child: Text('Name:', style: dashboardStyle),
                        ),
                        Container(
                          child: Text('John', style: dashboardStyle),
                        ),
                      ]),
                      Row(children: [
                        Container(
                          child: Text('Phone:', style: dashboardStyle),
                        ),
                        Container(
                          child: Text('0746443944', style: dashboardStyle),
                        ),
                      ]),
                      Row(children: [
                        Text('Burger:', style: dashboardStyle),
                        Text('3', style: dashboardNumberStyle),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Smokie:', style: dashboardStyle),
                        ),
                        Text('8', style: dashboardNumberStyle),
                      ]),
                      Row(
                        children: [
                          Text('Kebab:', style: dashboardStyle),
                          Text('3', style: dashboardNumberStyle),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text('Smocha:', style: dashboardStyle),
                          ),
                          Text('8', style: dashboardNumberStyle),
                        ],
                      ),
                     
                    ],
                  ),
                ),
              );
            }),
      );
  }
}
