import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// We create a "provider", which will store a value (here "Xaltius Quest").
// By using a provider, this allows us to mock/override the value exposed.
final titleProvider = Provider((_) => 'Xaltius Quest');

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: QuestApp(),
    ),
  );
}

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
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: const Center(
          child: Text('Psst, you found this.'),
        ),
      ),
    );
  }
}
