import 'package:flutter/material.dart';

import '../question1/model/ScheduleModel.dart';

Widget text(String title,
    {FontWeight? fontWeight = FontWeight.normal,
    Color? colors = Colors.black87}) {
  return Text(
    title,
    style: TextStyle(fontSize: 16, color: colors, fontWeight: fontWeight),
  );
}

Widget slotView(ScheduleTimeSlot aScheduleTimeSlot) {
  return Container(
    margin: const EdgeInsets.all(5.0),
    padding: const EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      border: Border.all(
          color: (aScheduleTimeSlot.isSelected) ? Colors.green : Colors.grey),
    ),
    child: text(aScheduleTimeSlot.slotName!,
        colors: (aScheduleTimeSlot.isSelected) ? Colors.green : Colors.black38),
  );
}
