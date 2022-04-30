import 'package:flutter/material.dart';

import 'question1/QuestionOnePage.dart';
import 'question2/QuestionTwoPage.dart';
import 'utils/CommonWidgets.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: text("Questions")),
      body: Center(
          child: Column(children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // background
            onPrimary: Colors.white, // foreground
          ),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuestionOnePage()),
            );
          },
          child: text("Question 1"),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // background
            onPrimary: Colors.white, // foreground
          ),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuestionTwoPage()),
            );
          },
          child: text("Question 2"),
        )
      ])),
    );
  }
}
