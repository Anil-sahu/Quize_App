import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quize_app/Quize.dart';

import 'package:quize_app/signup.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'data.dart';


var uid;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class AboutUser extends StatefulWidget {
  UserData user;
  
 
  AboutUser({Key? key, required this.user})
      : super(key: key);

  _AboutUserState createState() => _AboutUserState();
}

class _AboutUserState extends State<AboutUser> {
  
 var name, email;
  
  void initSate() {
    super.initState();
    getuserDetail();
    //getQuizeData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text("Result page"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Positioned(
                  top: 20,
                  child: Image.asset(
                    'image/user.png',
                    width: 150,
                    height: 150,
                  ),
                ),
        
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Container(
                     height: 40,
                     alignment: Alignment.center,
                     child:widget.user.userName==null?Text(username): Text("${widget.user.userName}",
                     style: TextStyle(fontSize: 20),),
                   ),
                    
                    
                   
                  ],
                )),
                Container(
                  alignment: Alignment.center,
                  
                    child:widget.user.emailAddress==null?Text(emailId): Text(
                      "${widget.user.emailAddress}",
                      style: TextStyle(color: Colors.black45, fontSize: 25),
                    ),
                   
                ),
                Container(
                  // elevation:10,
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title: Text(
                      " Total score : ${totalScore}",
                     // style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title: Text(
                      "TotalNo.of correct answer : $right_ans",
                     // style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    onTap: () {
                      print("right_ans$right_ans");
                    },
                  ),
                ),
                Container(
                  // elevation:10,
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title: Text(
                      "Total No. of Wrong answer : $wrong_ans",
                     // style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    onTap: () {
                      print(wrong_ans);
                    },
                  ),
                ),
                Container(
                  // elevation:10,
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title:minus_marking==null?Text("No data"): Text(
                      "Minus marking : $minus_marking",
                     // style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    onTap: () {
                      print(minus_marking);
                    },
                  ),
                ),
                Container(
                  // elevation:10,
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title: Text(
                      "No. of attempt questions : $attemptQuestion",
                     // style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    onTap: () {},
                  ),
                ),
                ListTile(
                    title: Text("Sign out"),
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            elevation: 10,
                            title: Text(
                              "Warning!",
                              style: TextStyle(color: Colors.red),
                            ),
                            content: Text("Are you sure? You want to log out"),
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  SharedPreferences pref =
                                      await SharedPreferences.getInstance();
                                  pref.remove('email');
                                  _signOut(context);
                                },
                                child: Text("Yes! SignOut"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context,'');
                                },
                                child: Text("cancel"),
                              ),
                            ],
                          );
                        },
                      );
                    }),
              ]),
        ),
      ),
    );
  }

  void getuserDetail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('namekey')!;
      email = pref.getString('emailkey')!;
    });
  }

  Future<void> _signOut(BuildContext context) async {
    await _firebaseAuth.signOut().then((_) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SignUp(),
              ));
    });
  }

}
