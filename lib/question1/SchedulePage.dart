import 'package:flutter/material.dart';
import 'package:test_app/utils/CommonWidgets.dart';

import '../main.dart';
import '../utils/StringUtils.dart';
import 'model/ScheduleModel.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  Widget getSlot(int index, List<ScheduleTimeSlot> scheduleTimeSlot) {
    return Row(
      children: [
        Row(
          children: [
            GestureDetector(
              child: slotView(scheduleTimeSlot[0]),
              onTap: () {
                setState(() {
                  if (scheduleDays![index].scheduleTimeSlot[0].isSelected) {
                    scheduleDays![index].scheduleTimeSlot[0].isSelected = false;
                  } else {
                    scheduleDays![index].scheduleTimeSlot[0].isSelected = true;
                  }
                });
              },
            ),
            GestureDetector(
              child: slotView(scheduleTimeSlot[1]),
              onTap: () {
                setState(() {
                  if (scheduleDays![index].scheduleTimeSlot[1].isSelected) {
                    scheduleDays![index].scheduleTimeSlot[1].isSelected = false;
                  } else {
                    scheduleDays![index].scheduleTimeSlot[1].isSelected = true;
                  }
                });
              },
            ),
            GestureDetector(
              child: slotView(scheduleTimeSlot[2]),
              onTap: () {
                setState(() {
                  if (scheduleDays![index].scheduleTimeSlot[2].isSelected) {
                    scheduleDays![index].scheduleTimeSlot[2].isSelected = false;
                  } else {
                    scheduleDays![index].scheduleTimeSlot[2].isSelected = true;
                  }
                });
              },
            )
          ],
        )
      ],
    );
  }

  performAddSchedule() {
    String _message = "";
    for (int dayIndex = 0; dayIndex < scheduleDays!.length; dayIndex++) {
      if (scheduleDays![dayIndex].isAvailable!) {
        int selectedCount = 0;
        String availableSlot = "";
        for (int slotIndex = 0;
            slotIndex < scheduleDays![dayIndex].scheduleTimeSlot.length;
            slotIndex++) {
          if (scheduleDays![dayIndex].scheduleTimeSlot[slotIndex].isSelected) {
            selectedCount = selectedCount + 1;
            if (slotIndex == 0) {
              availableSlot = availableSlot + " $morning ";
            } else if (slotIndex == 1) {
              availableSlot = availableSlot + " $afternoon ";
            } else if (slotIndex == 2) {
              availableSlot = availableSlot + " $evening ";
            }
          }
        }
        if (availableSlot.isNotEmpty) {
          _message = _message + " ${scheduleDays![dayIndex].name} ";
          if (selectedCount == 3) {
            _message = _message + " whole day, ";
          } else {
            _message = _message + " $availableSlot, ";
          }
        }
      }
    }
    Navigator.pop(context, "Hi Jose you are available in $_message");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text("Schedule"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: text("Set your weekly hours",
                      fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: scheduleDays![index].isAvailable,
                          onChanged: (bool? value) {
                            setState(() {
                              if (scheduleDays![index].isAvailable!) {
                                scheduleDays![index].isAvailable = false;
                              } else {
                                scheduleDays![index].isAvailable = true;
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        text(scheduleDays![index].name!,
                            fontWeight: FontWeight.bold),
                        const SizedBox(
                          width: 10,
                        ),
                        (scheduleDays![index].isAvailable!)
                            ? getSlot(
                                index, scheduleDays![index].scheduleTimeSlot)
                            : text("Unavailable")
                      ],
                    );
                  },
                  itemCount: scheduleDays!.length,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                performAddSchedule();
              },
              child: const Text('Save Schedule'),
            ),
          )
        ],
      ),
    );
  }
}
