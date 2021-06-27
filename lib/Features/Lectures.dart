import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<SlotItem> slotItems = [];
  Future<void> getLectures() async {
    List<SlotItem> slotsFromWeb = [];
    print("Executed");
    await FirebaseFirestore.instance
        .collection('Slots')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc['day']);
        print(doc['interval']);
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
    setState(() {
      slotItems = slotsFromWeb;
    });
    print(slotsFromWeb.length);
  }

  // List<SlotItem> slotItems = [
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Saturday")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "Friday")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "Thursday")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Wednesday")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "Tuesday")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "Monday")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Days/Period")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 2,
  //       t1: Teacher(id: 2, name: "Beta", subject: "CN")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 3,
  //       t1: Teacher(id: 3, name: "Gamma", subject: "MAD")),
  //   SlotItem(
  //       isAvailable: false,
  //       day: 2,
  //       interval: 1,
  //       t1: Teacher(id: 1, name: "Alpha", subject: "Maths")),
  // ];
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
      body: Padding(
        padding: EdgeInsets.all(4),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(0 / 360),
          child: RefreshIndicator(
            onRefresh: () {
              return getLectures();
            },
            child: ConnectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            height: MediaQuery.of(context).size.height * 0.11,
                            crossAxisCount: 6),
                    itemCount: slotItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => RotatedBox(
                            quarterTurns: 1,
                            child: AlertDialog(
                              title: const Text(
                                  'Do you wish make Temporary changes in time table'),
                              content: Text(
                                  "This would be reflected in the everyone's timetable for ${slotItems[index].t1.subject} at slot ${slotItems[index].interval}"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    print(slotItems[index].t1.subject);
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      slotItems[index].t1.subject = "Shivam";
                                    });
                                    Navigator.pop(context, 'OK');
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white),
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(45 / 360),
                            child: Center(
                              child: Text(slotItems[index].t1.subject),
                            ),
                          ),
                        ),
                      );
                    }),
          ),
        ),
      ),
    );
  }
}
