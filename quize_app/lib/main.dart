import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quize_app/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splashscreen(),
  ));
  //await Firebase.instance.
  
}




// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         initialRoute: '/',
//         routes: {
//           // When navigating to the "/" route, build the FirstScreen widget.
//           '/': (context) => MyHomePage(title: "HomeScreen"),
//           // When navigating to the "/second" route, build the SecondScreen widget.
//           '/SignIn': (context) => SignIn(),
//           '/SignUp': (context) => SignUp(),
//           '/Quize': (context) => Quize(),
//         });
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
  
//   Widget build(BuildContext context) {
   
//     return Scaffold(
      
//       body: Container(
//         color: Colors.indigo[900],
//         // clipBehavior:Clip.none,
//         width: double.maxFinite,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment:MainAxisAlignment.spaceBetween,
//               children: [ Container(
//               width: 80,
//               height: 43,
//               // margin: EdgeInsets.only(
//               //  left: 310,
//               // ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                    topRight: Radius.circular(50),
//                   bottomRight: Radius.circular(50),
//                 ),
//                 color: Colors.cyan[300],
//               ),
//             ),
//             Container(
//               width: 80,
//               height: 43,
//               // margin: EdgeInsets.only(
//               //  left: 310,
//               // ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                    topLeft: Radius.circular(50),
//                   bottomLeft: Radius.circular(50),
//                 ),
//                 color: Colors.cyan[300]
//               ),
//             ),
//             ],
//             ),
              
//             Positioned(
//               top: 0,
//               child: Image.asset(
//                 'image/A.png',
//                 height: 190,
//                 width: 200,
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               //  margin: EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Welcome! learner",
//                       style: TextStyle(fontSize: 30, color: Colors.cyan[300]),
//                     ),
//                     Text(
//                       "let's create your acount for tracking your skill",
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white,
                        
//                       ),
//                     ),
//                   ],
//                 )),
//              SizedBox(height:20),
//              Container(
//               width: 50,
//               height: 20,
//               margin: EdgeInsets.only(
//                right: 310,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                    topRight: Radius.circular(50),
//                   bottomRight: Radius.circular(50),
//                 ),
//                 color: Colors.cyan[300],
//               ),
//             ),
//              SizedBox(height: 20),
//               Container(
//               width: 100,
//               height: 20,
//               margin: EdgeInsets.only(
//                 right: 260,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                  topRight: Radius.circular(50),
//                   bottomRight: Radius.circular(50),
//                 ),
//                 color: Colors.cyan[300],
//               ),
//             ),
//             SizedBox(height: 20),
//               Container(
//               width: 50,
//               height: 20,
//               margin: EdgeInsets.only(
//                 right: 310,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(50),
//                   bottomRight: Radius.circular(50),
//                 ),
//                 color: Colors.cyan[300],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/SignUp');
//                     },
//                     child: Text(
//                       "Sign up",
//                       style: TextStyle(
//                         fontSize: 30,
//                         color: Colors.indigo[900],
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.cyan[300],
//                       padding: EdgeInsets.only(
//                         top: 12,
//                         bottom: 12,
//                         right: 84,
//                         left: 84,
//                       ),
//                       elevation: 5,
//                       shadowColor: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/SignIn');
//                     },
//                     child: Text("Sign in",
//                         style: TextStyle(
//                           fontSize: 30,
//                           color: Colors.indigo[900],
//                         )),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.cyan[300],
//                       padding: EdgeInsets.only(
//                         top: 12,
//                         bottom: 12,
//                         right: 84,
//                         left: 84,
//                       ),
//                       elevation: 5,
//                       shadowColor: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//               Container(
//               width: 50,
//               height: 20,
//               margin: EdgeInsets.only(
//                left: 310,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   bottomLeft: Radius.circular(50),
//                 ),
//                 color: Colors.cyan[300],
//               ),
//             ),
//              SizedBox(height: 20),
//               Container(
//               width: 100,
//               height: 20,
//               margin: EdgeInsets.only(
//                 left: 260,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   bottomLeft: Radius.circular(50),
//                 ),
//                 color: Colors.cyan[300],
//               ),
//             ),
//             SizedBox(height: 20),
//               Container(
//               width: 50,
//               height: 20,
//               margin: EdgeInsets.only(
//                 left: 310,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   bottomLeft: Radius.circular(50),
//                 ),
//                 color: Colors.cyan[300],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
