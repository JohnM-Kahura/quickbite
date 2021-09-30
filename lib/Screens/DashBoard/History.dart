import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _ActiveOrdersState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
              color: Colors.grey[400],
              child: Container(
                // height: 100,
                child:Card(child:Container(child:Column(children:[
                  Row(children:[Container(child:Text('Name:'),),Container(child:Text('0746443944'),),]),
                  Row(mainAxisAlignment:MainAxisAlignment.center,children:[Container(child:Text('Orders'),),]),
                  Row(children:[Text('Burger:'),Text('3'),Text('Smokie:'),Text('8'),Text('Kebab:'),Text('5'),Text('Smocha:'),Text('1'),]),
                  Row(children:[TextButton(onPressed:(){},child:Text('Take Order')),TextButton(onPressed:(){},child:Text('Take order'))]),
                ],),),),
              ),
            );
          }),
         floatingActionButton:FloatingActionButton(
           onPressed:(){
            CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('orders');
    collectionReference.snapshots().listen((snapshot) {
      orders = snapshot.docs;
      print(orders[0]);
    }); 
           },
           child:Text('get data')
         )History