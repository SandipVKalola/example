import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/CommonWidgets.dart';
import '../utils/StringUtils.dart';
import 'SchedulePage.dart';
import 'model/ScheduleModel.dart';

class QuestionOnePage extends StatefulWidget {
  const QuestionOnePage({Key? key}) : super(key: key);

  @override
  State<QuestionOnePage> createState() => _QuestionOnePageState();
}

class _QuestionOnePageState extends State<QuestionOnePage> {
  String _scheduleMessage = "";

  @override
  void initState() {
    super.initState();
    if (scheduleDays == null) {
      scheduleDays = [];
      init();
    }
  }

  init() {
    scheduleDays!.add(ScheduleModelDay("Sun", [
      ScheduleTimeSlot(morning),
      ScheduleTimeSlot(afternoon),
      ScheduleTimeSlot(evening),
    ]));
    scheduleDays!.add(ScheduleModelDay("Mon", [
      ScheduleTimeSlot(morning),
      ScheduleTimeSlot(afternoon),
      ScheduleTimeSlot(evening),
    ]));
    scheduleDays!.add(ScheduleModelDay("Tue", [
      ScheduleTimeSlot(morning),
      ScheduleTimeSlot(afternoon),
      ScheduleTimeSlot(evening),
    ]));
    scheduleDays!.add(ScheduleModelDay("Wed", [
      ScheduleTimeSlot(morning),
      ScheduleTimeSlot(afternoon),
      ScheduleTimeSlot(evening),
    ]));
    scheduleDays!.add(ScheduleModelDay("Thu", [
      ScheduleTimeSlot(morning),
      ScheduleTimeSlot(afternoon),
      ScheduleTimeSlot(evening),
    ]));
    scheduleDays!.add(ScheduleModelDay("Fri", [
      ScheduleTimeSlot(morning),
      ScheduleTimeSlot(afternoon),
      ScheduleTimeSlot(evening),
    ]));
    scheduleDays!.add(ScheduleModelDay("Sat", [
      ScheduleTimeSlot(morning),
      ScheduleTimeSlot(afternoon),
      ScheduleTimeSlot(evening),
    ]));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text("Schedule"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: text(_scheduleMessage, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SchedulePage()),
                );
                setState(() {
                  _scheduleMessage = result;
                });
              },
              child: text(
                  (_scheduleMessage.isEmpty) ? 'Add Schedule' : "Edit Schedule",
                  colors: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
