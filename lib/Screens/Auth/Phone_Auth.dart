import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickbite/Screens/Home/Home.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  MobileVerificationState currentState =MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verficationId='';
  bool showLoading=false;
  void signInwithPhoneCredentials(PhoneAuthCredential phoneAuthCredential) async {

    setState(() {
      showLoading=true;
    });
try {
  final authCredential=await _auth.signInWithCredential(phoneAuthCredential);
  setState(() {
    showLoading=false;
  });
  if(authCredential.user!=null){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    
  }
}on FirebaseAuthException catch (e) {
  setState(() {
    showLoading=false;
  });
  _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(e.message.toString())));
}
  }
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey ,
      body:showLoading? Center(child: CircularProgressIndicator(),): currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
          ? Column(
              children: [
                Container(
                  color: Colors.blue,
                  height: 100,
                  child: Text('Enter the Verification Code sent to your phone'),
                ),
                TextField(
                  controller: phoneController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  autocorrect: false,
                  cursorColor: Colors.blue,
                  cursorRadius: Radius.circular(4.0),
                  // cursorWidth: 15,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    setState(() {
                      showLoading=true;
                    });
                    await _auth.verifyPhoneNumber(
                        phoneNumber: phoneController.text,
                        verificationCompleted: (phoneAuthCredential) async {
                          setState(() {
                      showLoading=false;
                    });
                    // signInwithPhoneCredentials(phoneAuthCredential);
                        },
                        verificationFailed: (verificationFailed) async {
                          // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(verificationFailed.message.toString())));
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text(verificationFailed.message.toString())));
                            setState(() {
                      showLoading=false;
                    });
                        },
                        codeSent: (verificationId, resendingToken) async {
                          setState(() {
                            showLoading=false;
                            currentState =MobileVerificationState.SHOW_OTP_FORM_STATE;
                            verficationId=verificationId;
                          });
                        },
                        codeAutoRetrievalTimeout: (verficationId) async {});
                  },
                  child: Text('Continue'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Container(
                  color: Colors.blue,
                  height: 100,
                  child: Text('quickbite'),
                ),
                TextField(
                  controller: otpController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  
                  autocorrect: false,
                  cursorColor: Colors.blue,
                  cursorRadius: Radius.circular(4.0),
                 
                  // cursorWidth: 15,
                  decoration: InputDecoration(
                    hintText: 'Verification Code',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: ()async {
                    
                    PhoneAuthCredential phoneAuthCredential=PhoneAuthProvider.credential(verificationId: verficationId, smsCode:otpController.text );
                  //signing in the user to firebase
                  FocusScope.of(context).requestFocus(FocusNode());
                  signInwithPhoneCredentials(phoneAuthCredential);

                  
                  },
                  child: Text('Verify'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                ),
              ],
            ),
    );
  }

  
}
