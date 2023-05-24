import 'package:flutter/material.dart';
import 'pages/workspace.dart';
import 'globals.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy(); // remove default '#' from url
  runApp(MyApp());
}

class AppTheme extends InheritedWidget {
  final ThemeData data;

  AppTheme({required this.data, required Widget child}) : super(child: child);

  static AppTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()!;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}

class MyApp extends StatelessWidget {
  final double margin = 8;
  final ThemeData appTheme = ThemeData(
    primaryColor: Colors.grey,
    canvasColor: const Color(0xFF131516),
    hoverColor: const Color(0xFF343C40),
    cardColor: const Color(0xFF131516),
    textTheme: TextTheme(
      bodySmall: TextStyle(color: Colors.grey),
      bodyMedium: TextStyle(color: Colors.grey),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Globals.title,
      theme: appTheme,
      home: const Workspace(),
    );
  }
}
