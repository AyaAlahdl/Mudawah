import 'package:flutter/material.dart';

class info extends StatelessWidget {
  const info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:50,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: 242,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: Colors.cyan, width: 1, ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child:  TextFormField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                            borderSide: BorderSide(color: Colors.cyanAccent, width: 1,),
                          )
                      ),
                    ),
                  ),
                ),

                Text(
                  "الموقع ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontFamily: "Roboto",fontWeight: FontWeight.w600,
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: 242,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: Colors.cyan, width: 1, ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child:  TextFormField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                            borderSide: BorderSide(color: Colors.cyanAccent, width: 1,),
                          )
                      ),
                    ),
                  ),
                ),

                Text(
                  "الهاتف ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontFamily: "Roboto",fontWeight: FontWeight.w600,
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: 242,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: Colors.cyan, width: 1, ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child:  TextFormField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                            borderSide: BorderSide(color: Colors.cyanAccent, width: 1,),
                          )
                      ),
                    ),
                  ),
                ),

                Text(
                  "الاتاحة ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontFamily: "Roboto",fontWeight: FontWeight.w600,
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
