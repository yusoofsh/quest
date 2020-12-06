import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quest/domain/value/value.dart' as value;
import 'package:quest/presentation/home/home.dart';

class QuestApp extends StatelessWidget {
  const QuestApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: value.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
