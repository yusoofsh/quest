import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quest/application/home/home.dart';
import 'package:quest/domain/value/value.dart' as value;

/// Displays of the users list or
/// just "home" or maybe home sweet home ig.
class HomeView extends StatelessWidget {
  /// Initializes.
  const HomeView();

  @override
  Widget build(BuildContext context) {
    // Below code weirdly made things work.
    final brightness = ThemeProvider.of(context).brightness;
    final isLight = brightness == Brightness.light;
    // ignore: unused_local_variable
    final icon = isLight ? const Icon(value.moon) : const Icon(value.sun);

    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: NeumorphicAppBar(
          title: Consumer(
            builder: (_, watch, __) {
              final _title = watch(helloProvider);

              return Text(_title);
            },
          ),
        ),
        body: Column(
          children: [
            ThemeSwitcher(
              builder: (BuildContext context) {
                return AnimatedIconButton(
                  size: 24,
                  duration: const Duration(milliseconds: 500),
                  onPressed: () {
                    ThemeSwitcher.of(context).changeTheme(
                      theme: ThemeProvider.of(context).brightness ==
                              Brightness.dark
                          ? value.lightThemeData
                          : value.darkThemeData,
                    );
                  },
                  startIcon: const Icon(
                    value.sun,
                    color: Colors.white,
                  ),
                  endIcon: const Icon(
                    value.moon,
                    color: Colors.black,
                  ),
                );
              },
            ),
            const Spacer(),
            const Center(
              child: Text('Psst, you found this.'),
            ),
          ],
        ),
      ),
    );
  }
}
