import 'package:flutter/material.dart';
import 'package:quickbite/Screens/Home/config.dart';
import 'package:quickbite/Widgets/UserNavDrawer.dart';
import 'package:quickbite/Widgets/customItem.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Center(
            child: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.tealAccent,
        actions: [
          IconButton(
            onPressed: () => print('Account info'),
            icon: Icon(Icons.person),
          ),
        ],
      ),
      drawer: UserNavDrawer(),
      body: ListView.builder(
        itemCount: itemsOnSale.length,
        itemBuilder: (BuildContext context, int index) {
          return customItemView(context,itemsOnSale[index],itemsImages[index]);
        },
      ),
    );
  }
}

