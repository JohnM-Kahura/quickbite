import 'package:flutter/material.dart';
import 'package:quickbite/Screens/Account/Account.dart';
import 'package:quickbite/Screens/DashBoard/DashBoard.dart';
import 'package:quickbite/Screens/Settings/Settings.dart';

class UserNavDrawer extends StatelessWidget {
  const UserNavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: MediaQuery.of(context).size.width - 100,
            ),
            ListTile(
                leading: Icon(
                  Icons.person
                ),
                title: Text('Account'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Account(),
                    ),
                  );
                }),
            ListTile(
                leading: Icon(
                  Icons.settings,
                ),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Settings(),
                    ),
                  );
                }),
            ListTile(
                leading: Icon(
                  Icons.dashboard,
                ),
                title: Text('DashBoard'),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => DashBoard(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
