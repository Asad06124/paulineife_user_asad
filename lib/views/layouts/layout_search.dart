import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_search_profile.dart';
import 'package:paulineife_user/widgets/custom_input_field1.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/theme_service.dart';

class SearchLayout extends StatelessWidget {
  const SearchLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.sp,
              ),
              CustomInputField1(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                  borderSide: BorderSide.none,
                ),
                fillColor: ThemeService.isSavedDarkMode() ? Color(0xff3d3d3d) : Color(0xffE2E4EB),
                prefix: Icon(Icons.search,color:ThemeService.isSavedDarkMode() ? Colors.white:Colors.black),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
                hint: 'Search',
                hintStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F)),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                'Search Result',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      onTap: () {
                        Get.to(ProfileScreen());
                      },
                      leading: CircleAvatar(
                        radius: 25.sp,
                        backgroundImage: AssetImage('assets/images/12.png'),
                      ),
                      title: Text(
                        'Asad',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                      ),
                      subtitle: Text(
                        'Flutter Developer',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),
                        ),
                      ),
                      trailing: SvgPicture.asset('assets/images/Vector.svg', color:ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),),
                    );
                  },
                ),
              ),
              Text(
                'Recent Searches',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      leading: CircleAvatar(
                        radius: 25.sp,
                        backgroundImage: AssetImage('assets/images/12.png'),
                      ),
                      title: Text(
                        'Asad',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                      ),
                      subtitle: Text(
                        'Flutter Developer',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),
                        ),
                      ),
                      trailing: SvgPicture.asset('assets/images/Vector.svg', color:ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
