import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:studieey/Models/teacher.dart';

class AdminDropDown extends StatefulWidget {
  static const routeName = "/AdminDropDown";
  const AdminDropDown({Key? key}) : super(key: key);

  @override
  _AdminDropDownState createState() => _AdminDropDownState();
}

class _AdminDropDownState extends State<AdminDropDown> {
  List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  List<String> subjects = ["CN", "MAD", "SSCD", "CN-LAB", "AI", "MM", "CC"];
  List<Teacher> teachers = [
    Teacher(id: 1, name: "Pramod TC", subject: "CN"),
    Teacher(id: 2, name: "Chandraprabha", subject: "CC"),
    Teacher(id: 3, name: "Sumalatha Aradhya", subject: "MAD"),
    Teacher(id: 4, name: "AH ShantaKumara", subject: "AI"),
    Teacher(id: 5, name: "Suresh", subject: "MM"),
    Teacher(id: 1, name: "Pramod TC", subject: "CN-LAB"),
  ];
  List<Teacher> teacherss1 = [];
  List<Map<int, String>> Period = [
    {1: "8-9 AM"},
    {2: "9-10AM"},
    {3: "10.30-11.30AM"},
    {4: "11.30-12.30AM"},
    {5: "2-3PM"},
    {6: "3-4PM"},
    {7: "4-5PM"},
  ];

  Future<void> fetchTeachers() async {
    List<Teacher> teacherss = [];
    print("Executed");
    await FirebaseFirestore.instance
        .collection('teachers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc['id']);
        teacherss.add(
            Teacher(id: doc["id"], name: doc["name"], subject: doc["subject"]));
      });
    });
    teacherss1 = teacherss;
    print(teacherss1.length);
  }

  Teacher? dropdownValue;
  String? day;
  Map<int, String>? interval;

  void initState() {
    fetchTeachers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFFDAE2F8), Color(0xFFD6A4A4)]),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: Text(
                "Adjust all the classes",
                style: GoogleFonts.encodeSansSemiCondensed(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text("Select Day"),
                      value: day,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          day = newValue!;
                        });
                      },
                      items: days
                          .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList())),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton<Map<int, String>>(
                      isExpanded: true,
                      hint: Text("Select Period"),
                      value: interval,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (Map<int, String>? newValue) {
                        setState(() {
                          interval = newValue!;
                        });
                      },
                      items: Period.map<DropdownMenuItem<Map<int, String>>>(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text("${e.keys} - ${e.values}"),
                        ),
                      ).toList())),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton<Teacher>(
                      isExpanded: true,
                      hint: Text("Select Teacher"),
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (Teacher? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: teacherss1
                          .map<DropdownMenuItem<Teacher>>(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text("${e.subject} - ${e.name}"),
                            ),
                          )
                          .toList())),
            ),
            ElevatedButton(
                onPressed: () async {
                  int? intervals;

                  interval!.forEach((key, value) {
                    intervals = key;
                  });
                  await FirebaseFirestore.instance
                      .collection("Slots")
                      .doc(day! + interval!.keys.toString())
                      .set({
                    'isAvailable': true,
                    'day': day.toString(),
                    'interval': intervals,
                    'teacher': {
                      'id': "Not Assigned",
                      'name': "Not Assigned",
                      'subject': "Not Assigned"
                    },
                  });
                },
                child: Text(
                  "Free Period",
                  style: GoogleFonts.encodeSansSemiExpanded(),
                )),
            TextButton(
                onPressed: () async {
                  print(day);
                  print(dropdownValue);
                  print(interval);
                  int? intervals;

                  interval!.forEach((key, value) {
                    intervals = key;
                  });

                  await FirebaseFirestore.instance
                      .collection("Slots")
                      .doc(day! + interval!.keys.toString())
                      .set({
                    'isAvailable': false,
                    'day': day.toString(),
                    'interval': intervals,
                    'teacher': {
                      'id': dropdownValue!.id,
                      'name': dropdownValue!.name,
                      'subject': dropdownValue!.subject
                    },
                  }).then((value) {
                    setState(() {
                      interval = null;
                      dropdownValue = null;
                      day = null;
                    });
                  });
                },
                child: Text(
                  "Add Slot",
                  style: GoogleFonts.encodeSansSemiExpanded(),
                )),
            ElevatedButton(
                onPressed: () {
                  print(ModalRoute.of(context)!.settings.arguments);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Go back',
                  style: GoogleFonts.encodeSansSemiExpanded(),
                ))
          ]),
        ),
      ),
    );
  }
}
