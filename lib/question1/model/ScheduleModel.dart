class ScheduleModelDay {
  String? name;
  List<ScheduleTimeSlot> scheduleTimeSlot = [];
  bool? isAvailable = false;

  ScheduleModelDay(this.name, this.scheduleTimeSlot, {this.isAvailable = false});
}

class ScheduleTimeSlot {
  String? slotName;
  bool isSelected = false;

  ScheduleTimeSlot(this.slotName, {this.isSelected = false});
}
