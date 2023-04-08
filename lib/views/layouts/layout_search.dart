import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/controller/user_search_controller.dart';
import 'package:paulineife_user/views/screens/screen_search_profile.dart';
import 'package:paulineife_user/widgets/custom_input_field1.dart';
import 'package:sizer/sizer.dart';

import '../../constant/constant.dart';
import '../../helpers/theme_service.dart';

class SearchLayout extends StatelessWidget {
  const SearchLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(UserSearchController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        body: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.sp,
                ),
                CustomInputField1(
                  textStyle: TextStyle(
                    color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide: BorderSide.none,
                  ),
                  controller: controller.textController.value,
                  onChange: (value) => controller.fetchUsers(value.toString()),
                  fillColor: ThemeService.isSavedDarkMode() ? Color(0xff3d3d3d) : Color(0xffE2E4EB),
                  prefix: Icon(Icons.search, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
                  hint: 'Search',
                  hintStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F)),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Obx(() {
                  return Container(
                    child: (controller.filteredUsers.isNotEmpty && controller.textController.value.text.isNotEmpty)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Search Results',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                                ),
                              ),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.filteredUsers.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {

                                  var user = controller.filteredUsers[index];

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                                      onTap: () {
                                        Get.to(ProfileScreen());
                                      },
                                      leading: Container(
                                        height: 35.sp,
                                        width: 35.sp,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:  CachedNetworkImageProvider(domainUrlWithProtocol + user.image),
                                            fit: BoxFit.cover
                                          ),
                                          shape: BoxShape.circle
                                        ),
                                      ),
                                      title: Text(
                                        user.username.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                                      ),
                                      // subtitle: Text(
                                      //   'Flutter Developer',
                                      //   style: TextStyle(
                                      //     fontSize: 14,
                                      //     fontWeight: FontWeight.w500,
                                      //     color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),
                                      //   ),
                                      // ),
                                      trailing: SvgPicture.asset(
                                        'assets/images/Vector.svg',
                                        color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          )
                        : controller.searchLoading.isTrue
                            ? Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : SizedBox(),
                  );
                }),
                Text(
                  'Recent Searches',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
                          color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),
                        ),
                      ),
                      trailing: SvgPicture.asset(
                        'assets/images/Vector.svg',
                        color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
