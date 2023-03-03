import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_top_panel/sliding_top_panel.dart';

import '../../helpers/theme_service.dart';

class StoryTextViewScreen extends StatelessWidget {
  StoryTextViewScreen({Key? key, required this.strl}) : super(key: key);
  SlidingPanelTopController strl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        body: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(10.sp),
              leading: Container(
                padding: EdgeInsets.all(2.sp),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.sp,
                      color: Color(0xff2A70C8),
                    )),
                child: CircleAvatar(
                  radius: 20.sp,
                  backgroundImage: AssetImage('assets/images/12.png'),
                ),
              ),
              title: Text(
                'Asad_Official',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.more_vert,
                color: Color(0xff97A1B4),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 80.h,
                child: AutoSizeText(
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit.Vivamus ac hendrerit leo, vel volutpat lectus. Cras finibus mi diam. Donec nisi orci, varius nec lectus at, tincidunt posuere mauris. Cras cursus quis mi sed tempor. Praesent ac lectus ut libero pharetra egestas. Morbi pharetra malesuada dictum. Nam ultrices tempor ultrices. Mauris accumsan nisl et justo convallis, in scelerisquedolor placerat.Sed et est rhoncus, blandit ligula et, mattis ligula.Curabitur cursus cursus eros sit amet iaculis. Morbi eget efficitur mi. Sed tincidunt dignissim libero, id placerat urna varius at. Donec ultrices, odio at tempor congue, massa ex  molestie arcu, sit amet tristique nulla mauris blandit sapien.  Donec rutrum, lacus ac placerat porta, eros lectus dignissim   dui, ac rhoncus felis tortor nec libero. Nulla facilisi.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Vivamus ac hendrerit leo, vel volutpat lectus. Cras finibus mi diam. Donec nisi orci, varius nec lectus at, tincidunt posuere mauris. Cras cursus quis mi sed tempor. Praesent ac lectus ut libero pharetra egestas. Morbi pharetra malesuada dictum. Nam ultrices tempor ultrices. Mauris accumsan nisl et justo convallis, in scelerisquedolor placerat.Sed et est rhoncus, blandit ligula et, mattis ligula.Curabitur cursus cursus eros sit amet iaculis. Morbi eget efficitur mi. Sed tincidunt dignissim libero, id placerat urna varius at. Donec ultrices, odio at tempor congue, massa ex  molestie arcu, sit amet tristique nulla mauris blandit sapien.  Donec rutrum, lacus ac placerat porta, eros lectus dignissim   dui, ac rhoncus felis tortor nec libero. Nulla facilisi.''',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  maxLines: 40,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 40.sp),
          child: FloatingActionButton(
            elevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            onPressed: () {
              Get.back();
              strl.toggle();
              strl.close();
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
              size: 30.sp,
            ),
            backgroundColor: Color(0xff3D3D3D),
          ),
        ),
      ),
    );
  }
}
