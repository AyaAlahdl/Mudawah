import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forgotPassword1 extends StatelessWidget {
  const forgotPassword1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      var height=MediaQuery.of(context).size.height;
      var width=MediaQuery.of(context).size.width;
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 0, 170, 207) ,
        actions: [
          Builder(builder: (context){
            return Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(onPressed: (){
                return Scaffold.of(context).openEndDrawer();
              }, icon: Icon(Icons.arrow_forward_ios ,color: Colors.white,size: 40,),),
            );
          }),
        ],
        elevation: 0,
      ),*/

      body: Container(
        width: width,
        height: height,
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin:  Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(255, 152, 210, 222),
                Color.fromARGB(255, 214, 235, 228),

              ]
          )
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 30,top: 70),
                child: IconButton(onPressed: (){
                  return Scaffold.of(context).openEndDrawer();
                }, icon: Icon(Icons.arrow_forward_ios ,color: Colors.white,size: 25,),),
              ),
            ),
            SizedBox(height: 15,),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Text('نسيت كلمة السر',style: TextStyle(fontSize: 30,color: Colors.white),))),
            Text('اختر عبر ماذا سيتم ارسال الكود إليك ', style: TextStyle(fontSize: 20,color: Colors.white),),

            SizedBox(
              height: 30,),
               Container(
                 padding: EdgeInsets.all(20),
                 height: height* .15,
                width: width*.90,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 212, 236, 236),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                 child: Directionality(
                   textDirection: TextDirection.rtl,
                   child: Row(
                     children: <Widget>[  
                       const Icon(Icons.mark_chat_read_outlined ,size:45,color:Colors.white),
                       SizedBox(width: 20,),
                       Column(
                         children: <Widget>[
                           Text('رسالة قصيرة', style: TextStyle(fontSize: 18,color: Colors.black),textAlign:TextAlign.start,),
                           Text('+967 ******7', style: TextStyle(fontSize: 18,color: Colors.black),),



                         ],
                       ),

                     ],
                   ),
                 ),
              ),

            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              height: height* .15,
              width: width*.90,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 212, 236, 236),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Directionality(
                
                textDirection: TextDirection.rtl,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.mark_email_unread,size: 45,color: Colors.white,),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: <Widget>[
                        Text('البريد الالكتروني', style: TextStyle(fontSize: 18,color: Colors.black),),
                        Text('email**@gmail.com', style: TextStyle(fontSize: 18,color: Colors.black),),



                      ],
                    ),

                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              width: width * .8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors:<Color>
                  [
                    Color.fromARGB(255, 114, 211, 226),
                    Color.fromARGB(255, 192, 232, 225),

                  ]
                )
              ),
              child: TextButton(
                onPressed: (){}, child: Text('التالي',style: TextStyle(color: Colors.white,fontSize: 25),),
                
              ),
            )
          ],
        ),

      ),
    );
  }
}
