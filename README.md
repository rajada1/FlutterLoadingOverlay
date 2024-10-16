
---

# Flutter Loading Overlay

[![pub package](https://img.shields.io/pub/v/flutter_loading_overlay.svg)](https://pub.dev/packages/flutter_loading_overlay)

`FlutterLoadingOverlay` provides a simple and flexible way to manage loading overlays in your Flutter apps. No more cumbersome context passing or repetitive code! With global getters, you can now start and stop loading overlays effortlessly using just `startLoading` and `stopLoading`, with no parentheses required. Plus, you can customize the overlay's appearance with ease.

## ✨ Features

- **Global access**: Use `startLoading` and `stopLoading` globally, without needing to call them as methods.
- **No context required**: No need to pass `BuildContext`; the package handles it for you.
- **Customizable overlay**: Change the overlay opacity, color, or even pass a custom widget for full control over the appearance.
- **Gesture support**: Easily add your own `GestureDetector` or use the default spinner without hassle.
- **Minimal setup**: Start and stop the loading overlay with a single line of code.

## 💡 Installation

Add this package to your project by including the following in your `pubspec.yaml`:

```yaml
dependencies:
  flutter_loading_overlay: ^latest
```

Then, run:

```bash
flutter pub get
```

## 🎉 Getting Started

Forget about manually managing contexts or complicated loading spinners. With `FlutterLoadingOverlay`, you can just call `startLoading` and `stopLoading`—no parentheses required!

### 1. Basic Example

This is the simplest way to use `FlutterLoadingOverlay`. It automatically displays a simple, non-interactive loading spinner when triggered.

```dart
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

    // Initialize the overlay with default settings
    FlutterLoadingOverlay().init(navigatorKey: navigatorKey);

    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loading Overlay Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Call startLoading without parentheses
              startLoading;
              
              Future.delayed(const Duration(seconds: 2), () {
                // Call stopLoading without parentheses
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
```

### 2. Custom Opacity and Overlay Color

You can customize the **opacity** and **color** of the overlay background to fit your app’s theme. Here’s how to do that:

```dart
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

    // Initialize with custom opacity and color
    FlutterLoadingOverlay().init(
      navigatorKey: navigatorKey,
      opacity: 0.8, // Custom opacity
      overlayColor: Colors.blue.withOpacity(0.5), // Custom overlay color
    );

    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Loading Overlay Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Call startLoading without parentheses
              startLoading;
              
              Future.delayed(const Duration(seconds: 2), () {
                // Call stopLoading without parentheses
                stopLoading;
              });
            },
            child: const Text('Show Custom Loading Overlay'),
          ),
        ),
      ),
    );
  }
}
```

### 3. Advanced Example (With GestureDetector)

For more advanced use cases, `FlutterLoadingOverlay` allows you to pass a custom widget like a `GestureDetector` and handle various gestures such as tap, double-tap, or long-press.

```dart
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

    // Initialize with a custom GestureDetector widget
    FlutterLoadingOverlay().init(
      navigatorKey: navigatorKey,
      customChild: GestureDetector(
        onTap: () => print('Overlay tapped!'),
        onDoubleTap: () => print('Overlay double-tapped!'),
        onLongPress: () => print('Overlay long-pressed!'),
        child: const CircularProgressIndicator(),
      ),
    );

    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loading Overlay with Gesture Detector'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              startLoading; // Start overlay
              Future.delayed(const Duration(seconds: 2), () {
                stopLoading; // Stop overlay
              });
            },
            child: const Text('Show Loading Overlay'),
          ),
        ),
      ),
    );
  }
}
```

## 📚 API Reference

### `init`

```dart
void init({
  required GlobalKey<NavigatorState> navigatorKey,
  Widget? customChild,
  double opacity = 0.5,
  Color overlayColor = Colors.black,
})
```

- **`navigatorKey`** (required): The `GlobalKey` used to manage the navigation stack and overlay insertion.
- **`customChild`** (optional): A widget to replace the default loading spinner. Pass any widget, including interactive ones like `GestureDetector`.
- **`opacity`** (optional): Customize the background opacity (default is `0.5`).
- **`overlayColor`** (optional): Customize the background overlay color (default is `Colors.black`).

### Global Getters

- **`startLoading`**: Displays the loading overlay on top of the current screen.
- **`stopLoading`**: Removes the loading overlay from the screen.

## 🚀 How it Works

1. **No parentheses needed**: Thanks to Dart's `get`, you can now call `startLoading` and `stopLoading` without parentheses!
2. **No context headaches**: You don’t need to pass `BuildContext`; just use the `navigatorKey`, and the package will take care of the rest.
3. **Customizable design**: Modify the background opacity, overlay color, or pass any custom widget (including interactive widgets like `GestureDetector`).

## 🎯 Use Cases

- **Networking and API calls**: Display a loading spinner while data is being fetched.
- **Form submissions**: Show the overlay when a form is submitted until processing is complete.
- **Interactive loading overlays**: Add gestures like tap, double-tap, or long-press to allow users to interact with the overlay.

## 🤩 Why Choose FlutterLoadingOverlay?

- **No parentheses**: Use `startLoading` and `stopLoading` globally without parentheses, making your code cleaner.
- **Fully customizable or keep it simple**: Whether you need a basic loading spinner or a fully interactive overlay, this package adapts to your needs.
- **Seamless integration**: Works right out of the box with `MaterialApp`, with full support for custom widgets and gesture interactions.

## 👥 Contributing

Contributions are always welcome! If you have suggestions, bug fixes, or feature requests, feel free to open an issue or submit a pull request.

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/new-feature`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature/new-feature`).
5. Open a pull request.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

Developed by [M.Bilal MurtaZa](https://github.com/MBilalMurtaZa)

---

*With `FlutterLoadingOverlay`, you can forget about managing context or handling complex custom loading designs. Simply call `startLoading` and `stopLoading`, with no parentheses—just clean, efficient code.* 🚀

---

