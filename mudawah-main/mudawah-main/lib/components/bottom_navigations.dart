import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mudawah/utils/app_constants.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../views/Home/HomePage.dart';
import '../views/MyBookings/Bookings.dart';
import '../views/OnBoarding.dart';
import '../views/Schedule/myschedule.dart';
import '../views/Schedule/scadual_screen.dart';
import '../views/account/account.dart';
import '../views/accountSettings/settings1.dart';
import 'package:mudawah/views/file/file.dart';
import '../views/file/bookingcard.dart';
import '../views/search/search.dart';
import '../views/appointment/appointment.dart';

class BottomNavigations extends StatelessWidget {
  const BottomNavigations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens1() {
      return [
        settings1(),
        account(),
        //bookingschedule(),

        bookingcard(),
        // Bookings(),
        HomePage(),
      ];
    }

    List<Widget> _buildScreens2() {
      return [
        settings1(),
        account(),
        bookingcard(),
        bookingschedule(),
        HomePage(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems1() {
      return [
        PersistentBottomNavBarItem(
          icon: new Image.asset(
            'assets/bottomNav/Settings.png',
            color: CupertinoColors.systemGrey,
          ),
          title: ("الاعدادات"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: new Image.asset(
            'assets/bottomNav/account.png',
            color: CupertinoColors.systemGrey,
          ),
          title: ("الحساب"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: new Image.asset(
            'assets/bottomNav/approvefile.png',
            color: CupertinoColors.systemGrey,
          ),
          title: ("الملف"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: new Image.asset(
            'assets/bottomNav/Home.png',
            color: CupertinoColors.systemGrey,
          ),
          title: ("الرئيسية"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems2() {
      return [
        PersistentBottomNavBarItem(
          icon: new Image.asset(
            'assets/bottomNav/Settings.png',
            color: CupertinoColors.systemGrey,
          ),
          title: ("الاعدادات"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: new Image.asset(
            'assets/bottomNav/account.png',
            color: CupertinoColors.systemGrey,
          ),
          title: ("الحساب"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: new Image.asset(
            'assets/bottomNav/approvefile.png',
            color: CupertinoColors.systemGrey,
          ),
          title: ("حجوزاتي"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.work_outline_outlined,
            color: CupertinoColors.systemGrey,
          ),
          title: ("اعمالي"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: new Image.asset(
            'assets/bottomNav/Home.png',
            color: CupertinoColors.systemGrey,
          ),
          title: ("الرئيسية"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    PersistentTabController _controller1 =
        PersistentTabController(initialIndex: 3);
    PersistentTabController _controller2 =
        PersistentTabController(initialIndex: 4);
    if (AppCostants.user.roleId == 5 || AppCostants.user.roleId == '5') {
      print('bottom condition 1 ${AppCostants.user.roleId}');
      return PersistentTabView(
        context,
        controller: _controller2,
        screens: _buildScreens2(),
        items: _navBarsItems2(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      );
    } else {
      print('bottom condition 2 ${AppCostants.user.roleId}');
      return PersistentTabView(
        context,
        controller: _controller1,
        screens: _buildScreens1(),
        items: _navBarsItems1(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      );
    }
    ;
  }
}
