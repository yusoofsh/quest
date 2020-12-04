import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quest/application/home/home.dart';
import 'package:quest/presentation/home/home.dart';

class QuestApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(
    BuildContext context,
    ScopedReader watch,
  ) {
    /// A value called "_title".
    ///
    /// Also listen for an updates from the provider itself.
    final _title = watch(titleProvider);

    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(title: _title),
    );
  }
}
