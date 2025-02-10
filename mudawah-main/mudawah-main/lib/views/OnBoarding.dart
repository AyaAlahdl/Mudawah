import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mudawah/components/bottom_navigations.dart';
import 'package:mudawah/helper/depedencies.dart';
import 'package:mudawah/others/routes/routes.dart';

import 'loginSys/login_screen/login_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    storage.write('onBoarding', 'onBoarding');
    super.initState();
  }

  final kTitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 26.0,
    height: 1.0,
  );

  final kSubtitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    height: 1.2,
  );
  final ksmalleStyle = TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    height: 1.2,
  );

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(microseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF37CAEC),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double pagewidth = MediaQuery.of(context).size.width;
    double pageheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(42, 147, 213, 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 120,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      //color: Colors.blue,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/onBoarding/pngs/backimg1.png'),
                                        fit: BoxFit.fill,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      clipBehavior: Clip.none,
                                      children: <Widget>[
                                        SizedBox(height: 30.0),
                                        Positioned(
                                          top: 30,
                                          right: 20,
                                          child: TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            LoginScreen1())),
                                            child: Text(
                                              'تخطي',
                                              style: kSubtitleStyle,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 30.0),
                                        Positioned(
                                          bottom: -60,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/onBoarding/pngs/img1.png'),
                                            height: 300,
                                            width: 300.0,
                                          ),
                                        ),
                                        SizedBox(height: 30.0),
                                        Positioned(
                                          bottom: -120,
                                          right: 20,
                                          child: Text(
                                            "ابحث عن افضل الاطباء\n  في منطقتك",
                                            style: kTitleStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        SizedBox(height: 30.0),
                                        Positioned(
                                          right: 20,
                                          // top: pageheight / 2 + 140,
                                          bottom: -160,
                                          child: Text(
                                            "بمساعدة خوارزمياتنا الذكية حدد الان  \n افضل الاطباء من حولك بسهولة تامة",
                                            style: ksmalleStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      //color: Colors.blue,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/onBoarding/pngs/Vector.png'),
                                        fit: BoxFit.fill,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      clipBehavior: Clip.none,
                                      children: <Widget>[
                                        SizedBox(height: 30.0),
                                        Positioned(
                                          top: 30,
                                          right: 20,
                                          child: TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            LoginScreen1())),
                                            child: Text(
                                              'تخطي',
                                              style: kSubtitleStyle,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 30.0),
                                        Positioned(
                                          bottom: -60,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/onBoarding/pngs/img2.png'),
                                            height: 300,
                                            width: pagewidth,
                                          ),
                                        ),
                                        SizedBox(height: 30.0),
                                        Positioned(
                                          bottom: -120,
                                          right: 20,
                                          child: Text(
                                            " نظم موعدك مع الاطباء الخبراء",
                                            style: kTitleStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        SizedBox(height: 30.0),
                                        Positioned(
                                          right: 20,
                                          //top: pageheight / 2 + 140,
                                          bottom: -180,
                                          child: Text(
                                            "ابحث عن الاطباء المتخصصين ذوي الخبرة\n مع تقييم الخبرات والمراجعات",
                                            style: ksmalleStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      //color: Colors.blue,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/onBoarding/pngs/Group1.png'),
                                        fit: BoxFit.fill,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      clipBehavior: Clip.none,
                                      children: <Widget>[
                                        SizedBox(height: 30.0),
                                        Positioned(
                                          top: 30,
                                          right: 20,
                                          child: TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            LoginScreen1())),
                                            child: Text(
                                              'تخطي',
                                              style: kSubtitleStyle,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 30.0),
                                        Positioned(
                                          bottom: -60,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/onBoarding/pngs/rafiki.png'),
                                            height: 300,
                                            width: pagewidth,
                                          ),
                                        ),
                                        SizedBox(height: 30.0),
                                        Positioned(
                                          bottom: -120,
                                          right: 20,
                                          child: Text(
                                            "احجز موعدك بدون متاعب",
                                            style: kTitleStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        SizedBox(height: 30.0),
                                        Positioned(
                                          right: 20,
                                          // top: pageheight / 2 + 140,
                                          bottom: -180,
                                          child: Text(
                                            " لا تستطيع الذهاب الى المستشفى؟\n احجز موعد مع طبيبك الخاص داخل التطبيق\n وفي دقائق قليلة",
                                            style: ksmalleStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: _buildPageIndicator(),
              // ),
              _currentPage != _numPages - 1
                  ? Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.0),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: ExactAssetImage(
                                              'assets/onBoarding/pngs/downimg.png'),
                                          fit: BoxFit.fill)),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        _pageController.nextPage(
                                            duration:
                                                Duration(microseconds: 300),
                                            curve: Curves.easeIn);
                                      },
                                      child: Text(
                                        'التالي',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _buildPageIndicator(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text(''),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 90.0,
              width: double.infinity,
              color: Color(0xff2b92d5),
              //decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))),
              child: GestureDetector(
                onTap: () => print('get started'),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Get.offAndToNamed(Routes.SplashScreen);
                        },
                        child: Text(
                          'انطلق',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      // Icon(
                      //   Icons.arrow_forward,
                      //   color: Colors.white,
                      //   size: 30.0,
                      // )
                    ],
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
