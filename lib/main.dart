import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:to_do_list/generated/l10n.dart';
import 'package:to_do_list/ui/screens/HomePage.dart';
import 'package:to_do_list/ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(
    savedModeTheme: savedThemeMode,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, this.savedModeTheme}) : super(key: key) {}

  AdaptiveThemeMode? savedModeTheme;
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: kLightTheme,
      dark: kDarkTheme,
      initial: AdaptiveThemeMode.dark,
      builder: (light, dark) => MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: light,
        darkTheme: dark,
        home: HomePage(),
      ),
    );
  }
}
