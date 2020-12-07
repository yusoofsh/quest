// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:quest/domain/value/value.dart' as value;
//
// /// Manages Home view business logic.
// class ViewModel extends ChangeNotifier {
//   final isLight = ThemeProvider.of(context).brightness;
//
//   /// Check whether the user theme is light mode.
//   bool isBrightnessLight(BuildContext context) {
//     return ThemeProvider.of(context).brightness == Brightness.light;
//   }
//
//   /// Switch application theme between dark and light.
//   void changeTheme(BuildContext context) {
//     ThemeSwitcher.of(context).changeTheme(
//       theme: ThemeProvider.of(context).brightness == Brightness.light
//           ? value.darkThemeData
//           : value.lightThemeData,
//     );
//   }
// }
