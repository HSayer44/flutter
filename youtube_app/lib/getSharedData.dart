import 'package:flutter/services.dart';

class DataClass {
  static String channel = "com.example.youtube_app";

  Future<String> sharedData() async {
    final String data = await MethodChannel(channel).invokeMethod("getData");

    return data;
  }
}