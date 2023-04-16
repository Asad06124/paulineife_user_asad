import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/api/user_search_model.dart';

// Convert list of SearchUser objects to list of maps
List<Map<String, dynamic>> searchUserListToMapList(List<SearchUser> searchUserList) {
  return searchUserList.map((searchUser) => searchUser.toMap()).toList();
}

// Convert list of maps to list of JSON strings
List<String> mapListToJsonStringList(List<Map<String, dynamic>> mapList) {
  return mapList.map((map) => json.encode(map)).toList();
}

// Store list of SearchUser objects in shared preferences
Future<void> storeSearchUserListInSharedPreferences(List<SearchUser> searchUserList) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<Map<String, dynamic>> mapList = searchUserListToMapList(searchUserList);
  List<String> jsonStringList = mapListToJsonStringList(mapList);
  await prefs.setStringList('searchUserList', jsonStringList);
}

// Convert list of JSON strings to list of maps
List<Map<String, dynamic>> jsonStringListToMapList(List<String> jsonStringList) {
  return jsonStringList.map((jsonString) => json.decode(jsonString) as Map<String, dynamic>).toList();
}

// Convert list of maps to list of SearchUser objects
List<SearchUser> mapListToSearchUserList(List<Map<String, dynamic>> mapList) {
  return mapList.map((map) => SearchUser.fromMap(map)).toList();
}

// Fetch list of SearchUser objects from shared preferences
Future<List<SearchUser>> fetchSearchUserListFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? jsonStringList = prefs.getStringList('searchUserList');
  if (jsonStringList == null) {
    return [];
  }
  List<Map<String, dynamic>> mapList = jsonStringListToMapList(jsonStringList);
  List<SearchUser> searchUserList = mapListToSearchUserList(mapList);
  return searchUserList;
}

// Add a SearchUser object to the list and store the updated list in shared preferences
Future<void> addSearchUserToSharedPreferences(SearchUser searchUser) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<SearchUser> searchUserList = await fetchSearchUserListFromSharedPreferences();
  if (searchUserList.contains(searchUser)){
    return;
  }
  searchUserList.add(searchUser);
  List<Map<String, dynamic>> mapList = searchUserListToMapList(searchUserList);
  List<String> jsonStringList = mapListToJsonStringList(mapList);
  await prefs.setStringList('searchUserList', jsonStringList);
}

// Remove a SearchUser object from the list and store the updated list in shared preferences
Future<void> removeSearchUserFromSharedPreferences(SearchUser searchUser) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<SearchUser> searchUserList = await fetchSearchUserListFromSharedPreferences();
  searchUserList.remove(searchUser);
  List<Map<String, dynamic>> mapList = searchUserListToMapList(searchUserList);
  List<String> jsonStringList = mapListToJsonStringList(mapList);
  await prefs.setStringList('searchUserList', jsonStringList);
}
