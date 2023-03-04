import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paulineife_user/helpers/theme.dart';

class ThemeService {
  static final _getStorage = GetStorage();
  static final storageKey = 'isDarkMode';

  static ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  static bool isSavedDarkMode() {
    return _getStorage.read(storageKey) ?? false;
  }

  void saveThemeMode(bool isDarkMode) {
    _getStorage.write(storageKey, isDarkMode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }

  void setDarkThemeMode(bool dark) {
    Get.changeTheme(dark ? Themes().darkTheme : Themes().lightTheme);
    saveThemeMode(dark);
  }
}
