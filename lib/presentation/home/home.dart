import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quest/application/home/home.dart';

/// Displays of the users list or
/// just "home" or maybe home sweet home ig.
class HomeView extends StatelessWidget {
  /// Initializes.
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
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
