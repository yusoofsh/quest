import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:quest/domain/value/value.dart' as value;
import 'package:quest/presentation/home/home.dart';

/// This widget is the root of your application.
/// Points the "App" named "Quest".
class QuestApp extends StatelessWidget {
  /// Initializes.
  const QuestApp({Key key}) : super(key: key);

  @override
  Widget build(_) {
    return NeumorphicApp(
      title: value.appName,
      materialTheme: value.lightThemeData,
      materialDarkTheme: value.darkThemeData,
      home: const HomeView(),
    );
  }
}
