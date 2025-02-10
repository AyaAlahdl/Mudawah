import 'package:flutter/material.dart';
import 'package:mudawah/views/MyBookings/StatusTab.dart';

class Bookings extends StatefulWidget {
  const Bookings({key}) : super(key: key);
  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Color(0xff36C0D6),
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              },
            ),
            title: Center(
              child: Text(
                "حجوزاتي",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 28.0,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: new Icon(
                  Icons.notifications,
                  color: Color(0xff60CBE2),
                ),
                onPressed: () => print('hi on icon action'),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 330.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0)),
                  child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.blue[500],
                        borderRadius: BorderRadius.circular(8.0)),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        text: 'Done',
                      ),
                      Tab(
                        text: 'New',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                const Expanded(
                    child: TabBarView(
                  children: [
                    Center(
                      child: Text("Chats Pages"),
                    ),
                    StatusTab(),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
