// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';

// import '../../controllers/appointmentController.dart';
// import 'booking.dart';
// import 'mybooking.dart';

// class bookingcard extends StatefulWidget {
//   const bookingcard({Key? key}) : super(key: key);

//   @override
//   State<bookingcard> createState() => _bookingcardState();
// }

// class _bookingcardState extends State<bookingcard> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     Get.find<AppointmentController>().getUserAppointments();
//     print('hello');
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double height=MediaQuery.of(context).size.height;
//     final double width=MediaQuery.of(context).size.width;
//     return  Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           color: Colors.white,
//           child: Column(
//             children: [
//               SizedBox(height: 50),
//               //Upper
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [

//                   Padding(
//                     padding: const EdgeInsets.only(left: 140),
//                     child: Text(
//                       "حجوزاتي",
//                       // textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 28,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const booking()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.grey[400],
//                 shadowColor: Colors.grey,
//                 padding:
//                     EdgeInsets.only(top: 5, bottom: 5, left: 50, right: 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(10),
//                       bottomRight: Radius.circular(10)),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 5),
//                 child: Text(
//                   "القديمة",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: height * .05,
//         ),
//         SizedBox(
//           height: height * .7,
//           child: GetBuilder<AppointmentController>(
//             builder: (controller) => ListView.builder(
//                 itemCount: controller.disAppointmentsList.length,
//                 itemBuilder: (context, index) {
//                   return BookCard(
//                       appointment: controller.disAppointmentsList[index]);
//                 }),
//           ),
//         )
//         //cards
//         /*
//             SizedBox(height: height*0.05,),
//             Container(
//               child:Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Card(
//                     shadowColor: Colors.grey.shade700,

//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                           bottomLeft: Radius.circular(10)),
//                     ),


//                 ],
//               ),
//               //cards
//               SizedBox(height: height*0.05,),

//               Container(
//                 child:Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Card(
//                       shadowColor: Colors.grey.shade700,

//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                             bottomLeft: Radius.circular(10)),
//                       ),

//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const mybooking()),
//                           );
//                         },
//                         child:  Container(
//                           width: 250,
//                           height: 244.01,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(16),
//                                 bottomLeft: Radius.circular(16)),
//                             color: Color(0xff36c0d6),

//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 10.0,
//                                 spreadRadius: 2.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
//                               ),
//                               blurRadius: 10.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0,
//                             ),

//                           ],

//                         ),


// <<<<<<< HEAD
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10),
//                               child: Text(
//                                 "د/ محمد ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               "مستشفى عدن - المنصورة ",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Color(0xfff5f5f5),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 2, left: 140),
//                               child: Text(
//                                 "الوقت ",
//                                 textAlign: TextAlign.end,
//                                 style: TextStyle(
//                                   color: Color(0xfff5f5f5),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 1, left: 80),
//                               child: Text(
//                                 "11:00 - 11:30 ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold
// =======
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 10),
//                                 child: Text(
//                                   "د/ محمد ",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 "مستشفى عدن - المنصورة ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(width: 10,),
//                                   Text(
//                                     "11:00 - 11:30 ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold
//                                     ),
//                                   ),

//                                   Text(
//                                     ": الوقت  ",
//                                     textAlign: TextAlign.end,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),

//                               SizedBox(height: 5,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       " :المبلغ ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold
//                                       ),

//                                     ),
//                                     Text(
//                                       " :رقم الحجز ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold

//                                       ),
//                                     ),
//                                   ],
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 3,),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     "المبلغ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
// <<<<<<< HEAD
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold
// =======
//                                         fontSize: 14,

//                                       ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                                     ),

//                                   ),
//                                   Text(
//                                     "رقم الحجز ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
// <<<<<<< HEAD
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold

//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5),
//                               child: Row(mainAxisAlignment: MainAxisAlignment
//                                   .spaceAround,
//                                 children: [
//                                   Text(
//                                     "3000",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 20,
// =======
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,),

//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       " :عمر المريض",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold
//                                       ),

//                                     ),
//                                     Text(
//                                       ":أسم المريض ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold

//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(mainAxisAlignment: MainAxisAlignment
//                                     .spaceAround,
//                                   children: [
//                                     Text(
//                                       "30",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,

//                                       ),
//                                     ),
//                                     Text(
//                                       " هاشم علي",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 20,),
//                                     Text(
//                                       "في انتظار تأكيد الطبيب",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,

//                                       ),

//                                     ),

//                                     Text(
//                                       "  :حالة الحجز ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,fontWeight: FontWeight.bold
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,)
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5

//                                     ),
//                                   ),
//                                   Text(
//                                     "ID-23456",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )

//                           ],
//                         ),

//                       ),
//                     ),
//                   ),
//                   Card(
//                     shadowColor: Colors.grey.shade700,

//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
//                     ),

// <<<<<<< HEAD
//                     child: InkWell(
//                       splashColor: Colors.blue.withAlpha(30),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const mybooking()),
//                         );
//                       },
//                       child: Container(
//                         width: 87.95,
//                         height: 220.01,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(16),
//                               bottomRight: Radius.circular(16)),
//                           color: Colors.grey[300],
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: const Offset(
//                                 5.0,
//                                 5.0,
// =======
//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const mybooking()),
//                           );
//                         },
//                         child: Container(
//                           width: 87.95,
//                           height: 244.01,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(16),
//                                 bottomRight: Radius.circular(16)),
//                             color: Colors.grey[300],
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 10.0,
//                                 spreadRadius: 2.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                               ),
//                               blurRadius: 10.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0,
//                             ),

//                           ],


//                         ),

// <<<<<<< HEAD
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 40),
//                           child: Text(
//                             "AUG\n10\n2022",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 30,color: Colors.cyan[700]),
// =======
//                           child: Center(
//                             child: Text(
//                               "AUG\n10\n2022",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 20,color: Colors.cyan[700]),
//                             ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: height*0.02,),
//             Container(
//               child:Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Card(
//                     shadowColor: Colors.grey.shade700,

// <<<<<<< HEAD
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                           bottomLeft: Radius.circular(10)),
//                     ),

//                     child: InkWell(
//                       splashColor: Colors.blue.withAlpha(30),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const mybooking()),
//                         );
//                       },
//                       child:  Container(
//                         width: 250,
//                         height: 220.01,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(16),
//                               bottomLeft: Radius.circular(16)),
//                           color: Color(0xff36c0d6),

//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: const Offset(
//                                 5.0,
//                                 5.0,
// =======
//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const mybooking()),
//                           );
//                         },
//                         child:  Container(
//                           width: 250,
//                           height: 244.01,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(16),
//                                 bottomLeft: Radius.circular(16)),
//                             color: Color(0xff36c0d6),

//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 10.0,
//                                 spreadRadius: 2.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                               ),
//                               blurRadius: 10.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0,
//                             ),

//                           ],

//                         ),


// <<<<<<< HEAD
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10),
//                               child: Text(
//                                 "د/ محمد ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               "مستشفى عدن - المنصورة ",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Color(0xfff5f5f5),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 2, left: 140),
//                               child: Text(
//                                 "الوقت ",
//                                 textAlign: TextAlign.end,
//                                 style: TextStyle(
//                                   color: Color(0xfff5f5f5),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 1, left: 80),
//                               child: Text(
//                                 "11:00 - 11:30 ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold
// =======
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 10),
//                                 child: Text(
//                                   "د/ محمد ",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 "مستشفى عدن - المنصورة ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(width: 10,),
//                                   Text(
//                                     "11:00 - 11:30 ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold
//                                     ),
//                                   ),

//                                   Text(
//                                     ": الوقت  ",
//                                     textAlign: TextAlign.end,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),

//                               SizedBox(height: 5,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       " :المبلغ ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold
//                                       ),

//                                     ),
//                                     Text(
//                                       " :رقم الحجز ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold

//                                       ),
//                                     ),
//                                   ],
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 3,),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     "المبلغ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
// <<<<<<< HEAD
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold
// =======
//                                         fontSize: 14,

//                                       ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                                     ),

//                                   ),
//                                   Text(
//                                     "رقم الحجز ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
// <<<<<<< HEAD
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold

//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5),
//                               child: Row(mainAxisAlignment: MainAxisAlignment
//                                   .spaceAround,
//                                 children: [
//                                   Text(
//                                     "3000",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 20,
// =======
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,),

//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       " :عمر المريض",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold
//                                       ),

//                                     ),
//                                     Text(
//                                       ":أسم المريض ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold

//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(mainAxisAlignment: MainAxisAlignment
//                                     .spaceAround,
//                                   children: [
//                                     Text(
//                                       "30",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,

//                                       ),
//                                     ),
//                                     Text(
//                                       " هاشم علي",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 20,),
//                                     Text(
//                                       "في انتظار تأكيد الطبيب",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,

//                                       ),

//                                     ),

//                                     Text(
//                                       "  :حالة الحجز ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,fontWeight: FontWeight.bold
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,)
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5

//                                     ),
//                                   ),
//                                   Text(
//                                     "ID-23456",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )

//                           ],
//                         ),

//                       ),
//                     ),
//                   ),
//                   Card(
//                     shadowColor: Colors.grey.shade700,

//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
//                     ),

// <<<<<<< HEAD
//                     child: InkWell(
//                       splashColor: Colors.blue.withAlpha(30),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const mybooking()),
//                         );
//                       },
//                       child: Container(
//                         width: 87.95,
//                         height: 220.01,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(16),
//                               bottomRight: Radius.circular(16)),
//                           color: Colors.grey[300],
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: const Offset(
//                                 5.0,
//                                 5.0,
// =======
//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const mybooking()),
//                           );
//                         },
//                         child: Container(
//                           width: 87.95,
//                           height: 244.01,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(16),
//                                 bottomRight: Radius.circular(16)),
//                             color: Colors.grey[300],
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 10.0,
//                                 spreadRadius: 2.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                               ),
//                               blurRadius: 10.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0,
//                             ),

//                           ],


//                         ),

// <<<<<<< HEAD
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 40),
//                           child: Text(
//                             "AUG\n10\n2022",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 30,color: Colors.cyan[700]),
// =======
//                           child: Center(
//                             child: Text(
//                               "AUG\n10\n2022",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 20,color: Colors.cyan[700]),
//                             ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: height*0.02,),
//             Container(
//               child:Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Card(
//                     shadowColor: Colors.grey.shade700,

// <<<<<<< HEAD
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                           bottomLeft: Radius.circular(10)),
//                     ),

//                     child: InkWell(
//                       splashColor: Colors.blue.withAlpha(30),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const mybooking()),
//                         );
//                       },
//                       child:  Container(
//                         width: 250,
//                         height: 220.01,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(16),
//                               bottomLeft: Radius.circular(16)),
//                           color: Color(0xff36c0d6),

//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: const Offset(
//                                 5.0,
//                                 5.0,
// =======
//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const mybooking()),
//                           );
//                         },
//                         child:  Container(
//                           width: 250,
//                           height: 244.01,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(16),
//                                 bottomLeft: Radius.circular(16)),
//                             color: Color(0xff36c0d6),

//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 10.0,
//                                 spreadRadius: 2.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                               ),
//                               blurRadius: 10.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0,
//                             ),

//                           ],

//                         ),


// <<<<<<< HEAD
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10),
//                               child: Text(
//                                 "د/ محمد ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               "مستشفى عدن - المنصورة ",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Color(0xfff5f5f5),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 2, left: 140),
//                               child: Text(
//                                 "الوقت ",
//                                 textAlign: TextAlign.end,
//                                 style: TextStyle(
//                                   color: Color(0xfff5f5f5),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 1, left: 80),
//                               child: Text(
//                                 "11:00 - 11:30 ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold
// =======
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 10),
//                                 child: Text(
//                                   "د/ محمد ",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 "مستشفى عدن - المنصورة ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(width: 10,),
//                                   Text(
//                                     "11:00 - 11:30 ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold
//                                     ),
//                                   ),

//                                   Text(
//                                     ": الوقت  ",
//                                     textAlign: TextAlign.end,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),

//                               SizedBox(height: 5,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       " :المبلغ ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold
//                                       ),

//                                     ),
//                                     Text(
//                                       " :رقم الحجز ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold

//                                       ),
//                                     ),
//                                   ],
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 3,),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     "المبلغ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
// <<<<<<< HEAD
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold
// =======
//                                         fontSize: 14,

//                                       ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                                     ),

//                                   ),
//                                   Text(
//                                     "رقم الحجز ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
// <<<<<<< HEAD
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold

//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5),
//                               child: Row(mainAxisAlignment: MainAxisAlignment
//                                   .spaceAround,
//                                 children: [
//                                   Text(
//                                     "3000",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 20,

//                                     ),
//                                   ),
//                                   Text(
//                                     "ID-23456",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )

//                           ],
//                         ),

//                       ),
//                     ),
//                   ),
//                   Card(
//                     shadowColor: Colors.grey.shade700,

//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
//                     ),

//                     child: InkWell(
//                       splashColor: Colors.blue.withAlpha(30),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const mybooking()),
//                         );
//                       },
//                       child: Container(
//                         width: 87.95,
//                         height: 220.01,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(16),
//                               bottomRight: Radius.circular(16)),
//                           color: Colors.grey[300],
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: const Offset(
//                                 5.0,
//                                 5.0,
//                               ),
//                               blurRadius: 10.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0,
//                             ),

//                           ],


//                         ),

//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 40),
//                           child: Text(
//                             "AUG\n10\n2022",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 30,color: Colors.cyan[700]),
// =======
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,),

//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       " :عمر المريض",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold
//                                       ),

//                                     ),
//                                     Text(
//                                       ":أسم المريض ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold

//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(mainAxisAlignment: MainAxisAlignment
//                                     .spaceAround,
//                                   children: [
//                                     Text(
//                                       "30",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,

//                                       ),
//                                     ),
//                                     Text(
//                                       " هاشم علي",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 20,),
//                                     Text(
//                                       "في انتظار تأكيد الطبيب",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,

//                                       ),

//                                     ),

//                                     Text(
//                                       "  :حالة الحجز ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,fontWeight: FontWeight.bold
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,)

//                             ],
//                           ),

//                         ),
//                       ),
//                     ),
//                     Card(
//                       shadowColor: Colors.grey.shade700,

//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
//                       ),

//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const mybooking()),
//                           );
//                         },
//                         child: Container(
//                           width: 87.95,
//                           height: 244.01,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(16),
//                                 bottomRight: Radius.circular(16)),
//                             color: Colors.grey[300],
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 10.0,
//                                 spreadRadius: 2.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
//                               ),

//                             ],


//                           ),

//                           child: Center(
//                             child: Text(
//                               "AUG\n10\n2022",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 20,color: Colors.cyan[700]),
//                             ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: height*0.02,),
//             Container(
//               child:Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Card(
//                     shadowColor: Colors.grey.shade700,

// <<<<<<< HEAD
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                           bottomLeft: Radius.circular(10)),
//                     ),

//                     child: InkWell(
//                       splashColor: Colors.blue.withAlpha(30),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const mybooking()),
//                         );
//                       },
//                       child:  Container(
//                         width: 250,
//                         height: 220.01,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(16),
//                               bottomLeft: Radius.circular(16)),
//                           color: Color(0xff36c0d6),

//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: const Offset(
//                                 5.0,
//                                 5.0,
// =======
//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const mybooking()),
//                           );
//                         },
//                         child:  Container(
//                           width: 250,
//                           height: 244.01,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(16),
//                                 bottomLeft: Radius.circular(16)),
//                             color: Color(0xff36c0d6),

//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 10.0,
//                                 spreadRadius: 2.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                               ),
//                               blurRadius: 10.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0,
//                             ),

//                           ],

//                         ),


// <<<<<<< HEAD
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10),
//                               child: Text(
//                                 "د/ محمد ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               "مستشفى عدن - المنصورة ",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Color(0xfff5f5f5),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 2, left: 140),
//                               child: Text(
//                                 "الوقت ",
//                                 textAlign: TextAlign.end,
//                                 style: TextStyle(
//                                   color: Color(0xfff5f5f5),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 1, left: 80),
//                               child: Text(
//                                 "11:00 - 11:30 ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold
// =======
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 10),
//                                 child: Text(
//                                   "د/ محمد ",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 "مستشفى عدن - المنصورة ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(width: 10,),
//                                   Text(
//                                     "11:00 - 11:30 ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold
//                                     ),
//                                   ),

//                                   Text(
//                                     ": الوقت  ",
//                                     textAlign: TextAlign.end,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),

//                               SizedBox(height: 5,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       " :المبلغ ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold
//                                       ),

//                                     ),
//                                     Text(
//                                       " :رقم الحجز ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold

//                                       ),
//                                     ),
//                                   ],
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 3,),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     "المبلغ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
// <<<<<<< HEAD
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold
// =======
//                                         fontSize: 14,

//                                       ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                                     ),

//                                   ),
//                                   Text(
//                                     "رقم الحجز ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
// <<<<<<< HEAD
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold

//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5),
//                               child: Row(mainAxisAlignment: MainAxisAlignment
//                                   .spaceAround,
//                                 children: [
//                                   Text(
//                                     "3000",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 20,
// =======
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,),

//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       " :عمر المريض",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold
//                                       ),

//                                     ),
//                                     Text(
//                                       ":أسم المريض ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold

//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(mainAxisAlignment: MainAxisAlignment
//                                     .spaceAround,
//                                   children: [
//                                     Text(
//                                       "30",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,

//                                       ),
//                                     ),
//                                     Text(
//                                       " هاشم علي",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 20,),
//                                     Text(
//                                       "في انتظار تأكيد الطبيب",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,

//                                       ),

//                                     ),

//                                     Text(
//                                       "  :حالة الحجز ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,fontWeight: FontWeight.bold
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,)
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5

//                                     ),
//                                   ),
//                                   Text(
//                                     "ID-23456",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )

//                           ],
//                         ),

//                       ),
//                     ),
//                   ),
//                   Card(
//                     shadowColor: Colors.grey.shade700,

//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
//                     ),

// <<<<<<< HEAD
//                     child: InkWell(
//                       splashColor: Colors.blue.withAlpha(30),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const mybooking()),
//                         );
//                       },
//                       child: Container(
//                         width: 87.95,
//                         height: 220.01,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(16),
//                               bottomRight: Radius.circular(16)),
//                           color: Colors.grey[300],
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: const Offset(
//                                 5.0,
//                                 5.0,
// =======
//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const mybooking()),
//                           );
//                         },
//                         child: Container(
//                           width: 87.95,
//                           height: 244.01,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(16),
//                                 bottomRight: Radius.circular(16)),
//                             color: Colors.grey[300],
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 10.0,
//                                 spreadRadius: 2.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                               ),
//                               blurRadius: 10.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0,
//                             ),

//                           ],


//                         ),

// <<<<<<< HEAD
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 40),
//                           child: Text(
//                             "AUG\n10\n2022",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 30,color: Colors.cyan[700]),
// =======
//                           child: Center(
//                             child: Text(
//                               "AUG\n10\n2022",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 20,color: Colors.cyan[700]),
//                             ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: height*0.02,),
//             Container(
//               child:Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Card(
//                     shadowColor: Colors.grey.shade700,

// <<<<<<< HEAD
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                           bottomLeft: Radius.circular(10)),
//                     ),

//                     child: InkWell(
//                       splashColor: Colors.blue.withAlpha(30),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const mybooking()),
//                         );
//                       },
//                       child:  Container(
//                         width: 250,
//                         height: 220.01,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(16),
//                               bottomLeft: Radius.circular(16)),
//                           color: Color(0xff36c0d6),

//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: const Offset(
//                                 5.0,
//                                 5.0,
// =======
//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const mybooking()),
//                           );
//                         },
//                         child:  Container(
//                           width: 250,
//                           height: 244.01,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(16),
//                                 bottomLeft: Radius.circular(16)),
//                             color: Color(0xff36c0d6),

//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 10.0,
//                                 spreadRadius: 2.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                               ),
//                               blurRadius: 10.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0,
//                             ),

//                           ],

//                         ),


// <<<<<<< HEAD
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10),
//                               child: Text(
//                                 "د/ محمد ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               "مستشفى عدن - المنصورة ",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Color(0xfff5f5f5),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 2, left: 140),
//                               child: Text(
//                                 "الوقت ",
//                                 textAlign: TextAlign.end,
//                                 style: TextStyle(
//                                   color: Color(0xfff5f5f5),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 1, left: 80),
//                               child: Text(
//                                 "11:00 - 11:30 ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold
// =======
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 10),
//                                 child: Text(
//                                   "د/ محمد ",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 "مستشفى عدن - المنصورة ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(width: 10,),
//                                   Text(
//                                     "11:00 - 11:30 ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold
//                                     ),
//                                   ),

//                                   Text(
//                                     ": الوقت  ",
//                                     textAlign: TextAlign.end,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),

//                               SizedBox(height: 5,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       " :المبلغ ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold
//                                       ),

//                                     ),
//                                     Text(
//                                       " :رقم الحجز ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold

//                                       ),
//                                     ),
//                                   ],
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 3,),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     "المبلغ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
// <<<<<<< HEAD
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold
// =======
//                                         fontSize: 14,

//                                       ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                                     ),

//                                   ),
//                                   Text(
//                                     "رقم الحجز ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
// <<<<<<< HEAD
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold

//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5),
//                               child: Row(mainAxisAlignment: MainAxisAlignment
//                                   .spaceAround,
//                                 children: [
//                                   Text(
//                                     "3000",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 20,
// =======
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,),

//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       " :عمر المريض",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold
//                                       ),

//                                     ),
//                                     Text(
//                                       ":أسم المريض ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold

//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(mainAxisAlignment: MainAxisAlignment
//                                     .spaceAround,
//                                   children: [
//                                     Text(
//                                       "30",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,

//                                       ),
//                                     ),
//                                     Text(
//                                       " هاشم علي",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 20,),
//                                     Text(
//                                       "في انتظار تأكيد الطبيب",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,

//                                       ),

//                                     ),

//                                     Text(
//                                       "  :حالة الحجز ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,fontWeight: FontWeight.bold
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,)
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5

//                                     ),
//                                   ),
//                                   Text(
//                                     "ID-23456",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )

//                           ],
//                         ),

//                       ),
//                     ),
//                   ),
//                   Card(
//                     shadowColor: Colors.grey.shade700,

//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
//                     ),

// <<<<<<< HEAD
//                     child: InkWell(
//                       splashColor: Colors.blue.withAlpha(30),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const mybooking()),
//                         );
//                       },
//                       child: Container(
//                         width: 87.95,
//                         height: 220.01,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(16),
//                               bottomRight: Radius.circular(16)),
//                           color: Colors.grey[300],
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: const Offset(
//                                 5.0,
//                                 5.0,
// =======
//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const mybooking()),
//                           );
//                         },
//                         child: Container(
//                           width: 87.95,
//                           height: 244.01,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(16),
//                                 bottomRight: Radius.circular(16)),
//                             color: Colors.grey[300],
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 10.0,
//                                 spreadRadius: 2.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                               ),
//                               blurRadius: 10.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0,
//                             ),

//                           ],


//                         ),

// <<<<<<< HEAD
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 40),
//                           child: Text(
//                             "AUG\n10\n2022",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 30,color: Colors.cyan[700]),
// =======
//                           child: Center(
//                             child: Text(
//                               "AUG\n10\n2022",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 20,color: Colors.cyan[700]),
//                             ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                           ),
//                         ),
//                       ),
//                     ),
// <<<<<<< HEAD
//                   ),
//                 ],
//               ),
//             ), SizedBox(height: height*0.02,),
//             Container(
//               child:Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Card(
//                     shadowColor: Colors.grey.shade700,

//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                           bottomLeft: Radius.circular(10)),
//                     ),

//                     child: InkWell(
//                       splashColor: Colors.blue.withAlpha(30),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const mybooking()),
//                         );
//                       },
//                       child:  Container(
//                         width: 250,
//                         height: 220.01,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(16),
//                               bottomLeft: Radius.circular(16)),
//                           color: Color(0xff36c0d6),

//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: const Offset(
//                                 5.0,
//                                 5.0,
// =======
//                   ],
//                 ),
//               ),
//               SizedBox(height: height*0.02,),
//               Container(
//                 child:Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Card(
//                       shadowColor: Colors.grey.shade700,

//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                             bottomLeft: Radius.circular(10)),
//                       ),

//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const mybooking()),
//                           );
//                         },
//                         child:  Container(
//                           width: 250,
//                           height: 244.01,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(16),
//                                 bottomLeft: Radius.circular(16)),
//                             color: Color(0xff36c0d6),

//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 10.0,
//                                 spreadRadius: 2.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                               ),
//                               blurRadius: 10.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0,
//                             ),

//                           ],

//                         ),


// <<<<<<< HEAD
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10),
//                               child: Text(
//                                 "د/ محمد ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               "مستشفى عدن - المنصورة ",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Color(0xfff5f5f5),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 2, left: 140),
//                               child: Text(
//                                 "الوقت ",
//                                 textAlign: TextAlign.end,
//                                 style: TextStyle(
//                                   color: Color(0xfff5f5f5),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 1, left: 80),
//                               child: Text(
//                                 "11:00 - 11:30 ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold
// =======
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 10),
//                                 child: Text(
//                                   "د/ محمد ",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 "مستشفى عدن - المنصورة ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xfff5f5f5),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(width: 10,),
//                                   Text(
//                                     "11:00 - 11:30 ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold
//                                     ),
//                                   ),

//                                   Text(
//                                     ": الوقت  ",
//                                     textAlign: TextAlign.end,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),

//                               SizedBox(height: 5,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       " :المبلغ ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold
//                                       ),

//                                     ),
//                                     Text(
//                                       " :رقم الحجز ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold

//                                       ),
//                                     ),
//                                   ],
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 3,),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     "المبلغ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
// <<<<<<< HEAD
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold
// =======
//                                         fontSize: 14,

//                                       ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                                     ),

//                                   ),
//                                   Text(
//                                     "رقم الحجز ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Color(0xfff5f5f5),
// <<<<<<< HEAD
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold

//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5),
//                               child: Row(mainAxisAlignment: MainAxisAlignment
//                                   .spaceAround,
//                                 children: [
//                                   Text(
//                                     "3000",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 20,
// =======
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,),

//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       " :عمر المريض",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold
//                                       ),

//                                     ),
//                                     Text(
//                                       ":أسم المريض ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold

//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(mainAxisAlignment: MainAxisAlignment
//                                     .spaceAround,
//                                   children: [
//                                     Text(
//                                       "30",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,

//                                       ),
//                                     ),
//                                     Text(
//                                       " هاشم علي",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5, right: 5),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 20,),
//                                     Text(
//                                       "في انتظار تأكيد الطبيب",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xfff5f5f5),
//                                         fontSize: 14,

//                                       ),

//                                     ),

//                                     Text(
//                                       "  :حالة الحجز ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Color(0xfff5f5f5),
//                                           fontSize: 14,fontWeight: FontWeight.bold
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5,)
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5

//                                     ),
//                                   ),
//                                   Text(
//                                     "ID-23456",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xfff5f5f5),
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )

//                           ],
//                         ),

//                       ),
//                     ),
//                   ),
//                   Card(
//                     shadowColor: Colors.grey.shade700,

//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
//                     ),

// <<<<<<< HEAD
//                     child: InkWell(
//                       splashColor: Colors.blue.withAlpha(30),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const mybooking()),
//                         );
//                       },
//                       child: Container(
//                         width: 87.95,
//                         height: 220.01,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(16),
//                               bottomRight: Radius.circular(16)),
//                           color: Colors.grey[300],
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: const Offset(
//                                 5.0,
//                                 5.0,
// =======
//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const mybooking()),
//                           );
//                         },
//                         child: Container(
//                           width: 87.95,
//                           height: 244.01,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(16),
//                                 bottomRight: Radius.circular(16)),
//                             color: Colors.grey[300],
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 10.0,
//                                 spreadRadius: 2.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                               ),
//                               blurRadius: 10.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0,
//                             ),

//                           ],


//                         ),

// <<<<<<< HEAD
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 40),
//                           child: Text(
//                             "AUG\n10\n2022",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 30,color: Colors.cyan[700]),
// =======
//                           child: Center(
//                             child: Text(
//                               "AUG\n10\n2022",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 20,color: Colors.cyan[700]),
//                             ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5
//                           ),
//                         ),
//                       ),
//                     ),
// <<<<<<< HEAD
//                   ),
//                 ],
//               ),
//             ), SizedBox(height: height*0.02,),
// =======
//                   ],
//                 ),
//               ),
//               SizedBox(height: height*0.02,),


//             ],
//           ),
// >>>>>>> c90bca2c1bbe577422d63591c71137bb04d16cb5

// */
//       ]),
//     );
//   }
// }
