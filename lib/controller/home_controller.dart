import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:async/async.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:path/path.dart';
import 'package:paulineife_user/constant/constant.dart';
import 'package:paulineife_user/controller/login_controller.dart';
import 'package:paulineife_user/helpers/helpers.dart';
import 'package:paulineife_user/models/api/HomeResponse.dart';
import 'package:paulineife_user/models/api/random_post.dart';
import 'package:paulineife_user/views/screens/screen_home.dart';

import '../models/Login.dart';
import '../models/api/PostModel.dart';
import '../models/api/StoryModel.dart';
import '../models/api/refresh_post.dart';

class HomeController extends GetxController {
  RxBool isChecked = false.obs;
  File? img;
  List<File> images = [];
  File? StoryImg;
  File? vid;

  RxBool liked = true.obs;
  var posts = Rx<List<Post>>([]);
  var stories = Rx<List<Post>>([]);
  var uploadPostsLoading = false.obs;
  var userName = "".obs;
  var profileImage = '$userPlaceholder'.obs;
  var loadingUpdateProfile = false.obs;

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  void fetchHomeData() async {
    var loginResponse = await LoginController.getLoginResponse();
    print("loginResponse: $loginResponse");
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? "{}"));

    String url = domainUrlWithProtocol + data.image;
    if (url.endsWith('null') || url.endsWith(".co")) {
      url = userPlaceholder;
    }
    print(data.toJson());

    userName.value = data.username;
    print(userName.value);
    profileImage.value = url;

    final response = await http.get(
      Uri.parse("https://rollupp.co/api/home/?page=1"),
      headers: {"Authorization": "Bearer ${data.accessToken}"},
    );
    log("fetchHomeData: ${response.body}");

    var obj = HomeResponse.fromJson(jsonDecode(response.body));
    posts.value = obj.posts;
    stories.value = obj.stories;
  }

  // void fetchRefreshPost() async {
  //   var loginResponse = await LoginController.getLoginResponse();
  //   var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));
  //   print(data.accessToken);
  //
  //   final response = await http.get(
  //     Uri.parse("https://rollupp.co/api/refereshpost/"),
  //     headers: {"Authorization": "Bearer ${data.accessToken}"},
  //   );
  //
  //
  //   log("Refresh post: " + response.body);
  //   var obj = RefreshPost.fromJson(jsonDecode(response.body));
  //   posts.value = obj.getPost;
  // }

  Future<void> fetchRefreshPost() async {
    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));
    print(data.accessToken);

    final response = await http.get(
      Uri.parse("https://rollupp.co/api/refereshpost/"),
      headers: {"Authorization": "Bearer ${data.accessToken}"},
    );

    print("Refresh post: " + response.body);
    final refreshPost = RefreshPost.fromJson(jsonDecode(response.body));
    posts.value = refreshPost.posts;

    // for (final post in refreshPost.posts) {
    //   if (post.isThread) {
    //     final threadPost = post as ThreadPost;
    //
    //     print(threadPost.childPosts.length);
    //
    //     // Do something with the thread post and its child posts
    //     // The child posts are in threadPost.childPosts
    //   } else {
    //     // Do something with the normal post
    //   }
    // }
  }

  void fetchRandomPost() async {
    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));

    final response = await http.get(
      Uri.parse('https://rollupp.co/api/randompost/?page=1'),
      headers: {"Authorization": "Bearer ${data.accessToken}"},
    );
    print("fetchRandomPost: ${response.body}");

    var obj = RandomPost.fromJson(jsonDecode(response.body));
    posts.value = obj.getPost;
  }

  Future<void> uploadThreadPost(String caption, List<File> files) async {
    uploadPostsLoading.value = true;

    // var request = http.MultipartRequest('POST', Uri.parse("https://rollupp.co/post/uploadthread"));

    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));

    // var token = data.accessToken;
    // var userId = data.userId;

    var posts = [
      {"caption": caption},
      ...files.map((e) => {'image': base64Encode(e.readAsBytesSync()), "is_thread": 1})
    ];

    var data2 = jsonEncode(posts);

    log(data2);

    var response = await http.post(
      Uri.parse('https://rollupp.co/post/uploadthread/'),
      body: /*{'post': jsonEncode(posts)}*/ jsonEncode({"post": posts}),
      headers: {
        "Authorization": "Bearer ${data.accessToken}",
        "Content-Type": "application/json" // Set the content type to JSON
      },
    ).catchError((error) {
      showMessageSheet("Error", error.toString(), sheetType: BottomSheetType.error);
    });

    // Add the caption object to the request
    // request.fields['post[0][caption]'] = caption;

    // Add the file objects to the reques
    // await Future.forEach(files, (File file) async {
    //   var index = files.indexOf(file);
    //   // var compressedFile = await compressImage(file);
    //
    //   // request.fields['post[${index + 1}][caption]'] = 'thread ${index + 1}';
    //
    //   final bytes = file.readAsBytesSync();
    //   final encoded = base64Encode(bytes);
    //
    //   request.fields['post[${index + 1}][is_thread]'] = '1';
    //   request.fields['post[${index + 1}][image]'] = encoded;
    //
    //   // request.files.add(await http.MultipartFile(
    //   //   "post[${index + 1}][image]",
    //   //   stream,
    //   //   length,
    //   //   contentType: MediaType("file", "jpg"),
    //   //   filename: basename(file.path),
    //   // ));
    //
    //   // request.fields['post[${index + 1}][user]'] = userId.toString();
    // });
    //
    // request.headers.addAll({"Authorization": "Bearer $token"});
    //
    // var streamedResponse = await request.send().catchError((e) {
    //   uploadPostsLoading.value = false;
    //   print(e);
    // });

    uploadPostsLoading.value = false;

    // print(streamedResponse.statusCode);

    // if (streamedResponse.statusCode == 301) {
    //   var newUrl = streamedResponse.headers['location'];
    //   final newRequest = http.Request(request.method, Uri.parse(newUrl.toString()));
    //   newRequest.headers.addAll(request.headers);
    //   newRequest.followRedirects = request.followRedirects;
    //   newRequest.maxRedirects = request.maxRedirects;
    //   streamedResponse = await newRequest.send();
    // }
    //
    // final response = await http.Response.fromStream(streamedResponse);

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print('Posts uploaded successfully.');
      Get.offAll(HomeScreen());
    } else {
      print('Failed to upload posts.');
      showMessageSheet(response.statusCode.toString(), response.body.toString(), buttonText: "Dismiss");
    }
  }

  Future<void> uploadNormalPost(List<String> captions, List<File> files) async {
    uploadPostsLoading.value = true;

    // var request = http.MultipartRequest('POST', Uri.parse("https://rollupp.co/post/uploadthread"));

    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));

    // var token = data.accessToken;
    // var userId = data.userId;

    // var posts = [
    //   // {"caption": caption},
    //   ...files.map((e) => {
    //         'image': base64Encode(e.readAsBytesSync()),
    //         "is_thread": 1,
    //       })
    // ];
    var posts = [];

    captions.removeLast();

    print(images.map((e) => e.path).toList());
    print(captions);

    for (int i = 0; i < captions.length; i++) {
      var caption = captions[i];
      var image = base64Encode(images[i].readAsBytesSync());
      posts.add({"caption": caption, "image": image, "is_thread": 0});
    }

    var response = await http.post(
      Uri.parse('https://rollupp.co/post/upload/'),
      body: /*{'post': jsonEncode(posts)}*/ jsonEncode({"post": posts}),
      headers: {
        "Authorization": "Bearer ${data.accessToken}",
        "Content-Type": "application/json" // Set the content type to JSON
      },
    ).catchError((error) {
      showMessageSheet("Error", error.toString(), sheetType: BottomSheetType.error);
    });

    // Add the caption object to the request
    // request.fields['post[0][caption]'] = caption;

    // Add the file objects to the reques
    // await Future.forEach(files, (File file) async {
    //   var index = files.indexOf(file);
    //   // var compressedFile = await compressImage(file);
    //
    //   // request.fields['post[${index + 1}][caption]'] = 'thread ${index + 1}';
    //
    //   final bytes = file.readAsBytesSync();
    //   final encoded = base64Encode(bytes);
    //
    //   request.fields['post[${index + 1}][is_thread]'] = '1';
    //   request.fields['post[${index + 1}][image]'] = encoded;
    //
    //   // request.files.add(await http.MultipartFile(
    //   //   "post[${index + 1}][image]",
    //   //   stream,
    //   //   length,
    //   //   contentType: MediaType("file", "jpg"),
    //   //   filename: basename(file.path),
    //   // ));
    //
    //   // request.fields['post[${index + 1}][user]'] = userId.toString();
    // });
    //
    // request.headers.addAll({"Authorization": "Bearer $token"});
    //
    // var streamedResponse = await request.send().catchError((e) {
    //   uploadPostsLoading.value = false;
    //   print(e);
    // });

    uploadPostsLoading.value = false;

    // print(streamedResponse.statusCode);

    // if (streamedResponse.statusCode == 301) {
    //   var newUrl = streamedResponse.headers['location'];
    //   final newRequest = http.Request(request.method, Uri.parse(newUrl.toString()));
    //   newRequest.headers.addAll(request.headers);
    //   newRequest.followRedirects = request.followRedirects;
    //   newRequest.maxRedirects = request.maxRedirects;
    //   streamedResponse = await newRequest.send();
    // }
    //
    // final response = await http.Response.fromStream(streamedResponse);

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print('Posts uploaded successfully.');
      Get.offAll(HomeScreen());
    } else {
      print('Failed to upload posts.');
      showMessageSheet(response.statusCode.toString(), response.body.toString(), buttonText: "Dismiss");
    }
  }

  Future<File> compressImage(File file) async {
    ImageFile input = ImageFile(filePath: file.path, rawBytes: file.readAsBytesSync()); // set the input image file
    Configuration config = Configuration(
      outputType: ImageOutputType.webpThenJpg,
      // can only be true for Android and iOS while using ImageOutputType.jpg or ImageOutputType.pngÏ
      useJpgPngNativeCompressor: false,
      // set quality between 0-100
      quality: 40,
    );

    final param = ImageFileConfiguration(input: input, config: config);
    final output = await compressor.compress(param);

    return File(output.filePath);
  }

  Future<void> updateUserProfile(String firstName, String lastName, String username, String website, String bio) async {
    loadingUpdateProfile.value = true;

    var loginResponse = await LoginController.getLoginResponse();
    print("loginResponse: $loginResponse");
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? "{}"));
    print(data.userId);
    var request = http.MultipartRequest('PUT', Uri.parse("https://rollupp.co/api/detailupdate/${data.userId}"));

    request.fields['firstname'] = firstName;
    request.fields['lastname'] = lastName;
    request.fields['website'] = website;
    request.fields['bio'] = bio;

    if (img != null) {
      var stream = new http.ByteStream(DelegatingStream.typed(img!.openRead()));
      var length = await img!.length(); //imageFile is your image file

      request.files.add(await http.MultipartFile(
        "image",
        stream,
        length,
        contentType: MediaType("file", "jpg"),
        filename: basename(img!.path),
      ));
    }

    request.headers.addAll({"Authorization": "Bearer ${data.accessToken}"});
    var streamedResponse = await request.send().catchError((error) {
      loadingUpdateProfile.value = false;
      showMessageSheet(
        "Error",
        error.toString(),
        sheetType: BottomSheetType.error,
      );
    });

    loadingUpdateProfile.value = false;

    print(streamedResponse.statusCode);
    final response = await http.Response.fromStream(streamedResponse);

    print(response.body);
    print(response.statusCode);
  }
}
