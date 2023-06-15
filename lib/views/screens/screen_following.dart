import 'dart:convert';

import 'package:custom_utils/custom_utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:listview_infinite_pagination/listview_infinite_pagination.dart';
import 'package:paulineife_user/models/following_response.dart';
import 'package:paulineife_user/views/screens/screen_search_profile.dart';

import '../../controller/login_controller.dart';
import '../../helpers/theme.dart';
import '../../helpers/theme_service.dart';
import '../../models/Login.dart';
import '../../widgets/custom_input_field1.dart';

class FollowingScreen extends StatefulWidget {
  String username;
  String type;

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();

  FollowingScreen({
    required this.username,
    required this.type,
  });
}

class _FollowingScreenState extends State<FollowingScreen> {
  String _accessToken = "";
  var _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          title: Text(
            widget.type.capitalizeFirst.toString(),
            style: getAppbarTextTheme(),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
              )),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.sp,
              ),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: CustomInputField1(
                  textStyle: TextStyle(
                    color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide: BorderSide.none,
                  ),
                  onChange: (value) {
                    setState(() {
                      _searchQuery = value.toString();
                    });
                  },
                  fillColor: ThemeService.isSavedDarkMode() ? Color(0xff3d3d3d) : Color(0xffE2E4EB),
                  prefix: Icon(Icons.search, color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xffE2E4EB)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
                  hint: 'Search',
                  hintStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F)),
                ),
              ),
              Expanded(
                child: ListviewInfinitePagination<FollowingUser>(
                  physics: BouncingScrollPhysics(),
                  initialLoader: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  onFinished: SizedBox(),
                  itemBuilder: (index, item) {
                    var result = item as FollowingUser;
                    var size = 30.sp;

                    return item.username.startsWith(_searchQuery)
                        ? ListTile(
                            onTap: () {
                              Get.to(ProfileScreen(username: result.username));
                            },
                            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                            leading: Container(
                              padding: EdgeInsets.all(2.sp),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1.sp,
                                    color: Color(0xff2A70C8),
                                  )),
                              child: ExtendedImage.network(
                                result.image,
                                height: size,
                                width: size,
                                shape: BoxShape.circle,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              result.username,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                            ),
                            // subtitle: Text(
                            //   '@asad',
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     fontWeight: FontWeight.w400,
                            //     color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff2A70C8),
                            //   ),
                            // ),
                            trailing: ElevatedButton(
                                child: Text(
                                  'Following',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                                  ),
                                ),
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(ThemeService.isSavedDarkMode() ? Colors.black : Color(0xdfffffff)),
                                ),
                                onPressed: () {}),
                          )
                        : SizedBox();
                  },
                  onEmpty: NotFound(
                    message: "No data",
                  ),
                  onError: (error) {
                    print(error.toString());
                    return Text("Something went wrong\n[${error.toString()}]");
                  },
                  dataFetcher: (int currentListSize) => getFollowings(currentListSize),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<FollowingUser>> getFollowings(int page) async {
    var url = "https://rollupp.co/api/get-${widget.type}/${widget.username}?page=$page";
    var accessToken = await getAccessToken();
    var response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $accessToken"},
    );
    if (response.statusCode != 200) {
      return [];
    }
    print("response: ${response.body}");
    var followingResponse = FollowingResponse.fromJson(jsonDecode(response.body));
    return followingResponse.results;
  }

  Future<String> getAccessToken() async {
    if (_accessToken.isNotEmpty) {
      return _accessToken;
    }

    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? "{}"));
    _accessToken = data.accessToken;
    return _accessToken;
  }
}
