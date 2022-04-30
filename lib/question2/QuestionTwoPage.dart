import 'package:flutter/material.dart';

import '../utils/CommonWidgets.dart';
import 'QuestionListPage.dart';
import 'model/QuizResponse.dart';
import 'networkCall/RestApis.dart';

class QuestionTwoPage extends StatefulWidget {
  const QuestionTwoPage({Key? key}) : super(key: key);

  @override
  State<QuestionTwoPage> createState() => _QuestionTwoPageState();
}

class _QuestionTwoPageState extends State<QuestionTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text("Quiz"),
      ),
      body: FutureBuilder<List<QuizResponse>>(
        future: getQuizList(),
        builder: (context, snap) {
          if (snap.hasData) {
            return QuestionListPage(snap.data!);
          } else if (snap.hasError) {
            return Center(
              child: text("Error"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              value: 0.8,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
            ),
          );
        },
      ),
    );
  }
}
