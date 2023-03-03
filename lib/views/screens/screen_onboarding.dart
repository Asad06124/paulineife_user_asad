import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/helpers/theme_service.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: kwhite,
        appBar: AppBar(
          backgroundColor: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
          elevation: 0.0,
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: PageView.builder(
                itemCount: screens.length,
                controller: _pageController,
                // reverse: true,
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
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        screens[index].desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: index % 2 == 0 ? kblack : kblack,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ],
                  );
                }),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: currentIndex != screens.length - 1 ? MediaQuery.of(context).size.height * 0.68 : MediaQuery.of(context).size.height * 0.72,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                screens.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                  width: currentIndex == index ? 25 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index || currentIndex > index ? Color(0xff2A70C8) : Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: currentIndex != screens.length - 1 ? MediaQuery.of(context).size.height * 0.72 : MediaQuery.of(context).size.height * 0.80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    // print(index);
                    if (currentIndex == screens.length - 1) {
                      Get.offAll(ScreenLogin());
                    }

                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: currentIndex == 2 ? Get.height / 15 : 60,
                    width: currentIndex == 2 ? Get.width / 1.3 : 60,
                    decoration: BoxDecoration(color: Color(0xff2A70C8), borderRadius: BorderRadius.circular(currentIndex == 2 ? 10 : 50)),
                    child: currentIndex != 2
                        ? Icon(
                            Icons.arrow_forward_ios,
                            color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
                          )
                        : Text(
                            "Get Started",
                            style: TextStyle(fontSize: 16.0, color: currentIndex % 2 == 0 ? kwhite : kblue),
                          ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: currentIndex != screens.length - 1 ? MediaQuery.of(context).size.height * 0.81 : MediaQuery.of(context).size.height * 0,
            child: currentIndex != 2
                ? TextButton(
                    onPressed: () {
                      Get.offAll(ScreenLogin());
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: currentIndex % 2 == 0 ? kblack : kblack,
                      ),
                    ),
                  )
                : SizedBox(),
          )
        ]),
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
Color kblack = Color(0x80000000);
Color kbrown300 = Color(0xFF8D6E63);
Color kbrown = Color(0xFF795548);
Color kgrey = Color(0xFFC0C0C0);
