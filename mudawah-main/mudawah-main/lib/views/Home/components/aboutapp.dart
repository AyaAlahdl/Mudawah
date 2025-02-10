import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:
      Stack(
          children: [
            Container(
              width: 428,
              height: 315,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40), ),
                gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0x70a8e377), Color(0xff00c9fd)], ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.only(top: 60,left: 5,right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 20,)),
                  Padding(
                    padding: const EdgeInsets.only(right: 160),
                    child: Text(
                      "مداواة",
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
              padding: const EdgeInsets.only(top: 170,left: 20,right: 20),
              child: Container(

                width: 390,
                height: 700,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,

                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15,left: 10 , top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text(
                        "لخدمة العملاء أو لتبليغ على تفاصيل الحجز  أو إذا كنت ترغب في فتح صفحة للمستشفى الخاص بك ، فتواصل معنا على المنصات التالية",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,

                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    ],
                  ),)
                ,)
              ,),]),);
  }
}
