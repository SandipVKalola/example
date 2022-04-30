import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/CommonWidgets.dart';
import 'model/QuizResponse.dart';

// ignore: must_be_immutable
class QuestionListPage extends StatefulWidget {
  List<QuizResponse> quizData;

  QuestionListPage(this.quizData, {Key? key}) : super(key: key);

  @override
  State<QuestionListPage> createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  int index = 0;

  @override
  build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.deepOrangeAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (cont, inx) {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: (index == inx)
                              ? Colors.white
                              : Colors.transparent,
                          // border color
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: (widget.quizData[inx].selectedAns == "")
                              ? Text("${inx + 1}")
                              : (widget.quizData[inx].selectedAns ==
                                      widget.quizData[inx].correctAnswer)
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15.0,
                                    )
                                  : const Icon(
                                      Icons.clear,
                                      color: Colors.black87,
                                      size: 15.0,
                                    ),
                        ),
                      ),
                    );
                  },
                  itemCount: widget.quizData.length),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text("Question ${index + 1}/${widget.quizData.length}",
                      fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: text(widget.quizData[index].question!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.quizData[index].selectedAns = "answer_a";
                      setState(() {
                        index++;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: (widget.quizData[index].selectedAns ==
                                widget.quizData[index].correctAnswer)
                            ? Colors.green
                            : Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: text(
                          "A. ${widget.quizData[index].answers!.answerA!}"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.quizData[index].selectedAns = "answer_a";
                      setState(() {
                        index++;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: text(
                          "B. ${widget.quizData[index].answers!.answerB!}"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.quizData[index].selectedAns = "answer_a";
                      setState(() {
                        index++;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: text(
                          "C. ${widget.quizData[index].answers!.answerC!}"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.quizData[index].selectedAns = "answer_a";
                      setState(() {
                        index++;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: text(
                          "D. ${widget.quizData[index].answers!.answerD!}"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (index > 0)
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue, // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () async {
                                setState(() {
                                  index--;
                                });
                              },
                              child: text("Previous"),
                            )
                          : const SizedBox(
                              width: 10,
                            ),
                      (index == widget.quizData.length - 1)
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue, // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () async {
                                setState(() {
                                  index++;
                                });
                              },
                              child: text("Submit"),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue, // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () async {
                                setState(() {
                                  index++;
                                });
                              },
                              child: text("Next"),
                            )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
