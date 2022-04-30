import 'package:flutter/material.dart';

import 'SelectionPage.dart';
import 'question1/model/ScheduleModel.dart';

List<ScheduleModelDay>? scheduleDays;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectionPage(),
    );
  }
}
