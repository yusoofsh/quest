import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quest/application/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (_, watch, __) {
            final _title = watch(helloProvider);

            return Text(_title);
          },
        ),
      ),
      body: const Center(
        child: Text('Psst, you found this.'),
      ),
    );
  }
}
