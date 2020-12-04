import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class DesktopWindow {
  static const MethodChannel _channel = const MethodChannel('desktop_window');

  static Future<Size> getWindowSize() async {
    final arr = await _channel.invokeMethod('getWindowSize');
    if (arr is List && arr.length == 2) {
      return Size(arr[0], arr[1]);
    }
    throw arr;
  }

  static Future setWindowSize(Size size) async {
    return await _channel.invokeMethod(
        'setWindowSize', {'width': size.width, 'height': size.height});
  }

  static Future getLoaclIp() async {
    return await _channel.invokeMethod('GetLocalIP');
  }

  //path  =  './xxx.exe'
  static Future open(String path) async {
    if (path == null || path.isEmpty) return;
    return await _channel.invokeMethod('open', {'path': path});
  }

  //name  =  'xxx.exe'
  static Future close(String name) async {
    if (name == null || name.isEmpty) return;
    return await _channel.invokeMethod('close', {'path': name});
  }

  static Future setMinWindowSize(Size size) async {
    return await _channel.invokeMethod(
        'setMinWindowSize', {'width': size.width, 'height': size.height});
  }

  static Future setMaxWindowSize(Size size) async {
    return await _channel.invokeMethod(
        'setMaxWindowSize', {'width': size.width, 'height': size.height});
  }

  static Future resetMaxWindowSize() async {
    return await _channel.invokeMethod('resetMaxWindowSize');
  }

  static Future toggleFullScreen() async {
    return await _channel.invokeMethod('toggleFullScreen');
  }

  static Future setFullScreen(bool fullscreen) async {
    return await _channel
        .invokeMethod('setFullScreen', {'fullscreen': fullscreen});
  }

  static Future getFullScreen() async {
    final fullscreen = await _channel.invokeMethod('getFullScreen');
    if (fullscreen is bool) return fullscreen;
    throw fullscreen;
  }
}
