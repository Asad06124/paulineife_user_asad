import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_chat_list.dart';
import 'package:paulineife_user/views/screens/screen_story_view.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/status_view_custom.dart';

class HomeLayout extends StatelessWidget {
   HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List StoryCount = [2,5,6,8];
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 2.sp),
            child: Text(
              'Roll Upp',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2A70C8),
                  fontFamily: 'Ubuntu-Light'),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 2.sp),
              child: IconButton(
                onPressed: () {
                  Get.to(ChatListScreen());
                },
                icon: Icon(Icons.mail),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(size.height / 10),
            child: Expanded(
                child: ListView.builder(
              itemCount: StoryCount.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(4.sp),
                  child: StatusViewCustom(
                    onTap: (){
                      Get.to(StoryViewScreen(StryCount: StoryCount[index],));
                    },
                    radius: 25.sp,
                    spacing: 8.sp,
                    strokeWidth: 2,
                    indexOfSeenStatus: 3,
                    numberOfStatus: StoryCount[index],
                    padding: 4,
                    centerImageUrl:
                        'assets/images/12.png',
                    seenColor: Colors.grey,

                    unSeenColor: Colors.red,
                  ),
                );
              },
            )),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height / 1.7 + 15,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    image: DecorationImage(
                        image: AssetImage('assets/images/post.png'),
                        fit: BoxFit.cover),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Image(
                        image: AssetImage('assets/images/12.png'),
                      ),
                    ),
                    title: Text(
                      'Asad Ullah',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'DMSansR',
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      '2 hours ago',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSansR',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/images/refresh.svg'),
                    SvgPicture.asset('assets/images/repeat.svg'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
