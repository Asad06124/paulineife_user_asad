import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_chat.dart';
import 'package:paulineife_user/views/screens/screen_comments.dart';
import 'package:paulineife_user/views/screens/screen_report.dart';
import 'package:paulineife_user/views/screens/screen_see_viewers.dart';
import 'package:sizer/sizer.dart';
import 'package:sliding_top_panel/sliding_top_panel.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';
import 'dart:math' as math;

class StoryViewScreen extends StatefulWidget {
  StoryViewScreen({required this.StryCount});

  var StryCount;

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  ValueNotifier<bool> _isPanelVisible = ValueNotifier(false);
  SlidingPanelTopController _controller = SlidingPanelTopController();

  StoryController controller = StoryController();
  List<StoryItem> storyItems = [];

  @override
  void initState() {
    super.initState();
    super.initState();
    _controller.addListener(listenerController);
    initStoryPageItems();
  }

  void listenerController() {
    _isPanelVisible.value = _controller.isPanelOpen;
  }

  @override
  void dispose() {
    _controller.removeListener(listenerController);
    _controller.dispose();
    super.dispose();
  }

  void initStoryPageItems() {
    for (int i = 0; i < widget.StryCount; i++) {
      storyItems.add(StoryItem.pageImage(
        url:
            'https://lh3.googleusercontent.com/T8AcWAttHqoH6hpkmgG-t3BzQoldR6zlxNmpSMDevN6AQm88Gld9veiMscGZE2mc_oYUGxQcWBm1u_oehLz0fOPZuV0jk84s0_mnV-EH2xLBpof2XoFsHUZBoqZtFJf4LapuDr0Vr3VFF3pDTsVPdZxmVpLakXoSdCsGclwu8QhiyEL64uezNo3c3PUtOTGCN0cSQDUAluezF09OhwgSTuwDbkzeOj1b7Xrpl_5eIBUxbTTVBjWH05qZGzRVVbxah33ahqOttGjsUsJqKHdR2TSKgJGvsMUONjXO1JuJUBd8gwpo-8ZxaYeI4X0cT1cUY377BzkdG7pUhWlYZwuzz-4bH1B1Ly7hC9_n45OziGq3JmZ1o__uRsKs5zPR2rxaVdBLs5tcGJDrDN2QIr9Mi9x-NjVXsqfKDz_l-AY_LcXd_9SX2RYKeubFo7YVzSOst-EIpe01Ust7Z85LkkALF9PXPEq_sZltPuLGEBhDpHWVGK3MMxQwnWk-9bHCilTgZeUmRPz3PKLOf-uzRPLd8G-FD_WsbtBA9bwESg0auBJk4EjvAat4CZ4BOtdN2Wm_7LpDpWEDo1jlVJ8IBKZc82yMKaJezLAVTQcN7Ioo5xf44v8EFZMsa7FBWkyKGvTQrmoHzPn8jkEXJFD5p-gjsCISDmbZ1ELNQdLk8D2og5vDH3-Ho1uBlNkc-WiR8rR6rcxXPEBT5Pk5PLvXyjIVVimOuslSKwQPoAYB2g485j5SN4_1DcSnWiTBHXBbhuJChJEbbRM4Is29PGpy1Psvn5vTzFemL9eyDbYCU6PQRXYvwebaMTdX987mBNjLmnKfrnZzswGElV9a1EIg8Qf9k9xNMUs8UjFN097MkgpIK1Tu_R2cFd1ZDdSEUX218W7VqJXQ5CcvxmcIRLNO8W2ItZ3WTil_HW0h61Ggini-TAeH0EoTceGs0ECTqpUOR-69ds_RJrdYGk-OhO65bIk1aQEAYYOqffQbrBOJhUUkuFZCyX7ZI1aKlQ2I=w1280-h720-no?authuser=0',
        controller: controller,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SlidingTopPanel(
          maxHeight: Get.height / 1.18,

          decorationPanel: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          controller: _controller,
          header: Container(),
          panel: (_) => _buildListPanel(),
          body: _buildGridList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          onTap: () {
            _controller.toggle();
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 40.sp),
            child: FloatingActionButton(
              onPressed: () {
                if (_controller.isPanelOpen == false) {
                  _controller.open();

                  controller.pause();
                } else if (_controller.isPanelOpen == true) {
                  _controller.close();
                  controller.play();
                }
              },
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 30.sp,
              ),
              backgroundColor: Color(0x5effffff),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListPanel() => Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(10.sp),
            leading: CircleAvatar(
              radius: 20.sp,
              backgroundImage: AssetImage('assets/images/12.png'),
            ),
            title: Text(
              'Asad_Official',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSansR',
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                height: 70.h,

                child: AutoSizeText(
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit.Vivamus ac hendrerit leo, vel volutpat lectus. Cras finibus mi diam. Donec nisi orci, varius nec lectus at, tincidunt posuere mauris. Cras cursus quis mi sed tempor. Praesent ac lectus ut libero pharetra egestas. Morbi pharetra malesuada dictum. Nam ultrices tempor ultrices. Mauris accumsan nisl et justo convallis, in scelerisquedolor placerat.Sed et est rhoncus, blandit ligula et, mattis ligula.Curabitur cursus cursus eros sit amet iaculis. Morbi eget efficitur mi. Sed tincidunt dignissim libero, id placerat urna varius at. Donec ultrices, odio at tempor congue, massa ex  molestie arcu, sit amet tristique nulla mauris blandit sapien.  Donec rutrum, lacus ac placerat porta, eros lectus dignissim   dui, ac rhoncus felis tortor nec libero. Nulla facilisi.''',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  maxLines: 40,

                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSansR',
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildGridList() => Stack(
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
                  backgroundImage: AssetImage('assets/images/12.png'),
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
                          Get.off(ChatScreen());
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
              SizedBox(
                height: Get.height / 1.9,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Get.width / 1.2,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.off(SeeViewersScreen());
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                          Text(
                            '10.9k',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'DMSansR',
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.favorite_outlined,
                          color: Colors.white,
                          size: 25.sp,
                        ),
                        Text(
                          '10.9k',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DMSansR',
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(CommentsScreen(
                          COntroller: controller,
                        ));
                        controller.pause();
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.add_comment_sharp,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                          Text(
                            '1.5k',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'DMSansR',
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
}
