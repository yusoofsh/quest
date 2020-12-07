import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
      child: const Scaffold(
        appBar: AppBar(),
        body: Body(),
      ),
    );
  }
}

/// Serve content.
class Body extends StatelessWidget {
  /// Initializes.
  const Body();

  @override
  Widget build(BuildContext context) {
    final _titles = [
      'bike',
      'boat',
      'bus',
      'car',
      'railway',
      'run',
      'subway',
      'transit',
      'walk'
    ];

    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        itemCount: 4,
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              title: Text(
                _titles[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Neumorphism appbar.
class AppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Initializes.
  const AppBar();

  @override
  Widget build(BuildContext context) {
    return NeumorphicAppBar(
      title: const Text(value.hello),
      actions: [
        ThemeSwitcher(
          builder: (BuildContext context) {
            return AnimatedIconButton(
              size: 24,
              duration: const Duration(milliseconds: 200),
              onPressed: () {
                ThemeSwitcher.of(context).changeTheme(
                  theme: ThemeProvider.of(context).brightness == Brightness.dark
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
      ],
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(
      NeumorphicAppBar().preferredSize.height,
    );
  }
}
