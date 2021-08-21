// import 'package:shared_preferences/shared_preferences.dart';

// class SaveData{
//  static String totalKey="TOTALSCORE";
//  static String namekey = "NAME";
//  static String emailkey = "EMAIL";
//  static String questionkey = "QUESTIONS";
//  static String rightAnswerkey = "RIGHTANS";
//  static String wrongAnskey = "WRONGKANS";
//  static String minusMrkkey = "MINUSMARK";
 
//  static Future<void> saveName(name)async{
//    SharedPreferences pref = await SharedPreferences.getInstance();
//    await pref.setString(namekey, name);

//  }
//  static Future<void> saveEmail(email)async{
//    SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setString(emailkey,email);

//  }
//  static Future<void> saveTotal(totalScore)async{
//    SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setInt(totalKey, totalScore);

//  }
//   static Future<void> questions(questions)async{
//    SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setInt(questionkey, questions);

//  }
//   static Future<void> rightAns(rightAns)async{
//    SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setInt(questionkey, rightAns);

//  }
//   static Future<void>wrongAns(wrongAns)async{
//    SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setInt(questionkey, wrongAns);

//  }
//   static Future<void> minusMark(minusMark)async{
//    SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setInt(questionkey, minusMark);

//  }
// void getName()async{
//   SharedPreferences pref = await SharedPreferences.getInstance();
//  pref.getString(namekey);

// }
// void getQuestions()async{
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   pref.getInt(questionkey);

// }

// void getTotal()async{
//   SharedPreferences pref = await SharedPreferences.getInstance();
// pref.getInt(totalKey);
// }
// void getRight()async{
//   SharedPreferences pref = await SharedPreferences.getInstance();
// pref.getInt(rightAnswerkey);

// }
// void getWrong()async{
//   SharedPreferences pref = await SharedPreferences.getInstance();
// pref.getInt(wrongAnskey);

// }
// void getMinus()async{
//   SharedPreferences pref = await SharedPreferences.getInstance();
// pref.getInt(minusMrkkey);

// }
// }





                  // ref.child('UserName').set(emailId);
                  // ref.child('totalScore').set(totalScore);
                  // ref.child('Minus_Marking').set(minus_marking);
                  // ref.child('Right_answer').set(right_ans);
                  // ref.child('wrong_answer').set(wrong_ans);
                  // ref.child('totalScore').once().then((DataSnapshot snap) {
                  //   setState(() {
                  //     retrivedata = snap.value;
                    
                  //   });
                  // });
                  // ref.child('Right_answer').once().then((DataSnapshot snap) {
                  //   setState(() {
                  //     rightAns = snap.value;
                  //    // saveScore(rightAns);
                  //   });
                  // });
                  // ref.child('wrong_answer').once().then((DataSnapshot snap) {
                  //   setState(() {
                  //     wrongAns = snap.value;
                  //    // saveScore(minus_marking);
                  //   });
                  // });
                  // ref.child('Minus_Marking').once().then((DataSnapshot snap) {
                  //   setState(() {
                  //     minus_marking = snap.value;
                  //    saveScore(minus_marking);
                  //   });
                  // });
                  // ref.child('emailId').once().then((DataSnapshot snap) {
                  //   setState(() {
                  //   email = snap.value;
                  //    // saveScore(rightAns);
                  //   });
                  // });