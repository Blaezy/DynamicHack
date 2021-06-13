import 'package:studieey/Models/teacher.dart';

class ExtraslotItem {
  int interval;
  Teacher t1;
  int day;
  ExtraslotItem({required this.day, required this.interval, required this.t1});
}

class SlotItem extends ExtraslotItem {
  bool isAvailable;
  SlotItem(
      {required int day,
      required int interval,
      required Teacher t1,
      required this.isAvailable})
      : super(day: day, interval: interval, t1: t1);
}
