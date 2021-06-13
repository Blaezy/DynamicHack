import 'package:flutter/material.dart';
import 'package:studieey/Features/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:studieey/Models/Slots.dart';
import 'package:studieey/Models/teacher.dart';

class Lectures extends StatefulWidget {
  const Lectures({Key? key}) : super(key: key);

  @override
  _LecturesState createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  List<SlotItem> slotItems = [
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Saturday")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "Friday")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "Thursday")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Wednesday")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "Tuesday")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "Monday")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Days/Period")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 2,
        t1: Teacher(id: 2, name: "Beta", subject: "CN")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 3,
        t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
    SlotItem(
        isAvailable: false,
        day: 2,
        interval: 1,
        t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lectures"),
      ),
      body: Padding(
        padding: EdgeInsets.all(4),
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    height: MediaQuery.of(context).size.height * 0.11,
                    crossAxisCount: 7),
            itemCount: slotItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white),
                      child: RotationTransition(
                          turns: AlwaysStoppedAnimation(90 / 360),
                          child: Center(
                              child: Text(slotItems[index].t1.subject)))));
            }),
      ),
    );
  }
}
