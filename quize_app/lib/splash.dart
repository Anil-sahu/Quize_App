import 'dart:async';

import 'package:flutter/material.dart';

import 'package:quize_app/data.dart';
import 'package:quize_app/mainPage.dart';
import 'package:quize_app/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  Future<void> share() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? email = pref.getString('email');
    String? name = pref.getString('name');

    UserData userdata = UserData(
        userName:name, emailAddress: email, password: password, key: "");
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => (email == null ? SignUp() : MainPage(user: userdata)),
    ));
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      share();
    });
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Quizstar\nTest Yourself !!",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontFamily: "Satisfy",
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
               Positioned(
              top: 0,
              child: Image.asset(
                'image/A.png',
                height: 190,
                width: 200,
              ),
            ),
           Text(
              "Quize App",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: "Satisfy",
              ),
              textAlign: TextAlign.center,
            ),
            ],),
              Text(
              "Develop by Anil Sahu",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.cyan[300],
                fontFamily: "Satisfy",
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
    
  }
//  Future <void> getUsername() async{
//     final FirebaseAuth auth=FirebaseAuth.instance;
//    User? user = await auth.currentUser;
//     uid = user!.uid;
//    //final email = uid.email;
//    print(uid);

   
//   }
}
