import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text('Psst, you found this.'),
      ),
    );
  }
}
