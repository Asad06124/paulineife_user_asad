import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_chat.dart';
import 'package:paulineife_user/views/screens/screen_report.dart';
import 'package:sizer/sizer.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryViewScreen extends StatefulWidget {
  StoryViewScreen({required this.StryCount});

  var StryCount;

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  StoryController controller = StoryController();
  List<StoryItem> storyItems = [];

  @override
  void initState() {
    super.initState();
    initStoryPageItems();
  }

  void initStoryPageItems() {
    for (int i = 0; i < widget.StryCount; i++) {
      storyItems.add(StoryItem.pageImage(
        url:
            'https://scontent.fmux2-1.fna.fbcdn.net/v/t39.30808-1/272115146_318883370152289_959529854943140445_n.jpg?stp=dst-jpg_p320x320&_nc_cat=108&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeER8e_80iKZdwjcaOaYxI1TpAWJ6Ibe0aGkBYnoht7RoZqJnOjYQAQ8zZmMfQAlOpcuioT9QJUL6AWxPJjtPD4c&_nc_ohc=PbdR0oi8fO4AX-4bc1j&_nc_oc=AQlJbCFHjlYmIgzWZ16z2DhDZDL3Tqq8R1tDCrbL2sXH0GTClKrsojCaWXETXFnfeuc&_nc_ht=scontent.fmux2-1.fna&oh=00_AfDDCBXpYFxdoHdqf5NwfzCB03Buq9J3bUP3KUnqO17WCQ&oe=63F67873',
        controller: controller,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StoryView(
            storyItems: storyItems,
            controller: controller,
            onVerticalSwipeComplete: (direction) {
              if (direction == Direction.down) {
                Navigator.pop(context);
              }
            },
            onComplete: () {
              Navigator.pop(context);
            },
          ),
          Column(
            children: [
              SizedBox(
                height: 45.sp,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 20.sp,
                  backgroundImage: NetworkImage(
                      'https://scontent.fmux2-1.fna.fbcdn.net/v/t39.30808-1/272115146_318883370152289_959529854943140445_n.jpg?stp=dst-jpg_p320x320&_nc_cat=108&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeER8e_80iKZdwjcaOaYxI1TpAWJ6Ibe0aGkBYnoht7RoZqJnOjYQAQ8zZmMfQAlOpcuioT9QJUL6AWxPJjtPD4c&_nc_ohc=PbdR0oi8fO4AX-4bc1j&_nc_oc=AQlJbCFHjlYmIgzWZ16z2DhDZDL3Tqq8R1tDCrbL2sXH0GTClKrsojCaWXETXFnfeuc&_nc_ht=scontent.fmux2-1.fna&oh=00_AfDDCBXpYFxdoHdqf5NwfzCB03Buq9J3bUP3KUnqO17WCQ&oe=63F67873'),
                ),
                title: Text(
                  'Asad',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DMSansR',
                      color: Colors.white),
                ),
                subtitle: Text('5h',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSansR',
                        color: Colors.white)),
                trailing: PopupMenuButton(
                  onOpened: () {
                    controller.pause();
                  },
                  onCanceled: () {
                    controller.play();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      onTap: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Get.to(ReportScreen());
                        });
                      },
                      child: Text(
                        'Report',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFF0000),
                            fontFamily: 'DMSansR'),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'Block',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            fontFamily: 'DMSansR'),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Get.to(ChatScreen());
                        });
                      },
                      child: Text(
                        'Message',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            fontFamily: 'DMSansR'),
                      ),
                    ),
                    PopupMenuItem(
                      child: Text(
                        'Share',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            fontFamily: 'DMSansR'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
