// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_mania/Widget/ResultBox.dart';
import 'package:quiz_mania/models/constants.dart';

import '../models/ques_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_final_fields
  List<Question> _questions = [
    Question(id: '1', title: "Java was invented by ?", options: {
      'James Gosling': true,
      'Pratham': false,
      'Floyd warshal': false,
      'MkGandhi': false
    }),
    Question(
        id: '2',
        title: "Number of primitive data types in Java are ?",
        options: {'8': true, '2': false, '3': false, '10': false}),
    Question(id: '3', title: "Flutter was created by ?", options: {
      'Microsoft': false,
      'Google': true,
      'Tata': false,
      'Apple': false
    }),
    Question(
        id: '4',
        title: "What is the size of float and double in java ?",
        options: {
          '32 & 32': false,
          '64 & 64': false,
          '64 & 32': false,
          '32 & 64': true
        }),
    Question(id: '5', title: "Select the valid statement.", options: {
      'char c[]=new char[];': false,
      'char c[]=new char[4];': true,
      'char c[]=new char;': false,
      'char c=char[4];': false
    }),
    Question(id: '6', title: "Arrays in java are-", options: {
      'Primitive Datatype': false,
      'Object': true,
      'Both A & B': false,
      'None': false
    }),
    Question(
        id: '7',
        title: "When is the object created with new keyword ?",
        options: {
          'At Compile Time': false,
          'At Run Time': true,
          'Depends on Code': false,
          'None': false
        }),
    Question(
        id: '8',
        title: "In which of the following is toString() method defined ?",
        options: {
          'Java.lang.Object': true,
          'Java.land.String': false,
          'Java.util.*': false,
          'None': false
        }),
    Question(id: '9', title: "compareTo() returns ?", options: {
      'True': false,
      'Int Value': true,
      'False': false,
      '0': false
    }),
    Question(
        id: '10',
        title: "To which of the following does the class string belong to. ?",
        options: {
          'java.awt': false,
          'java.lang': true,
          'Java.string': false,
          'java.applet': false
        }),
  ];

  int lightmode = 1;
  int index = 0;
  bool isPressed = false;
  int score = 0;
  void StartOver() {
    setState(() {
      index = 0;
      isPressed = false;
      score = 0;
      second = maxseconds;
      startTimer();
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
  }

  static int maxseconds = 60;
  int second = maxseconds;
  late Timer timer;
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (second > 0) {
        setState(() {
          second--;
        });
      } else {
        setState(() {
          timer.cancel();
          showDialog(
              context: context,
              builder: ((ctx) => ResultBox(
                    score: score,
                    total_question: _questions.length,
                    onPressed: StartOver,
                  )));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, bool> map = _questions[index].options;
    List<String> li = [];
    for (var k in map.keys) {
      li.add(k);
    }
    List<bool> li_color = [];
    for (var v in map.values) {
      li_color.add(v);
    }

    return Scaffold(
      backgroundColor: lightmode == 1 ? lightColorCream : darkColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: lightmode == 1 ? lightColorCream : darkColor,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: lightmode == 1 ? darkColor : lightColor,
        ),
        title: Text(
          "QuizApp",
          style: TextStyle(
              color: lightmode == 1 ? darkColor : lightColor, fontSize: 35),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                lightmode ^= 1;
              });
            },
            icon: Icon(
              Icons.lightbulb_outlined,
              color: lightmode == 1 ? darkColor : lightColor,
            ),
            iconSize: 40,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: lightmode == 1 ? lightColorCream : darkColor,
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Question ${index + 1}/${_questions.length}:",
                    style: TextStyle(
                        color: lightmode == 1 ? darkColor : lightColor,
                        fontSize: 25)),
                Text("Score: ${score}",
                    style: TextStyle(
                        color: lightmode == 1 ? darkColor : lightColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Container(
              height: 550,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Card(
                color: lightmode == 1
                    ? Color.fromARGB(255, 235, 187, 187)
                    : darkColorblue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Divider(
                        color: lightmode == 1
                            ? Color.fromARGB(255, 249, 240, 243)
                            : Color.fromARGB(255, 155, 205, 247),
                        indent: 136,
                        endIndent: 136,
                        thickness: 3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "${_questions[index].title}",
                          style: TextStyle(
                              color: lightmode == 1 ? darkColor : Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                        color: neutral,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 280,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: ((context, indexx) {
                            Color color = (li_color[indexx] == true)
                                ? correct
                                : incorrect;
                            return Card(
                                child: ListTile(
                              tileColor: isPressed
                                  ? color
                                  : (lightmode == 1)
                                      ? Color.fromARGB(255, 228, 237, 244)
                                      : darkColor,
                              onTap: () {
                                setState(() {
                                  if (isPressed == false && color == correct) {
                                    score++;
                                    final snackBar = SnackBar(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      content: Text(
                                        "Correct",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.green,
                                      behavior: SnackBarBehavior.floating,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    isPressed = true;
                                  } else if (isPressed == false) {
                                    final snackBar = SnackBar(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      content: Text(
                                        "InCorrect",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.red,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    isPressed = true;
                                  }
                                });
                              },
                              title: Text(
                                "${String.fromCharCode(indexx + 65)} )     ${li[indexx]}",
                                style: TextStyle(
                                  color: lightmode == 1
                                      ? (isPressed)
                                          ? Colors.white
                                          : Colors.black
                                      : (isPressed)
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                            ));
                          }),
                          itemCount: li.length,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 320,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            onPressed: () {
                              setState(() {
                                if (index == _questions.length - 1) {
                                  timer.cancel();
                                  showDialog(
                                      context: context,
                                      builder: ((ctx) => ResultBox(
                                            score: score,
                                            total_question: _questions.length,
                                            onPressed: StartOver,
                                          )));
                                } else {
                                  index = (index + 1);
                                  isPressed = false;
                                }
                              });
                            },
                            child: Text(
                              "Next Question",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              width: 80,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: second / maxseconds,
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    backgroundColor:
                        second >= 11 ? Colors.greenAccent : Colors.red,
                  ),
                  Center(
                    child: Text(
                      second > 0 ? "$second" : "TimeOver",
                      style: TextStyle(
                          fontSize: second > 0 ? 35 : 15,
                          fontWeight: FontWeight.bold,
                          color: lightmode == 1 ? Colors.black : Colors.white),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
