import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: 428,
          height: 315,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0x70a8e377), Color(0xff00c9fd)],
            ),
          ),
        ),
        //---------------------------------------------------------------------------------------------------------------------------------------------
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 20,
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 138),
                child: Text(
                  "حجز موعد",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              //---------------------------------------------------------------------------------------------------------------------------------------------
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 170, left: 20, right: 20),
          child: Container(
            width: 390,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 15, left: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Image.asset(
                    'assets/appointment/i.png',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "تم عملية الحجز بنجاح",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: "IBM Plex Sans",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    // color: Colors.white,
                    padding: const EdgeInsets.all(0.0),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 0.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50.0,
                        width: 600,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,

                            /// Alignment(0.0, 0.0),
                            end: Alignment(1, 0.001),
                            colors: <Color>[Color(0xff00F2D5), Colors.white],
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: const Text(
                          "موافق",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
