library;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'flutter_loading_overlay_platform_interface.dart';

class FlutterLoadingOverlay {
  Future<String?> getPlatformVersion() {
    return FlutterLoadingOverlayPlatform.instance.getPlatformVersion();
  }

  static final FlutterLoadingOverlay _singleton =
      FlutterLoadingOverlay._internal();

  factory FlutterLoadingOverlay() {
    return _singleton;
  }

  FlutterLoadingOverlay._internal();

  OverlayEntry? _overlayEntry;
  GlobalKey<NavigatorState>? _navigatorKey;
  Widget? _customChild;
  double _opacity = 0.5;
  Color _overlayColor = Colors.black;
  Color? _color;

  void init({
    required GlobalKey<NavigatorState> navigatorKey,
    Widget? customChild,
    double opacity = 0.5,
    Color overlayColor = Colors.black,
    Color? color,
  }) {
    _navigatorKey = navigatorKey;
    _customChild = customChild;
    _opacity = opacity;
    _overlayColor = overlayColor;
    _color = color;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Opacity(
            opacity: _opacity,
            child: ModalBarrier(
              color: _overlayColor,
              dismissible: false,
            ),
          ),
          Center(
            child: _customChild ??
                (Platform.isIOS
                    ? CupertinoActivityIndicator(
                        color: _color,
                      )
                    : CircularProgressIndicator(
                        color: _color,
                      )),
          ),
        ],
      ),
    );
  }

  void startLoading() {
    if (_overlayEntry != null) {
      return;
    }

    _overlayEntry = _createOverlayEntry();
    _navigatorKey?.currentState?.overlay?.insert(_overlayEntry!);
  }

  void stopLoading() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

get startLoading => FlutterLoadingOverlay().startLoading();
get stopLoading => FlutterLoadingOverlay().stopLoading();
