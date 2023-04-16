import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:path/path.dart';
import 'package:paulineife_user/controller/login_controller.dart';
import 'package:paulineife_user/models/api/HomeResponse.dart';
import 'package:paulineife_user/models/api/random_post.dart';

import '../models/Login.dart';
import '../models/api/PostModel.dart';
import '../models/api/refresh_post.dart';

class HomeController extends GetxController {
  RxBool isChecked = false.obs;
  File? img;
  List<File> images = [];
  File? StoryImg;
  File? vid;

  RxBool liked = true.obs;
  var posts = Rx<List<Post>>([]);
  var stories = Rx<List<Story>>([]);
  var uploadPostsLoading = false.obs;

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  void fetchHomeData() async {
    var loginResponse = await LoginController.getLoginResponse();
    print("loginResponse: $loginResponse");
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? "{}"));
    final response = await http.get(
      Uri.parse("https://rollupp.co/api/home/?page=1"),
      headers: {"Authorization": "Bearer ${data.token?.accessToken}"},
    );
    print("fetchHomeData: ${response.body}");
    var obj = HomeResponse.fromJson(jsonDecode(response.body));
    posts.value = obj.getPostList;
    stories.value = obj.getStoryList;
  }

  void fetchRefreshPost() async {
    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));

    final response = await http.get(
      Uri.parse("https://rollupp.co/api/refereshpost/"),
      headers: {"Authorization": "Bearer ${data.token?.accessToken}"},
    );
    var obj = RefreshPost.fromJson(jsonDecode(response.body));
    posts.value = obj.getPost;
  }

  void fetchRandomPost() async {
    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));

    final response = await http.get(
      Uri.parse('https://rollupp.co/api/randompost/?page=1'),
      headers: {"Authorization": "Bearer ${data.token?.accessToken}"},
    );
    print("fetchRandomPost: ${response.body}");

    var obj = RandomPost.fromJson(jsonDecode(response.body));
    posts.value = obj.getPost;
  }

  Future<void> uploadThreadPost(String caption, List<File> files) async {
    uploadPostsLoading.value = true;

    var request = http.MultipartRequest('POST', Uri.parse("https://rollupp.co/post/uploadthread"));

    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));

    var token = data.token?.accessToken;
    var userId = data.userId;
    // Add the caption object to the request
    request.fields['post[0][caption]'] = caption;

    // Add the file objects to the request
    await Future.forEach(files, (File file) async {
      var index = files.indexOf(file);
      // var compressedFile = await compressImage(file);

      // request.fields['post[${index + 1}][caption]'] = 'thread ${index + 1}';

      var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length(); //imageFile is your image file

      request.fields['post[${index + 1}][is_thread]'] = '1';

      request.files.add(await http.MultipartFile(
        "post[${index + 1}][image]",
        stream,
        length,
        contentType: MediaType("file", "jpg"),
        filename: basename(file.path),
      ));

      // request.fields['post[${index + 1}][user]'] = userId.toString();
    });

    request.headers.addAll({"Authorization": "Bearer $token"});

    var streamedResponse = await request.send().catchError((e) {
      uploadPostsLoading.value = false;
      print(e);
    });
    uploadPostsLoading.value = false;

    print(streamedResponse.statusCode);

    if (streamedResponse.statusCode == 301) {
      var newUrl = streamedResponse.headers['location'];
      final newRequest = http.Request(request.method, Uri.parse(newUrl.toString()));
      newRequest.headers.addAll(request.headers);
      newRequest.followRedirects = request.followRedirects;
      newRequest.maxRedirects = request.maxRedirects;
      streamedResponse = await newRequest.send();
    }

    final response = await http.Response.fromStream(streamedResponse);

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print('Posts uploaded successfully.');
    } else {
      print('Failed to upload posts.');
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

  Future<void> updateProfilePic() async {
    if (img == null) {
      return;
    }

    var loginResponse = await LoginController.getLoginResponse();
    print("loginResponse: $loginResponse");
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? "{}"));
    print(data.userId);
    var request = http.MultipartRequest('PUT', Uri.parse("https://rollupp.co/api/detailupdate/${data.userId}"));

    var stream = new http.ByteStream(DelegatingStream.typed(img!.openRead()));
    var length = await img!.length(); //imageFile is your image file

    request.files.add(await http.MultipartFile(
      "image",
      stream,
      length,
      contentType: MediaType("file", "jpg"),
      filename: basename(img!.path),
    ));

    request.headers.addAll({"Authorization": "Bearer ${data.token?.accessToken}"});
    var streamedResponse = await request.send();
    print(streamedResponse.statusCode);
    final response = await http.Response.fromStream(streamedResponse);

    print(response.body);
    print(response.statusCode);
  }
}
