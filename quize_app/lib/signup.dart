import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quize_app/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Quize.dart';
import 'data.dart';
import 'mainPage.dart';

String username = "", emailId = "", password = "", confPassword = "";
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final FirebaseAuth _auth = FirebaseAuth.instance;
final fb = FirebaseDatabase.instance;
var email, name;
var ref;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void initState() {
    super.initState();
    UserData(
        emailAddress: emailId, password: password, key: '', userName: username);
  }

  @override
  Widget build(BuildContext context) {
    ref = fb.reference().child("User");
    return Container(
      color: Colors.indigo[900],
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Positioned(
                  top: 0,
                  child: Image.asset(
                    'image/A.png',
                    height: 190,
                    width: 200,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Card(
                    color: Colors.cyan[300],
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 0, left: 10, right: 10, bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.indigo[900],
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Text("Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                )),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            // controller: username,
                            decoration: InputDecoration(
                              labelText: "Username",
                              hintText: "Enter a username",
                              icon: Icon(
                                Icons.person,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                username = value;
                              });
                            },
                          ),
                          TextFormField(
                            //  controller: emailId,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Enter your email address",
                              icon: Icon(Icons.email),
                            ),
                            onChanged: (value) {
                              setState(() {
                                emailId = value;
                              });
                            },
                          ),
                          TextFormField(
                            // controller: password,
                            decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Password",
                              icon: Icon(Icons.lock),
                            ),
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                          TextFormField(
                            //   controller: confPassword,
                            decoration: InputDecoration(
                              labelText: "Confirm password",
                              hintText: "Re-enter password",
                              icon: Icon(Icons.lock),
                            ),
                            onChanged: (value) {
                              setState(() {
                                confPassword = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () async {
                              try {
                                UserCredential user =
                                    await _auth.createUserWithEmailAndPassword(
                                  email: emailId.trim(),
                                  password: password.trim(),
                                );
                                if (user != null) {
                                  ref.child(_auth.currentUser!.uid).set({
                                    "name": username,
                                    "email": emailId,
                                    "password": password,
                                  }).then((value) async {
                                    SharedPreferences pref =
                                        await SharedPreferences.getInstance();
                                    pref.setString('email', emailId);
                                    pref.setString('name', username);
                                  });
                                }

                                /// if (_formKey.currentState!.validate()) {
                                setState(() {
                                  UserData userdata = new UserData(
                                    userName: name,
                                    emailAddress: email,
                                    password: password,
                                    key: "",
                                  );
                                  
                                  userDetail(username, emailId);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MainPage(
                                      user: userdata,
                                    
                                    ),
                                  ));
                                });
//}
//}
                              } catch (e) {
                                print(e);
                                username = "";
                                emailId = "";
                                password = "";
                                confPassword = "";
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                top: 12,
                                bottom: 12,
                                right: 24,
                                left: 24,
                              ),
                              elevation: 10,
                              shadowColor: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              // Navigator.pushNamed(context, '/SignIn');\
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ));
                            },
                            child:
                                Text("If you have already sign up, click here"),
                          ),
                          Divider(
                            height: 2,
                            color: Colors.indigo[900],
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userDetail(name, email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('namekey', name);
    await pref.setString('emailkey', email);
  }
}
