// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_home.dart';
import 'package:paulineife_user/views/screens/screen_login.dart';

class ScreenOnboarding extends StatefulWidget {
  @override
  _ScreenOnboardingState createState() => _ScreenOnboardingState();
}

class _ScreenOnboardingState extends State<ScreenOnboarding> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/images/onboarding1.svg',
      text: "Share With People",
      desc: "Share your experience, Time and Events with friends and family",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/images/onboarding2.svg',
      text: "Connect With People",
      desc: "Make new friends and connect with old ones",
      bg: Color(0xFF4756DF),
      button: Colors.white,
    ),
    OnboardModel(
      img: 'assets/images/onboarding3.svg',
      text: "Spread Your Love",
      desc: "Spread love, like, comment and post",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex % 2 == 0 ? kwhite : kwhite,
      appBar: AppBar(
        backgroundColor: currentIndex % 2 == 0 ? kwhite : kwhite,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            // physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(screens[index].img),
                  Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DMSans-Bold',
                      color: index % 2 == 0 ? kblack : kblack,
                    ),
                  ),
                  Text(
                    screens[index].desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'DMSansR',
                      fontWeight: FontWeight.w500,
                      color: index % 2 == 0 ? kblack : kblack,
                    ),
                  ),
                  Container(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: screens.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                width: currentIndex == index ? 25 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: currentIndex == index ||
                                          currentIndex > index
                                      ? Color(0xff2A70C8)
                                      : Color(0xffD9D9D9),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      print(index);
                      if (index == screens.length - 1) {
                        Get.offAll(ScreenLogin());
                      }

                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceIn,
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: index == 2 ? Get.height / 15 : 60,
                      width: index == 2 ? Get.width / 1.3 : 60,
                      decoration: BoxDecoration(
                          color: Color(0xff2A70C8),
                          borderRadius:
                              BorderRadius.circular(index == 2 ? 10 : 50)),
                      child: currentIndex != 2
                          ? Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            )
                          : Text(
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: index % 2 == 0 ? kwhite : kblue),
                            ),
                    ),
                  ),
                  currentIndex != 2 ?  TextButton(
                    onPressed: () {
                      Get.offAll(ScreenLogin());
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: currentIndex % 2 == 0 ? kblack : kblack,
                      ),
                    ),
                  ):SizedBox(),
                ],
              );
            }),
      ),
    );
  }
}

class OnboardModel {
  String img;
  String text;
  String desc;
  Color bg;
  Color button;

  OnboardModel({
    required this.img,
    required this.text,
    required this.desc,
    required this.bg,
    required this.button,
  });
}

Color kblue = Color(0xFF4756DF);
Color kwhite = Color(0xFFFFFFFF);
Color kblack = Color(0xFF000000);
Color kbrown300 = Color(0xFF8D6E63);
Color kbrown = Color(0xFF795548);
Color kgrey = Color(0xFFC0C0C0);
