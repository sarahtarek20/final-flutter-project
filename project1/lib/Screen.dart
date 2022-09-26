import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:project1/main.dart';

class MyItem {
  bool isExpanded;
  final Widget body;
  final Widget header;

  MyItem({this.isExpanded = false, required this.body, required this.header});
}

class Screen extends StatefulWidget {
  var numberOfAdults = 0.0;
  var numberOfChildren = 0.0;
  String checked = '';
  String checkInDate = '';
  String checkOutDate = '';
  List<String> selected = [''];

  Screen(
      {required this.numberOfAdults,
      required this.numberOfChildren,
      required this.checked,
      required this.checkInDate,
      required this.checkOutDate,
      required this.selected});

  @override
  State<Screen> createState() => _ScreenState(
      numberOfAdults: numberOfAdults,
      numberOfChildren: numberOfChildren,
      checked: checked,
      checkInDate: checkInDate,
      checkOutDate: checkOutDate,
      selected: selected);
}

class _ScreenState extends State<Screen> {
  MyApp? info;
  var numberOfAdults = 0.0;
  var numberOfChildren = 0.0;
  String checked = '';
  String checkInDate = '';
  String checkOutDate = '';
  List<String> selected = [''];

  _ScreenState(
      {required this.numberOfAdults,
      required this.numberOfChildren,
      required this.checked,
      required this.checkInDate,
      required this.checkOutDate,
      required this.selected});

  bool expander = false;
  bool _svalue = false;
  bool _rvalue = false;
  bool _dvalue = false;
  List<MyItem> singleRoom = <MyItem>[
    MyItem(
      body: Row(
        children: <Widget>[
          Image(
            image: NetworkImage(
                'https://as1.ftcdn.net/v2/jpg/03/22/73/02/1000_F_322730229_d3WmzXvTumDznXMxpz0ePEnmCvuuJrXm.jpg'),
            width: 100,
            height: 30,
          ),
          SizedBox(
            width: 50,
          ),
          Text('A room assigned to one person.')
        ],
      ),
      header: Row(children: <Widget>[
        Image(
          image: NetworkImage(
              'https://www.hotelparadies.com/fileadmin/_optimized_/1280/976935/csm_paradies-latsch-wohnen-single-room-1_105edfc753.jpg%27'),
          width: 100,
          height: 100,
        ),
        SizedBox(
          width: 15,
        ),
        Text('Single Room'),
        SizedBox(
          width: 15,
        ),
      ]),
    )
  ];

  List<MyItem> doubleRoom = <MyItem>[
    MyItem(
        body: Row(
          children: [
            Image(
              image: NetworkImage(
                  'https://as1.ftcdn.net/v2/jpg/03/22/73/02/1000_F_322730229_d3WmzXvTumDznXMxpz0ePEnmCvuuJrXm.jpg'),
              width: 100,
              height: 30,
            ),
            SizedBox(
              width: 50,
            ),
            Column(children: [
              Text(
                'A room assigned to two people,',
              ),
              Text('May have one or more beds.')
            ]),
          ],
        ),
        header: Row(
          children: <Widget>[
            Image(
              image: NetworkImage(
                  'https://assets-global.website-files.com/5c6d6c45eaa55f57c6367749/628d35d6b9575f5b35b4231a_Twin%20Hotel%20Room%20(1)%20(1).jpg%27'),
              width: 100,
              height: 100,
            ),
            SizedBox(
              width: 15,
            ),
            Text('Double Room'),
            SizedBox(
              width: 15,
            ),
          ],
        ))
  ];
  List<MyItem> Suite = <MyItem>[
    MyItem(
        body: Row(
          children: [
            Image(
              image: NetworkImage(
                  'https://as1.ftcdn.net/v2/jpg/03/22/73/02/1000_F_322730229_d3WmzXvTumDznXMxpz0ePEnmCvuuJrXm.jpg'),
              width: 100,
              height: 30,
            ),
            SizedBox(
              width: 50,
            ),
            Column(children: [
              Text('A room with one or more bedrooms'),
              Text('and a separate living spaces')
            ])
          ],
        ),
        header: Row(children: <Widget>[
          Image(
            image: NetworkImage(
                'https://ecck.or.kr/wp-content/uploads/2019/05/GrandHyattSeoul-Presidential-Suite-1320x910.jpg%27'),
            width: 100,
            height: 100,
          ),
          SizedBox(
            width: 15,
          ),
          Text('Suite Room'),
          SizedBox(
            width: 25,
          ),
        ]))
  ];

  void _onchanges(bool val) {
    setState(() {
      _rvalue = val;
    });
  }

  void _onchanged(bool val) {
    setState(() {
      _dvalue = val;
    });
  }

  void _onchange(bool val) {
    setState(() {
      _svalue = val;
    });
  }

  void showAlertDialog(BuildContext context) {
    String tmp =
        'This is a confirmation message that you agree all data entered\n Check in: ${this.checkInDate}\n check out: ${this.checkOutDate}\n Number of Adults: ${this.numberOfAdults}\n Number of Children:${this.numberOfChildren}\n View choosen:${this.checked}\n ';

    var alertDialog = AlertDialog(
        title: Text('Are you sure you want to proceed to check out?'),
        content: Text(tmp),
        actions: [
          ElevatedButton(
              onPressed: () {
                print("Thanks");
                Navigator.pop(context);
              },
              child: Text('Confirm')),
          ElevatedButton(
              onPressed: () {
                print("Thanks");
                Navigator.pop(context);
              },
              child: Text('Discard'))
        ]);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Castaway Resort'),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  singleRoom[index].isExpanded = !singleRoom[index].isExpanded;
                });
              },
              children: singleRoom.map<ExpansionPanel>((MyItem item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/Images/room.jpg',
                          width: 120,
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Single Room",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Switch(
                          value: _rvalue,
                          onChanged: _onchanges,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                  body: item.body,
                  isExpanded: item.isExpanded,
                );
              }).toList(),
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  doubleRoom[index].isExpanded = !doubleRoom[index].isExpanded;
                });
              },
              children: doubleRoom.map<ExpansionPanel>((MyItem item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'assets/Images/double.jpg',
                          width: 120,
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(width: 13),
                        Text(
                          "Double Room",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Switch(
                          value: _dvalue,
                          onChanged: _onchanged,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                  body: item.body,
                  isExpanded: item.isExpanded,
                );
              }).toList(),
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  Suite[index].isExpanded = !Suite[index].isExpanded;
                });
              },
              children: Suite.map<ExpansionPanel>((MyItem item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Row(children: <Widget>[
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Image.asset(
                        'assets/Images/suite.jpg',
                        width: 120,
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(width: 13),
                      Text(
                        "Suite Room",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Switch(
                        value: _svalue,
                        onChanged: _onchange,
                      ),
                    ]);
                  },
                  body: item.body,
                  isExpanded: item.isExpanded,
                );
              }).toList(),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: Text("Book Now"),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ))),
                ),
              ],
            )
          ],
        ));
  }
}
