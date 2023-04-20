import 'package:get/get.dart';

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';

  String get allInCaps => this.toUpperCase();

  String get capitalizeFirstofEach => this.split(" ").map((str) => str.capitalize).join(" ");
}


extension MyDateTime on DateTime {
  String get toRelativeTime {
    Duration difference = DateTime.now().difference(this);
    if (difference.inDays >= 365) {
      return "${(difference.inDays / 365).floor()} years ago";
    } else if (difference.inDays >= 30) {
      return "${(difference.inDays / 30).floor()} months ago";
    } else if (difference.inDays >= 7) {
      return "${(difference.inDays / 7).floor()} weeks ago";
    } else if (difference.inDays > 0) {
      return "${difference.inDays} days ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hours ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minutes ago";
    } else {
      return "Just now";
    }
  }
  String get toRelativeTimeShort {
    Duration difference = DateTime.now().difference(this);
    if (difference.inDays >= 365) {
      return "${(difference.inDays / 365).floor()}y";
    } else if (difference.inDays >= 30) {
      return "${(difference.inDays / 30).floor()} mon";
    } else if (difference.inDays >= 7) {
      return "${(difference.inDays / 7).floor()}w";
    } else if (difference.inDays > 0) {
      return "${difference.inDays}d";
    } else if (difference.inHours > 0) {
      return "${difference.inHours}h";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} min";
    } else {
      return "Just now";
    }
  }
}