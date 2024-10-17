import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_loading_overlay_method_channel.dart';

abstract class FlutterLoadingOverlayPlatform extends PlatformInterface {
  /// Constructs a FlutterLoadingOverlayPlatform.
  FlutterLoadingOverlayPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterLoadingOverlayPlatform _instance =
      MethodChannelFlutterLoadingOverlay();

  /// The default instance of [FlutterLoadingOverlayPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterLoadingOverlay].
  static FlutterLoadingOverlayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterLoadingOverlayPlatform] when
  /// they register themselves.
  static set instance(FlutterLoadingOverlayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
