// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultBox extends StatelessWidget {
  final int score;
  final int total_question;
  final VoidCallback onPressed;
  const ResultBox({
    Key? key,
    required this.score,
    required this.total_question,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percent = (score / total_question) * 100;
    String desc = "";
    Color cc = Colors.white;
    String str = "🏆";
    if (percent < 40.0) {
      desc = "Poor!!!";
      cc = Colors.red;
      str = "😑";
    } else if (percent >= 40.0 && percent <= 70.0) {
      desc = "Average!!!";
      cc = Color.fromARGB(255, 139, 89, 204);
      str = "😀";
    } else {
      desc = "Great!!!";
      cc = Colors.green;
      str = "🏆";
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      actions: [
        TextButton(
            onPressed: onPressed,
            child: Center(
              child: Text("Start Over",
                  style: TextStyle(
                    fontSize: 25,
                  )),
            )),
      ],
      backgroundColor: Color.fromARGB(255, 214, 241, 244),
      content: Container(
        height: 280,
        child: Column(children: [
          Divider(
            thickness: 3,
            color: cc,
            indent: 105,
            endIndent: 105,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Result:",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 19, 97, 160)),
              ),
              CircleAvatar(
                backgroundColor: cc,
                radius: 30,
                child: Text(
                  "${score}/${total_question}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "${str}",
            style: TextStyle(fontSize: 73),
          ),
          SizedBox(
            height: 18,
          ),
          Text("${desc}",
              style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, color: cc)),
          SizedBox(
            height: 10,
          ),
          Text("Quiz completed successfully.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}
