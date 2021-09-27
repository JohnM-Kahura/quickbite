import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickbite/Screens/Auth/Phone_Auth.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
        appBar: AppBar(
          title: Text("Account"),
          actions: [
            TextButton(
              onPressed: () async{
                _auth.signOut();
                Navigator.of(context).pop();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Authentication()));
              },
              child: Text('Log Out',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
        body: Center(
          child: Text('account'),
        ));
  }
}
