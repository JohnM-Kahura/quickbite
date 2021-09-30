import 'package:flutter/material.dart';
import 'package:quickbite/Screens/DashBoard/ActiveOrders.dart';
import 'package:quickbite/Screens/DashBoard/History.dart';
import 'package:quickbite/Config/colors.dart';
class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    ActiveOrders(),
    History(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:darkishColor,
        title: Text('Admin DashBoard'),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplanemode_active,
              color: Colors.grey[300],
            ),
            label: 'Active Orders',
            activeIcon: Icon(
              Icons.airplanemode_active,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Colors.black,
            ),
            label: 'History',
            activeIcon: Icon(
              Icons.history,
              color: Colors.black,
            ),
          ),
        ],
         onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
