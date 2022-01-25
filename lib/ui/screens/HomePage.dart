import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/generated/l10n.dart';
import 'package:to_do_list/services/notification_manager.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key) {
    notificationManager = NotificationManager();
    notificationManager.initializeNotification();
    notificationManager.requestIOSPermissions();
  }

  late NotificationManager notificationManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => {
          notificationManager.displayNotification(title: "title", body: "body"),
          AdaptiveTheme.of(context).toggleThemeMode(),
        },
        child: AdaptiveTheme.of(context).theme ==
                AdaptiveTheme.of(context).darkTheme
            ? Icon(Icons.wb_sunny_rounded)
            : Icon(Icons.nightlight_rounded),
      ),
      title: Text(S.of(context).app_title),
    );
  }
}
