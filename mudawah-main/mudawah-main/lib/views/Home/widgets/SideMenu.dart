import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/models/doctor_model.dart';
import 'package:mudawah/others/functions/get_image_from_iternet.dart';
import 'package:mudawah/utils/app_constants.dart';
import 'package:mudawah/views/Home/components/aboutapp.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share/share.dart';

import '../../payment/payment.dart';
import '../components/contact_us.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(),
          ListTile(
            title: Text(
              'اضافة',
              textDirection: TextDirection.rtl,
            ),
            subtitle: Text(
              'مستشفى او عياده',
              textDirection: TextDirection.rtl,
            ),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => contactus())),
            },
            trailing: Icon(
              Icons.add,
              color: Colors.cyan,
            ),
            selectedColor: Colors.cyan,
          ),
          Divider(),
          ListTile(
            title: Text(
              'طرق الدفع',
              textDirection: TextDirection.rtl,
            ),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Payment())),
            },
            trailing: Icon(
              Icons.money,
              color: Colors.cyan,
            ),
            selectedColor: Colors.cyan,
          ),
          Divider(),
          ListTile(
            title: Text(
              'تقديم ملاحظات',
              textDirection: TextDirection.rtl,
            ),
            onTap: () => {
              showDialog<void>(
                context: context,
                barrierDismissible:
                    true, // false = user must tap button, true = tap outside dialog
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: Text(
                      'تقديم ملاحظات',
                      textDirection: TextDirection.rtl,
                    ),
                    content: TextFormField(
                      textDirection: TextDirection.rtl,
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('تم'),
                        onPressed: () {
                          Navigator.of(dialogContext)
                              .pop(); // Dismiss alert dialog
                        },
                      ),
                    ],
                  );
                },
              )
            },
            trailing: Icon(
              Icons.note_alt_outlined,
              color: Colors.cyan,
            ),
            selectedColor: Colors.cyan,
          ),
          Divider(),
          // ListTile(
          //   title: Text(
          //     'مشاركة',
          //     textDirection: TextDirection.rtl,
          //   ),
          //   onTap: () => {
          //     Share.share("http://.play.google.com"),
          //   },
          //   trailing: Icon(
          //     Icons.share,
          //     color: Colors.cyan,
          //   ),
          //   selectedColor: Colors.cyan,
          // ),
          // Divider(),
          ListTile(
            title: Text(
              'تقيم التطبيق',
              textDirection: TextDirection.rtl,
            ),
            onTap: () => {
              showDialog(
                context: context,
                barrierDismissible: true,
                // false = user must tap button, true = tap outside dialog
                builder: (context) {
                  return RatingDialog(
                    title: Text(
                      'قيم التطبيق',
                      textDirection: TextDirection.rtl,
                    ),
                    message: Text(
                      'قم بضغط على النجوم من اجل تقيم التطبيق',
                      textDirection: TextDirection.rtl,
                    ),
                    image: Image.asset(
                      'assets/login/logo.png',
                      height: 100,
                      width: 100,
                    ),
                    onSubmitted: (RatingDialogResponse) {},
                    submitButtonText: 'تم',
                  );
                },
              )
            },
            trailing: Icon(
              Icons.star,
              color: Colors.cyan,
            ),
            selectedColor: Colors.cyan,
          ),
          Divider(),
          ListTile(
            title: Text(
              'عن التطبيق',
              textDirection: TextDirection.rtl,
            ),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => contactus())),
            },
            trailing: Icon(
              Icons.contact_support_outlined,
              color: Colors.cyan,
            ),
            selectedColor: Colors.cyan,
          ),
          Divider(),
          ListTile(
            title: Text(
              'تواصل معنا',
              textDirection: TextDirection.rtl,
            ),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => contactus())),
            },
            trailing: Icon(
              Icons.app_shortcut,
              color: Colors.cyan,
            ),
            selectedColor: Colors.cyan,
          ),
        ],
      ),
    );
  }

  Widget DrawerHeader() {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
          colors: [
            Color(0xff00C9FD),
            Color(0xff84DFB4),
          ],
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          right: 100,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: UserAccountsDrawerHeader(
            accountName: Text(AppCostants.user.name!),
            accountEmail: Text(AppCostants.user.email!),
            currentAccountPicture: CircleAvatar(
              radius: 20,
              backgroundImage: (AppCostants.user.avatar == '')
                  ? Doctor.profile[0].doctorimg as ImageProvider
                  : getImageNetwork(AppCostants.user.avatar!),
            ),
            decoration: BoxDecoration(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
