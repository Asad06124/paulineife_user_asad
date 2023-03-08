import 'dart:io';

import 'package:custom_gallery_display/custom_gallery_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomGalleryPicker extends StatefulWidget {

  Function(List<File> files, bool isNormal) onPicked;

  @override
  _CustomGalleryPickerState createState() => _CustomGalleryPickerState();

  CustomGalleryPicker({
    required this.onPicked,
  });
}

class _CustomGalleryPickerState extends State<CustomGalleryPicker> {
  @override
  Widget build(BuildContext context) {
    return CustomGalleryDisplay.normalDisplay(
        displaySource: DisplaySource.gallery,
        pickerSource: PickerSource.image,
        multiSelection: true,
        // cropImage: true,
        // It's true by default
        galleryDisplaySettings: GalleryDisplaySettings(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 1.7, mainAxisSpacing: 1.5), // It's true by default
        ),
        onDone: (SelectedImagesDetails details) async {
          bool multiSelectionMode = details.multiSelectionMode;
          List<SelectedByte> selectedFiles = details.selectedFiles;
          double aspectRatio = details.aspectRatio;
          var files = selectedFiles.map((e) => e.selectedFile).toList();

          await showCupertinoModalPopup<String>(
            context: context,
            builder: (BuildContext context) {
              return CupertinoActionSheet(
                title: Text('Post images as?'),
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () {
                      // do something
                      Navigator.pop(context);
                      widget.onPicked(files, true);
                    },
                    child: Text('Normal Image'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      // do something
                      Navigator.pop(context);
                      widget.onPicked(files, false);
                    },
                    child: Text('Thread'),
                  ),
                ],

                cancelButton: CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              );
            },
          );


        });
  }
}
