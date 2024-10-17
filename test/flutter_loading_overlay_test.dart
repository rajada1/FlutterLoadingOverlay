import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_loading_overlay/flutter_loading_overlay.dart';
import 'package:flutter_loading_overlay/flutter_loading_overlay_platform_interface.dart';
import 'package:flutter_loading_overlay/flutter_loading_overlay_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLoadingOverlayPlatform
    with MockPlatformInterfaceMixin
    implements FlutterLoadingOverlayPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterLoadingOverlayPlatform initialPlatform =
      FlutterLoadingOverlayPlatform.instance;

  test('$MethodChannelFlutterLoadingOverlay is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLoadingOverlay>());
  });

  test('getPlatformVersion', () async {
    FlutterLoadingOverlay flutterLoadingOverlayPlugin = FlutterLoadingOverlay();
    MockFlutterLoadingOverlayPlatform fakePlatform =
        MockFlutterLoadingOverlayPlatform();
    FlutterLoadingOverlayPlatform.instance = fakePlatform;

    expect(await flutterLoadingOverlayPlugin.getPlatformVersion(), '42');
  });
}
