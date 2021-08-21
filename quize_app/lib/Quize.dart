import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

var totalScore = 0;

var minus_marking = 0;
var right_ans = 0;
var user_name = 0;
var wrong_ans = 0;
var attemptQuestion = 0;

class Quize extends StatefulWidget {
  const Quize({Key? key}) : super(key: key);

  @override
  _QuizeState createState() => _QuizeState();
}

var colorInfo0 = Colors.blue[900];
var colorInfo1 = Colors.blue[900];
var colorInfo2 = Colors.blue[900];
var colorInfo3 = Colors.blue[900];
var backColor0 = Colors.cyan[300];
var backColor1 = Colors.cyan[300];
var backColor2 = Colors.cyan[300];
var backColor3 = Colors.cyan[300];
var icon0 = Icons.check_box_outline_blank;
var icon1 = Icons.circle;
var icon2 = Icons.circle;
var icon3 = Icons.circle;

class _QuizeState extends State<Quize> {
  final fb = FirebaseDatabase.instance;
  var questionNumber=0;
  String question = "Please! click on next button";
  var correctAnswer = "";
  var option = 0;
  String? answer0 = "";
  String? answer1 ="";
  String? answer2 ="";
  String? answer3 = "";

  var count0;
  var count1;
  var count2;
  var count3;
//var correctAnswer;
  var score = 0;

  late int savedScore;
  late int saveQuestion;
  late int minus_mark;
  late int wrongAnswer;
  late int rightAnswer;
  late var seleAnswer0;
  late var seleAnswer1;
  late var seleAnswer2;
  late var seleAnswer3;
  late var seleQuestion;
  Future<SharedPreferences> _prefer = SharedPreferences.getInstance();
  late SharedPreferences prefer;
  gettotal() async {
    prefer = await _prefer;
    savedScore =
        (prefer.containsKey('savedScore') ? prefer.getInt('savedScore') : 0)!;
    totalScore = savedScore;
  }

  getQuestions() async {
    prefer = await _prefer;
    saveQuestion = (prefer.containsKey('savedQuestions')
        ? prefer.getInt('savedQuestions')
        : 0)!;
    questionNumber = saveQuestion;
  }

  getMinusMark() async {
    prefer = await _prefer;
    minus_mark = (prefer.containsKey('savedMinusMark')
        ? prefer.getInt('savedMinusMark')
        : 0)!;
    minus_marking = minus_mark;
  }

  getWrongAns() async {
    prefer = await _prefer;
    wrongAnswer = (prefer.containsKey('savedWrongAns')
        ? prefer.getInt('savedWrongAns')
        : 0)!;
    wrong_ans = wrongAnswer;
  }

  getRightAns() async {
    prefer = await _prefer;
    rightAnswer = (prefer.containsKey('savedRightAns')
        ? prefer.getInt('savedRightAns')
        : 0)!;
    right_ans = rightAnswer;
  }

  getAnswer0() async {
    prefer = await _prefer;
    seleAnswer0 = (prefer.containsKey('savedAnswer0')
        ? prefer.getString('savedAnswer0')
        : "click Start quize");
    answer0 = seleAnswer0;
  }

  getAnswer1() async {
    prefer = await _prefer;
    seleAnswer1 = (prefer.containsKey('savedAnswer1')
        ? prefer.getString('savedAnswer1')
        : "click start quize");
    answer1 = seleAnswer1;
  }

  getAnswer2() async {
    prefer = await _prefer;
    seleAnswer2 = (prefer.containsKey('savedAnswer2')
        ? prefer.getString('savedAnswer2')
        : "click start quize");
    answer2 = seleAnswer2;
  }

  getAnswer3() async {
    prefer = await _prefer;
    seleAnswer3 = (prefer.containsKey('savedAnswer3')
        ? prefer.getString('savedAnswer3')
        : "click start quize");
    answer3 = seleAnswer3;
  }

  getQuestion() async {
    prefer = await _prefer;
    seleQuestion = (prefer.containsKey('savedQuestion')
        ? prefer.getString('savedQuestion')
        : "click start quize");
    question = seleQuestion;
  }

  initState() {
    getAnswer0();
    getAnswer1();
    getAnswer2();
    getAnswer3();
    getQuestion();
    getMinusMark();
    gettotal();
    getQuestions();

    super.initState();
  }

  String _questions =
      '{"questions": [{"question": "What is the scientific name of a butterfly?","answers": ["Apis", "Coleoptera","Formicidae","Rhopalocera"],"correctIndex":"Rhopalocera" },{"question": "How hot is the surface of the sun?","answers": [ "1,233 K","5,778 K","12,130 K","101,300 K"], "correctIndex": "5,778 K" },{ "question": "Who are the actors in The Internship?","answers": ["Ben Stiller, Jonah Hill","Courteney Cox, Matt LeBlanc","Kaley Cuoco, Jim Parsons","Vince Vaughn, Owen Wilson" ], "correctIndex": "Vince Vaughn, Owen Wilson" },{"question": "What is the capital of Spain?","answers": [ "Berlin","Buenos Aires","Madrid","San Juan" ],"correctIndex": "Madrid" },{"question": "What are the school colors of the University of Texas at Austin?","answers": ["white, Red","Blue, Orange", "White, Burnt Orange", "White, Old gold, Gold" ],"correctIndex":"White, Burnt Orange"},{"question": "What is 70 degrees Fahrenheit in Celsius?","answers": ["18.8889","20","21.1111","158"],"correctIndex": "21.1111"},{"question": "When was Mahatma Gandhi born?","answers": ["October 2, 1869","December 15, 1872","July 18, 1918","January 15, 1929"], "correctIndex": "October 2, 1869"},{"question": "How far is the moon from Earth?","answers": ["7,918 miles (12,742 km)","86,881 miles (139,822 km)","238,400 miles (384,400 km)","35,980,000 miles (57,910,000 km)"],"correctIndex": "238,400 miles (384,400 km)"},{"question": "What is 65 times 52?", "answers": ["117","3120","3380", "3520" ], "correctIndex": "3380"},{"question": "How tall is Mount Everest?","answers": ["6,683 ft (2,037 m)","7,918 ft (2,413 m)","19,3q41 ft (5,895 m)","29,029 ft (8,847 m)"],"correctIndex": "29,029 ft (8,847 m)"},{"question": "When did The Avengers come out?","answers": ["May 2, 2008","May 4, 2012","May 3, 2013","April 4, 2014"],"correctIndex": "May 4, 2012"},{"question": "What is 48,879 in hexidecimal?","answers": ["0x18C1", "0xBEEF","0xDEAD", "0x12D591"],"correctIndex":  "0xBEEF"}]}';
  @override
  Widget build(BuildContext context) {
    final ref = fb.reference().child('Score');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text("Startquize"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Quize(),
              ));
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      //drawer: Drawer(child: Text("s"),),
      //Paddin
      body: Container(
        color: Colors.blue[900],
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                    child: Text("$minus_marking",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("-ve",
                      style: TextStyle(fontSize: 30, color: Colors.red[200])),
                ],
              ),
              Row(
                children: [
                  Text("+ve",
                      style: TextStyle(fontSize: 30, color: Colors.green[200])),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                    child: Text("$totalScore",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                ],
              ),
            ]),
            Text(
              "Question No. $questionNumber",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              height: 150,
              width: double.maxFinite,
              color: Colors.white,
              child: Text("$question",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.indigo[900],
                  )),
            ),
            Container(
              // color: backColor0,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: backColor0,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.circle,
                  color: colorInfo0,
                ),
                title: Text(answer0!, style: TextStyle(color: colorInfo0)),
                trailing: Icon(
                  icon0,
                  color: colorInfo0,
                ),

                onTap: () {
                  setState(() {
                    if (questionNumber != 0 && count0 == 1) {
                      if (answer0 == correctAnswer) {
                        colorInfo0 = Colors.green[900];
                        backColor0 = Colors.green[100];
                        icon0 = Icons.check_box_rounded;
                        // score = score+10;
                        totalScore = totalScore + 10;

                        right_ans = right_ans + 1;
                      } else if (answer0 != correctAnswer) {
                        colorInfo0 = Colors.red[900];
                        backColor0 = Colors.red[100];
                        icon0 = Icons.cancel_rounded;
                        // score = score-3;
                        wrong_ans = wrong_ans + 1;
                        minus_marking += 10;
                      }
                    } else {
                      // backColor0 = Colors.indigo[900];
                      return null;
                    }
                    count0++;
                  });
                  prefer.setInt('savedMinusMark', minus_marking);
                  prefer.setInt('savedScore', totalScore);
                  prefer.setInt('savedWrongAns', wrong_ans);
                  prefer.setInt('savedRightAns', right_ans);
                  setQuizeData();
                },
                // child: Text(answer0, style: TextStyle(color: colorInfo0)),
              ),
            ),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: backColor1,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
              ),
              //color: Color(),
              child: ListTile(
                onTap: () {
                  setState(() {
                    if (questionNumber != 0 && count1 == 1) {
                      if (answer1 == correctAnswer) {
                        colorInfo1 = Colors.green[900];
                        backColor1 = Colors.green[100];
                        icon1 = Icons.check_circle;
                        totalScore = totalScore + 10;
                        right_ans = right_ans + 1;
                      }
                      if (answer1 != correctAnswer) {
                        colorInfo1 = Colors.red[900];
                        backColor1 = Colors.red[100];
                        icon1 = Icons.cancel_rounded;
                        minus_marking += 10;
                        wrong_ans = wrong_ans + 1;
                      }
                    } else {
                      //backColor1 = Colors.indigo[900];
                      return null;
                    }
                    count1++;
                  });
                  prefer.setInt('savedMinusMark', minus_marking);
                  prefer.setInt('savedScore', totalScore);
                  prefer.setInt('savedWrongAns', wrong_ans);
                  prefer.setInt('savedRightAns', right_ans);
                },
                leading: Icon(
                  Icons.circle,
                  color: colorInfo1,
                ),
                title: Text(answer1!, style: TextStyle(color: colorInfo1)),
                trailing: Icon(
                  icon1,
                  color: colorInfo1,
                ),
              ),
            ),
            Container(
              //color: backColor2,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: backColor2,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
              ),
              child: ListTile(
                onTap: () {
                  setState(() {
                    if (questionNumber != 0 && count2 == 1) {
                      if (answer2 == correctAnswer) {
                        colorInfo2 = Colors.green[900];
                        backColor2 = Colors.green[100];
                        icon2 = Icons.check_circle;
                        totalScore = totalScore + 10;

                        right_ans = right_ans + 1;
                      } else if (answer2 != correctAnswer) {
                        colorInfo2 = Colors.red[900];
                        backColor2 = Colors.red[100];
                        icon2 = Icons.cancel_rounded;
                        minus_marking += 10;
                        wrong_ans = wrong_ans + 1;
                      }
                    } else {
                      // backColor2 = Colors.indigo[900];
                      return null;
                    }
                    count2++;
                  });

                  prefer.setInt('savedMinusMark', minus_marking);
                  prefer.setInt('savedScore', totalScore);
                  prefer.setInt('savedWrongAns', wrong_ans);
                  prefer.setInt('savedRightAns', right_ans);
                  setQuizeData();
                },
                leading: Icon(
                  Icons.circle,
                  color: colorInfo2,
                ),
                title: Text(answer2!, style: TextStyle(color: colorInfo2)),
                trailing: Icon(icon2, color: colorInfo2),

                // child: Text(answer2!, style: TextStyle(color: colorInfo2)),
              ),
            ),
            Container(
              //color: backColor3,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: backColor3,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
              ),
              child: ListTile(
                onTap: () {
                  setState(() {
                    if (questionNumber != 0 && count3 == 1) {
                      if (answer3 == correctAnswer) {
                        colorInfo3 = Colors.green[900];
                        backColor3 = Colors.green[100];
                        icon3 = Icons.check_circle;
                        totalScore = totalScore + 10;
                        right_ans = right_ans + 1;
                      } else if (answer3 != correctAnswer) {
                        colorInfo3 = Colors.red[900];
                        backColor3 = Colors.red[100];
                        icon3 = Icons.cancel_rounded;
                        minus_marking += 10;
                        wrong_ans = wrong_ans + 1;
                      }
                    } else {
                      // backColor3 = Colors.indigo[900];
                    

                      return null;
                    }
                    count3++;
                  });
                  setQuizeData();
                  prefer.setInt('savedMinusMark', minus_marking);
                  prefer.setInt('savedScore', totalScore);
                  prefer.setInt('savedWrongAns', wrong_ans);
                  prefer.setInt('savedRightAns', right_ans);
                },
                leading: Icon(
                  Icons.circle,
                  color: colorInfo3,
                ),
                title: Text(answer3!, style: TextStyle(color: colorInfo3)),
                trailing: Icon(
                  icon3,
                  color: colorInfo3,
                ),

                // child: Text(answer3!, style: TextStyle(color: colorInfo3)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text(
                " Next ",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Map decoded = jsonDecode(_questions);

                setState(() {
                  if (questionNumber < decoded['questions'].length) {
                    question = decoded['questions'][questionNumber]['question'];
                    answer0 =
                        decoded['questions'][questionNumber]['answers'][0];

                    answer1 =
                        decoded['questions'][questionNumber]['answers'][1];

                    answer2 =
                        decoded['questions'][questionNumber]['answers'][2];

                    answer3 =
                        decoded['questions'][questionNumber]['answers'][3];

                    correctAnswer =
                        decoded['questions'][questionNumber]['correctIndex'];
                    questionNumber = questionNumber + 1;
                    attemptQuestion = questionNumber;
                    colorInfo0 = Colors.blue[900];
                    colorInfo1 = Colors.blue[900];
                    colorInfo2 = Colors.blue[900];
                    colorInfo3 = Colors.blue[900];
                    backColor0 = Colors.cyan[300];
                    backColor1 = Colors.cyan[300];
                    backColor2 = Colors.cyan[300];
                    backColor3 = Colors.cyan[300];
                    icon0 = Icons.check_box_outline_blank;
                    icon1 = Icons.check_box_outline_blank;
                    icon2 = Icons.check_box_outline_blank;
                    icon3 = Icons.check_box_outline_blank;
                    count0 = 1;
                    count1 = 1;
                    count2 = 1;
                    count3 = 1;
                  } else if (questionNumber == decoded['questions'].length) {
                    answer0 = " ";
                    answer1 = " ";
                    answer2 = " ";
                    answer3 = " ";
                    colorInfo0 = Colors.blue[900];
                    colorInfo1 = Colors.blue[900];
                    colorInfo2 = Colors.blue[900];
                    colorInfo3 = Colors.blue[900];
                    backColor0 = Colors.grey;
                    backColor1 = Colors.grey;
                    backColor2 = Colors.grey;
                    backColor3 = Colors.grey;
                    icon0 = Icons.check_box_outline_blank;
                    icon1 = Icons.check_box_outline_blank;
                    icon2 = Icons.check_box_outline_blank;
                    icon3 = Icons.check_box_outline_blank;
                    question = " Questions is end";
                    int scoreIs = totalScore - minus_marking;
                    questionNumber = 0;

                    showDialog(
                      barrierColor: scoreIs <= 0 ? Colors.red : Colors.green,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: scoreIs <= 0
                              ? Colors.red[100]
                              : Colors.green[100],
                          elevation: 10,
                          title: Icon(
                              scoreIs <= 0
                                  ? Icons.cancel
                                  : Icons.check_circle,
                              color: scoreIs <= 0
                                  ? Colors.red[800]
                                  : Colors.green[800],size: 50,),
                          content: Text(
                            "Your Score is  :\t\t$scoreIs",
                            style: TextStyle(
                                fontSize: 20,
                                color: scoreIs <= 0
                                    ? Colors.red[800]
                                    : Colors.green[800]),
                          ),
                          actions: [
                            OutlineButton(
                              //  color: Colors.indigo[900],
                              onPressed: () {
                                Navigator.pushNamed(context, '/Quize');
                              },
                              child: Text(
                                "Ok",
                                style: TextStyle(color: Colors.indigo[900]),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                    minus_marking = 0;
                    totalScore = 0;
                    right_ans = 0;
                    wrong_ans = 0;
                  }
                });

                prefer.setInt('savedQuestions', questionNumber);
                prefer.setString('savedAnswer0', answer0!);
                prefer.setString('savedAnswer1', answer1!);
                prefer.setString('savedAnswer2', answer2!);
                prefer.setString('savedAnswer3', answer3!);
                prefer.setString('savedQuestion', question);
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
          ],
        ),
      ),
    );
  }

//total, wrong, right, minus, questions
  Future<void> setQuizeData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('totalscore', totalScore);
    pref.setInt('minus', minus_marking);
    pref.setInt('right', right_ans);
    pref.setInt('wrong', wrong_ans);
    pref.setInt('questions', questionNumber);
  }
}
