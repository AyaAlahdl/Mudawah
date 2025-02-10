import 'package:flutter/material.dart';
import 'Bookings.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(
          childrenDelegate: SliverChildListDelegate(
        List.generate(
          20,
          (index) {
            return Container(
                width: 371.95,
                height: 157.1,
                margin: EdgeInsets.only(bottom: 20),
                child: ListTile(),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0x00000000),
                      offset: Offset(0.0, 4.0),
                      blurRadius: 4.0,
                    ),
                  ],
                  borderRadius: BorderRadius.all(const Radius.circular(14.0)),
                ));
          },
        ),
      )),
    );
  }
}
