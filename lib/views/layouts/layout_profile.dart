import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/widgets/custom_buttom.dart';
import 'package:sizer/sizer.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asad'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_rounded),
      ),
      body: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.sp,
                        backgroundImage: NetworkImage(
                            'https://scontent.fmux2-1.fna.fbcdn.net/v/t39.30808-1/272115146_318883370152289_959529854943140445_n.jpg?stp=dst-jpg_p320x320&_nc_cat=108&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeER8e_80iKZdwjcaOaYxI1TpAWJ6Ibe0aGkBYnoht7RoZqJnOjYQAQ8zZmMfQAlOpcuioT9QJUL6AWxPJjtPD4c&_nc_ohc=PbdR0oi8fO4AX-4bc1j&_nc_oc=AQlJbCFHjlYmIgzWZ16z2DhDZDL3Tqq8R1tDCrbL2sXH0GTClKrsojCaWXETXFnfeuc&_nc_ht=scontent.fmux2-1.fna&oh=00_AfDDCBXpYFxdoHdqf5NwfzCB03Buq9J3bUP3KUnqO17WCQ&oe=63F67873'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Asad\n',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DMSansR',
                              color: Color(0xff000000),
                            ),
                            children: [
                              TextSpan(
                                text: '@asad',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DMSans-Bold',
                                  color: Color(0xff2A70C8),
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 30.sp,
                  ),
                ),
              ]),
          SizedBox(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text:
                    'Lorem ipsum dolor sit amet, consectetur eliteita adipiscing elit. Morbi at malesuada mi.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSansR',
                  color: Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: '\nwww.google.com',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DMSans-Bold',
                      color: Color(0xff2A70C8),
                    ),
                  )
                ]),
          ),
          SizedBox(
            height: Get.height / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: '10k\n',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DMSans-Bold',
                      color: Color(0xff000000),
                    ),
                    children: [
                      TextSpan(
                        text: 'Followers',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DMSansR',
                          color: Color(0xff79869F),
                        ),
                      )
                    ]),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: '1.1k\n',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DMSansR-Bold',
                      color: Color(0xff000000),
                    ),
                    children: [
                      TextSpan(
                        text: 'Following',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DMSansR',
                          color: Color(0xff79869F),
                        ),
                      )
                    ]),
              ),
              SizedBox(),
            ],
          ),
          CustomButton1(
              text: 'Edit Profile',
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp),),
              textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSansR',color: Colors.black,),elevation: 0,height: Get.height/16,width: Get.width/1.2,color: Color(0xffE2E4EB),
              onPressed: () {})
        ],
      ),
    );
  }
}
