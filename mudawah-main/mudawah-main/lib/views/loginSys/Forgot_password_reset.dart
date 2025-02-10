import 'package:flutter/material.dart';

class forgotPasswordReset extends StatelessWidget {
  const forgotPasswordReset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
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
          ),
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 25,top: 50),
                child: IconButton(onPressed: (){},
                  icon: Icon(Icons.arrow_forward_ios ,color: Colors.white,size: 25,),),
              ),
            ),
            SizedBox(height: 15,),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Text('إعادة تعيين كلمة السر',style: TextStyle(fontSize: 30,color: Colors.white),))),

            SizedBox(height: 40,),


            Align(
                alignment: Alignment.centerRight,
                child: Text('كلمة السر الجديدة',style: TextStyle(fontSize: 25,color: Colors.white),)),
            Container(
              margin: EdgeInsets.only(right: 15,left: 24),
              height: height * .08,
              width: width * .90,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 177, 201, 202),
                    offset: Offset(
                      0,
                      8,
                    ),
                  ),
                ],
                color: Color.fromARGB(255, 212, 236, 236),
                borderRadius: BorderRadius.all(Radius.circular(15)),

              ),
              child: TextField(),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text('تأكيد كلمة السر الجديدة',style: TextStyle(fontSize: 25,color: Colors.white),)),

            Container(
              margin: EdgeInsets.only(right: 15,left: 24),
              height: height * .08,
              width: width * .90,
              decoration: BoxDecoration(
                boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 177, 201, 202),
                  offset: Offset(
                    0,
                    8,
                  ),
              ),
          ],
                color: Color.fromARGB(255, 212, 236, 236),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: TextField(),
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
                onPressed: (){}, child: Text('حفظ',style: TextStyle(color: Colors.white,fontSize: 25),),

              ),
            )




          ],
        ),

      ),
    );
  }
}
