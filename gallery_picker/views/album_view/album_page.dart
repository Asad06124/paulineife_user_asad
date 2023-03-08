import 'package:flutter/material.dart';
import 'package:paulineife_user/helpers/gallery_picker/gallery_picker_importer.dart';
import 'album_medias_view.dart';

class AlbumPage extends StatelessWidget {
  final bool singleMedia;
  final PhoneGalleryController controller;
  final GalleryAlbum? album;
  final bool isBottomSheet;
  const AlbumPage(
      {super.key,
      required this.album,
      required this.controller,
      required this.singleMedia,
      required this.isBottomSheet});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: controller.config.backgroundColor,
          appBar: album != null
              ? AlbumAppBar(
                  album: album!,
                  controller: controller,
                  isBottomSheet: isBottomSheet,
                )
              : null,
          body: album != null
              ? AlbumMediasView(
                  galleryAlbum: album!,
                  controller: controller,
                  isBottomSheet: isBottomSheet,
                  singleMedia: singleMedia,
                )
              : Center(
                  child: Text(
                  "No Album Found",
                  style: controller.config.textStyle,
                )),
        ),
        onWillPop: () async {
          controller.backToPicker();
          return false;
        });
  }
}
