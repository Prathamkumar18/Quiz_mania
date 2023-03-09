import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_mania/Pages/homePage.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 252, 253),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 136, right: 140, top: 140),
              child: Icon(
                CupertinoIcons.question_diamond_fill,
                size: 140,
                color: Color.fromARGB(255, 70, 130, 167),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              "Quiz App",
              style: TextStyle(
                  color: Color.fromARGB(255, 20, 77, 123),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              "Learn * Take Quiz * Repeat",
              style: TextStyle(
                  color: Color.fromARGB(255, 41, 162, 227),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Welcome $name ",
              style: TextStyle(
                color: Color.fromARGB(255, 11, 49, 81),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30, right: 40),
              child: TextFormField(
                onChanged: (value) {
                  name = value;
                  //To refresh (calls build method)
                  setState(() {});
                },
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Username can't be empty";
                  }
                  setState(() {
                    name = value.toString();
                  });
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "UserName",
                    labelText: "Enter Your Name",
                    icon: Icon(CupertinoIcons.person_crop_circle)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 250,
              height: 40,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {
                    if (name.length == 0) {
                      Fluttertoast.showToast(
                          msg: "UserName should not be empty!!!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color.fromARGB(255, 194, 204, 244),
                          textColor: Colors.black,
                          fontSize: 12.0);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "PLAY",
                        style: TextStyle(
                          fontSize: 26,
                          color: Color.fromARGB(255, 209, 210, 241),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        CupertinoIcons.arrow_right_circle_fill,
                        size: 35,
                        color: Color.fromARGB(255, 209, 210, 241),
                      )
                    ],
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
