import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
            onTap: () => {AdaptiveTheme.of(context).toggleThemeMode()},
            child: AdaptiveTheme.of(context).theme ==
                    AdaptiveTheme.of(context).darkTheme
                ? Icon(Icons.wb_sunny_rounded)
                : Icon(Icons.nightlight_rounded),
          ),
          title: Text(S.of(context).app_title)),
    );
  }
}
