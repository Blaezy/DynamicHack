import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:studieey/Features/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:studieey/Models/Slots.dart';
import 'package:studieey/Models/teacher.dart';

class Lectures extends StatefulWidget {
  static const routeName = "/Lectures";
  bool isTeacher;
  Lectures({required this.isTeacher});

  @override
  _LecturesState createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  List<SlotItem> slotItems = [];
  List<SlotItem> todays = [];
  Future<void> getLectures() async {
    List<SlotItem> slotsFromWeb = [];
    List<SlotItem> todaysSlotFromWeb = [];
    DateTime dateTime = DateTime.now();
    print(dateTime
        .toString()); // prints something like 2019-12-10 10:02:22.287949
    String day = DateFormat('EEEE').format(dateTime).toString();
    print(day);
    print("Executed");
    await FirebaseFirestore.instance
        .collection('Slots')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        slotsFromWeb.add(SlotItem(
            day: doc['day'],
            interval: doc['interval'],
            t1: Teacher(
                id: doc['teacher']['id'] == "Not Assigned"
                    ? 0
                    : doc['teacher']['id'],
                name: doc['teacher']['name'],
                subject: doc['teacher']['subject']),
            isAvailable: doc['isAvailable']));
      });
    });
    slotItems = slotsFromWeb;
    todaysSlotFromWeb =
        slotsFromWeb.where((element) => element.day == day).toList();
    todaysSlotFromWeb..sort((a, b) => a.interval.compareTo(b.interval));
    setState(() {
      slotItems = slotsFromWeb;
      todays = todaysSlotFromWeb;
    });
  }

  void initState() {
    getLectures();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lectures"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            getLectures();
          },
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: ElevatedButton(
                          onPressed: () {
                            List<SlotItem> temp = [];
                            temp = slotItems
                                .where((element) => element.day == "Monday")
                                .toList();
                            setState(() {
                              todays = temp;
                            });
                          },
                          child: Text(
                            "Monday",
                            style: GoogleFonts.encodeSansSemiExpanded(),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: ElevatedButton(
                          onPressed: () {
                            List<SlotItem> temp = [];
                            temp = slotItems
                                .where((element) => element.day == "Tuesday")
                                .toList();
                            setState(() {
                              todays = temp;
                            });
                          },
                          child: Text(
                            "Tuesday",
                            style: GoogleFonts.encodeSansSemiExpanded(),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: ElevatedButton(
                          onPressed: () {
                            List<SlotItem> temp = [];
                            temp = slotItems
                                .where((element) => element.day == "Wednesday")
                                .toList();
                            setState(() {
                              todays = temp;
                            });
                          },
                          child: Text(
                            "Wednesday",
                            style: GoogleFonts.encodeSansSemiExpanded(),
                          )),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: todays.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: ListTile(
                            tileColor: todays[index].isAvailable
                                ? Colors.lightGreenAccent
                                : Colors.amber,
                            subtitle: Text(
                              todays[index].t1.name,
                              style: GoogleFonts.encodeSansSemiExpanded(),
                            ),
                            onTap: () {},
                            title: Text(
                              todays[index].t1.subject,
                              style: GoogleFonts.encodeSansSemiExpanded(),
                            )),
                      );
                    }),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: ElevatedButton(
                          onPressed: () {
                            List<SlotItem> temp = [];
                            temp = slotItems
                                .where((element) => element.day == "Thursday")
                                .toList();
                            setState(() {
                              todays = temp;
                            });
                          },
                          child: Text(
                            "Thursday",
                            style: GoogleFonts.encodeSansSemiExpanded(),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: ElevatedButton(
                          onPressed: () {
                            List<SlotItem> temp = [];
                            temp = slotItems
                                .where((element) => element.day == "Friday")
                                .toList();
                            setState(() {
                              todays = temp;
                            });
                          },
                          child: Text(
                            "Friday",
                            style: GoogleFonts.encodeSansSemiExpanded(),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: ElevatedButton(
                          onPressed: () {
                            List<SlotItem> temp = [];
                            temp = slotItems
                                .where((element) => element.day == "Saturday")
                                .toList();
                            setState(() {
                              todays = temp;
                            });
                          },
                          child: Text(
                            "Saturday",
                            style: GoogleFonts.encodeSansSemiExpanded(),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
