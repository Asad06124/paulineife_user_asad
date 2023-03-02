import 'package:audioplayers/audioplayers.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemAudioPlay extends StatefulWidget {
  // List audiosList;
  String url;
  Function(bool isPlaying)? isPlaying;
  bool? disabled;

  // int index;
  @override
  _ItemAudioPlayState createState() => _ItemAudioPlayState();

  ItemAudioPlay({required this.url, this.isPlaying, this.disabled});
// ItemAudioPlay({
//   required this.audiosList,
//   required this.index,
// });
}

class _ItemAudioPlayState extends State<ItemAudioPlay> {
  bool isPlaying = false;
  bool mute = false;

  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
        if (widget.isPlaying != null) {
          widget.isPlaying!(isPlaying);
        }
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () async {
            if (widget.disabled != null && widget.disabled == true && !isPlaying) {
              Get.snackbar(
                  "Alert",
                  "Please pause another playing audio first",
                  backgroundColor: Colors.black,
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM
              );
              return;
            }

            if (!isPlaying) {
              await audioPlayer.setSourceUrl(widget.url);
              await audioPlayer.audioCache;
              await audioPlayer.resume();
              setState(() {});
            } else {
              await audioPlayer.pause();
            }
          },
          icon: (isPlaying)
              ? Icon(
            Icons.pause,
            color: Colors.black,
          )
              : Icon(
            Icons.play_arrow,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  activeColor: Color(0xffD5EBFF),
                  inactiveColor: Colors.grey,
                  thumbColor: Color(0xff3AA0FF),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                    // await audioPlayer.resume();
                  }),
            ],
          ),
        ),
        Text("${timeStampToDateTime(position.inMilliseconds, "mm:ss")}"),
      ],
    );
    }
}