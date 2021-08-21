import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quize_app/signup.dart';
import 'data.dart';
import 'mainPage.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

TextEditingController emailId = new TextEditingController();
TextEditingController password = new TextEditingController();
final storage = FlutterSecureStorage();

class _SignInState extends State<SignIn> {
  void initState() {
    super.initState();
    setState(() {
      UserData(emailAddress: '', password: '', userName: '', key: '');
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[900],
      child: SingleChildScrollView(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Positioned(
                  child: Image.asset(
                    'image/A.png',
                    height: 190,
                    width: 200,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  // height: 500,
                  // padding: EdgeInsets.all(20),
                  child: Card(
                    color: Colors.cyan[300],
                    elevation: 10,
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
                            child: Text("Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                )),
                          ),
                          SizedBox(height: 60),
                          TextFormField(
                            controller: emailId,
                            decoration: InputDecoration(
                              labelText: "Username/email",
                              hintText: "username/email;",
                              icon: Icon(
                                Icons.person,
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                          TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Password",
                              icon: Icon(Icons.lock),
                            ),
                            onChanged: (value) {},
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () async {
                              try {
                                User? user = (await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                  email: emailId.text.trim(),
                                  password: password.text.trim(),
                                )).user;
                              
                                    
                                if (user != null) {
                                  UserData user = new UserData(
                                    emailAddress: emailId.text,
                                    password: password.text, userName: '', key: '',
                                  );
                                
                                  setState(() {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          MainPage(user: user,),
                                    ));
                                  });

                                  //&&
                                  // _formKey.currentState!.validate()
                                }
                              } catch (e) {
                                print(e);

                                emailId.text = "";
                                password.text = "";
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo[900],
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
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SignUp(),
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
}
