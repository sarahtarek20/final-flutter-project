import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:project1/Screen.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Date Picker Code
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();

  Future<Null> selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date1,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != date1) {
      setState(() {
        date1 = picked;
        print(date1.toString());
      });
    }
  }

  Future<Null> selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date2,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != date2) {
      setState(() {
        date2 = picked;
        print(
          date2.toString(),
        );
      });
    }
  }

  var numberOfAdults = 0.0;
  var numberOfChildren = 0.0;
  static String checked1 = '';
  String checkInDate = '';
  String checkOutDate = '';
  static List<String> extras = [''];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    checkInDate = ('${date1.year} - ${date1.month} - ${date1.day}').toString();
    checkOutDate = ('${date2.year} - ${date2.month} - ${date2.day}').toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Castaway Resort'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/Images/Resort.jpg',
                      width: 300,
                      alignment: Alignment.centerLeft,
                    ),

                    Row(
                      children: [
                        Text(
                          'Check-in Date:',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 39,
                        ),
                        IconButton(
                            onPressed: () {
                              selectDate1(context);
                            },
                            icon: Icon(Icons.date_range)),
                        Text(('${date1.year} - ${date1.month} - ${date1.day}')
                            .toString()),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          'Check-out Date:',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        IconButton(
                            onPressed: () {
                              selectDate2(context);
                            },
                            icon: Icon(Icons.date_range)),
                        Text(('${date2.year} - ${date2.month} - ${date2.day}')
                            .toString()),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Number Of Adults:',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Slider(
                          value: numberOfAdults,
                          onChanged: (value) {
                            setState(() {
                              numberOfAdults = value;
                            });
                          },
                          divisions: 10,
                          label: numberOfAdults.toInt().toString(),
                          min: 0,
                          max: 10,
                        ),
                        Text('${numberOfAdults.toInt().toString()}')
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Number Of Children:',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 19,
                        ),
                        Slider(
                          value: numberOfChildren,
                          onChanged: (value) {
                            setState(() {
                              numberOfChildren = value;
                            });
                          },
                          divisions: 10,
                          label: numberOfChildren.toInt().toString(),
                          min: 0,
                          max: 10,
                        ),
                        Text('${numberOfChildren.toInt().toString()}')
                      ],
                    ),
// Checkbox
                    Text(
                      'Extras:',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    CheckboxGroup(
                        margin: EdgeInsets.only(left: 10),
                        labels: <String>[
                          'Breakfast (50EGP/Day)',
                          'Internet WI\iFi (50EGP/Day)',
                          'Parking (100EGP/Day)'
                        ],
                        onSelected: (List<String> checked) {
                          print(checked.toString());
                          extras = checked;
                        }),
                    SizedBox(
                      height: 5,
                    ),
// Radio
                    Text(
                      'View',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    RadioButtonGroup(
                        margin: EdgeInsets.only(left: 10),
                        labels: <String>['Garden View', 'Sea View'],
                        onSelected: (String selected) {
                          checked1 = selected;
                        })
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          print(checkInDate);
                          print(checkOutDate);
                          print(numberOfChildren);
                          print(numberOfAdults);
                          print(checked1);
                          print(extras);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Screen(
                                  numberOfAdults: numberOfAdults,
                                  numberOfChildren: numberOfChildren,
                                  checked: checked1,
                                  checkInDate: checkInDate,
                                  checkOutDate: checkOutDate,
                                  selected: extras)));
                        },
                        child: Text('Check Rooms and Rates'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlueAccent))),

// Date Picker

// Time Picker
              ],
            )
          ],
        ),
      ),
    );
  }
}
