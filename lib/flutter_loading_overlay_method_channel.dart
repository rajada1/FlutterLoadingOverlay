import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_loading_overlay_platform_interface.dart';

/// An implementation of [FlutterLoadingOverlayPlatform] that uses method channels.
class MethodChannelFlutterLoadingOverlay extends FlutterLoadingOverlayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_loading_overlay');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
