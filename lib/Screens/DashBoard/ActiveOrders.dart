import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickbite/Config/colors.dart';

class ActiveOrders extends StatefulWidget {
  const ActiveOrders({Key? key}) : super(key: key);

  @override
  _ActiveOrdersState createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> {
  List orders = [];
  bool isAdmin = true;
  
  
  User? _user =FirebaseAuth.instance.currentUser;
  // _getOrders(){
  //   CollectionReference collectionReference=FirebaseFirestore.instance.collection('Phone');
  // //  String  result=collectionReference.doc(_user!.phoneNumber).get();
  // }
  // @override
  // void initState() {
  //   super.initState();
    
  // _streamController=StreamController();
  //   _stream=_streamController.stream;
  //   // CollectionReference collectionReference =
  //   //     FirebaseFirestore.instance.collection('order');
  //   // collectionReference.snapshots().listen((snapshot) {
  //   //   orders = snapshot.docs;
  //   //   print(orders);
  //   // });
  // }
  Stream<QuerySnapshot> _ordersStream =FirebaseFirestore.instance.collection('Phone').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          stream: _ordersStream,
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot)  {
            if(snapshot.hasError){
              return Text('Something went wrong');
            }if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot documentSnapshot=snapshot.data!.docs[index];
                  return Card(
                    child: Container(
                      child: Column(
                        children: [
                          Row(children: [
                            
                            Container(
                              child: Text(documentSnapshot.toString(), style: dashboardStyle),
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                if(isAdmin==true)
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Sold out',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                if(isAdmin==false)
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Pending',
                                  ),
                                ),
                                if(isAdmin==true)
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Take order',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  );
                });
          }
        ),
        );
  }
}
