import 'package:flutter/material.dart';
import 'package:flutter_loading_overlay/flutter_loading_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    // Initialize the overlay
    FlutterLoadingOverlay().init(
      navigatorKey: navigatorKey,
      opacity: 0.8, // Custom opacity
      overlayColor: Colors.blue.withOpacity(0.5), // Custom overlay color
    );

    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loading Overlay Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Just call startLoading without parentheses
              startLoading;

              Future.delayed(const Duration(seconds: 1), () {
                // Just call stopLoading without parentheses
                stopLoading;
              });
            },
            child: const Text('Show Loading Overlay'),
          ),
        ),
      ),
    );
  }
}
