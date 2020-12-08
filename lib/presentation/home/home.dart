import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quest/application/provider/home.dart';
import 'package:quest/domain/value/value.dart' as value;
import 'package:quest/presentation/home/widget/widget.dart';

/// {@template home_view}
/// Displays of the users list or
/// just "home" or maybe home sweet home ig.
/// {@endtemplate}
class HomeView extends StatelessWidget {
  /// {@macro home_view}
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

/// {@template app_bar}
/// Neumorphism styled appbar.
/// {@endtemplate}
class AppBar extends StatelessWidget implements PreferredSizeWidget {
  /// {@macro app_bar}
  const AppBar();

  @override
  Widget build(BuildContext context) {
    return NeumorphicAppBar(
      title: const Text(value.greetings),
      actions: [
        ThemeSwitcher(
          builder: (BuildContext context) {
            return AnimatedIconButton(
              size: 24,
              duration: const Duration(milliseconds: 500),
              onPressed: () => ThemeSwitcher.of(context).changeTheme(
                theme: ThemeProvider.of(context).brightness == Brightness.dark
                    ? value.lightThemeData
                    : value.darkThemeData,
              ),
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

/// {@template body}
/// Serve the main content .
/// {@endtemplate}
class Body extends StatelessWidget {
  /// {@macro body}
  const Body();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (_, watch, __) {
          final _people = watch(peopleProvider);

          return _people.when(
            loading: () => const LoadingWidget(),
            error: (error, _) => FailureWidget(error: error),
            data: (data) => SuccessWidget(data: data),
          );
        },
      ),
    );
  }
}
