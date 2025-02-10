import 'package:flutter/material.dart';

class forgotPassword2 extends StatelessWidget {
  const forgotPassword2({Key? key}) : super(key: key);

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
                padding: EdgeInsets.only(right: 30,top: 70),
                child: IconButton(onPressed: (){},
                  icon: Icon(Icons.arrow_forward_ios ,color: Colors.white,size: 25,),),
              ),
            ),
            SizedBox(height: 15,),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Text('نسيت كلمة السر',style: TextStyle(fontSize: 30,color: Colors.white),))),

            SizedBox(height: 40,),
            Text('تم ارسال الكود إلى رقم الهاتف',style: TextStyle(fontSize: 20,color: Colors.white),),

            SizedBox(height: 36,),
            Row(
              
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15,left: 24),
                  height: height * .10,
                  width: width * .16,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 236, 236),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  height: height * .10,
                  width: width * .16,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 236, 236),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  height: height * .10,
                  width: width * .16,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 236, 236),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  height: height * .10,
                  width: width * .16,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 236, 236),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(),
                ),
              ],
            ),

            Text('إعادة إرسال الكود بعد 56 ثانية ',style: TextStyle(fontSize: 20,color: Colors.white),),

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
                onPressed: (){}, child: Text('ثبت',style: TextStyle(color: Colors.white,fontSize: 25),),

              ),
            )




          ],
        ),

      ),
    );
  }
}
