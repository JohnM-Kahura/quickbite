import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ActiveOrders extends StatefulWidget {
  const ActiveOrders({Key? key}) : super(key: key);

  @override
  _ActiveOrdersState createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> {
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
          itemCount: orders.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.grey[400],
              child: Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'orders',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "rere",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => print('sold out'),
                          child: Text('Sold out'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        TextButton(
                          onPressed: () => print('confirm order'),
                          child: Text('Confirm order'),
                        ),
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
