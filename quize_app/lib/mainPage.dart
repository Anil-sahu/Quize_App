import 'package:flutter/material.dart';
import 'package:quize_app/Quize.dart';
import 'package:quize_app/signup.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'data.dart';
import 'userInfo.dart';

var uid;
int index = 0;

class MainPage extends StatefulWidget {
  final UserData user;
  
  MainPage({Key? key, required this.user})
      : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final String lat = "37.3230";
  final String lng = "-122.0312";
  final String telephoneNumber = "7610356817";
  late Razorpay _razorpay;
  void initState() {
    super.initState();
    _razorpay = Razorpay();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_NNbwJ9tmM0fbxj',
      'amount': 28200,
      'name': 'Shaiq',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text("MainPage"),
        actions: [
          IconButton(
            onPressed: () {
              //  Navigator.pushNamed(context, '/UserInfo');
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AboutUser(
                  user: widget.user,
                ),
              ));
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      drawer: Drawer(
        
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              
              currentAccountPicture:
                  CircleAvatar(child: Image.asset('image/user.png'),),
              otherAccountsPictures: [
                Image.asset('image/A.png'),
                Image.asset('image/user.png')
              ],
              accountName: widget.user.userName==null?Text(username):Text("${widget.user.userName}"),
              accountEmail: widget.user.emailAddress==null?Text(emailId):Text("${widget.user.emailAddress}"),
              // child:Text("Anil") ,
              
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Support"),
              trailing: Icon(Icons.arrow_right),
              onTap: () async {
                String telephoneUrl = "tel:$telephoneNumber";

                if (await canLaunch(telephoneUrl)) {
                  await launch(telephoneUrl);
                } else {
                  throw "Can't phone that number.";
                }
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text("Aprivecy"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.payment,
              ),
              title: Text("Payment"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                openCheckout();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Google"),
              trailing: Icon(Icons.arrow_right),
              onTap: () async {
                const url = 'https://google.com';
                try {
                  if (await canLaunch(url)) {
                    await launch(url, forceSafariVC: false);
                  }
                } catch (e) {
                  throw 'Could not launch $e same $url';
                }
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.indigo[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                   Column(
                     children: [
                       Container(
                  child: OutlineButton(
                        child: Image.asset(
                          'image/ic_launcher.png',
                          width: 100,
                          height: 100,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Quize(),
                          ));
                        },
                  ),
                  //  ),
                ),
                 Container(
                  height: 40,
                  child:Text("Start Quize",style: TextStyle(color:Colors.white,fontSize: 20),),
                ),
                     ],
                   ),
                  Column(
                    children: [
                      Container(
                      child: OutlineButton(
                        child: Image.asset(
                          'image/ic_launcher.png',
                          width: 100,
                          height: 100,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Quize(),
                          ));
                        },
                      ),
                      //  ),
                ),
                 Container(
                  height: 40,
                  child:Text("Start Quize",style: TextStyle(color:Colors.white,fontSize: 20),),
                ),
                    ],
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                 Column(
                   children: [
                     Container(
                      child: OutlineButton(
                        child: Image.asset(
                          'image/study.png',
                          width: 100,
                          height: 100,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Quize(),
                          ));
                        },
                      ),
                      //  ),
                ),
               Container(
                  height: 40,
                  child:Text("Start Quize",style: TextStyle(color:Colors.white,fontSize: 20),),
                ),
                   ],
                 ),
                  Column(
                    children: [
                      Container(
                      child: OutlineButton(
                        child: Image.asset(
                          'image/study.png',
                          width: 100,
                          height: 100,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Quize(),
                          ));
                        },
                      ),
                      //  ),
                ),
                 Container(
                  height: 40,
                  child:Text("Start Quize",style: TextStyle(color:Colors.white,fontSize: 20),),
                ),
                    ],
                  ),
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  Column(
                    children: [
                      Container(
                      child: OutlineButton(
                        child: Image.asset(
                          'image/A.png',
                          width: 100,
                          height: 100,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Quize(),
                          ));
                        },
                      ),
                      //  ),
                ),
                 Container(
                  height: 40,
                  child:Text("Start Quize",style: TextStyle(color:Colors.white,fontSize: 20),),
                ),
                    ],
                  ),
                Column(
                  children: [
                    Container(
                      
                      child: OutlineButton(
                        
                        child: Image.asset(
                          'image/A.png',
                          width: 100,
                          height: 100,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Quize(),
                          ));
                        },
                      ),
                      //  ),
                    ),
                     Container(
                  height: 40,
                  child:Text("Start Quize",style: TextStyle(color:Colors.white,fontSize: 20),),
                ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              child: Text('Start Quize',style: TextStyle(fontSize: 20,color: Colors.indigo[800]),),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Quize(),
                ));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  right: 24,
                  left: 24,
                ),
                elevation: 3,
                shadowColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo[900],
        currentIndex: index, items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home_filled),
          title: new Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.explore_outlined,color: Colors.white,),
          title: new Text("Explore",style: TextStyle(color: Colors.white),),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.person,color: Colors.white,),
          title: new Text("Profile",style:TextStyle(color: Colors.white)),
        )
      ]),
    );
  }
}
