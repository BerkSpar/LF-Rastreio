import 'package:fl_rastreio/app/shared/utils/lf_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'FL Rastreio',
      theme: ThemeData(
        scaffoldBackgroundColor: LfColors.grey,
        appBarTheme: AppBarTheme(
          color: LfColors.blue,
        ),
      ),
      initialRoute: '/',
      builder: asuka.builder,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
