#ifndef FLUTTER_PLUGIN_FLUTTER_LOADING_OVERLAY_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_LOADING_OVERLAY_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_loading_overlay {

class FlutterLoadingOverlayPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterLoadingOverlayPlugin();

  virtual ~FlutterLoadingOverlayPlugin();

  // Disallow copy and assign.
  FlutterLoadingOverlayPlugin(const FlutterLoadingOverlayPlugin&) = delete;
  FlutterLoadingOverlayPlugin& operator=(const FlutterLoadingOverlayPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_loading_overlay

#endif  // FLUTTER_PLUGIN_FLUTTER_LOADING_OVERLAY_PLUGIN_H_
