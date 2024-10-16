#include "include/flutter_loading_overlay/flutter_loading_overlay_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_loading_overlay_plugin.h"

void FlutterLoadingOverlayPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_loading_overlay::FlutterLoadingOverlayPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
