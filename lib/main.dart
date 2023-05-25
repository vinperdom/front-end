import 'package:flutter/material.dart';
import 'pages/workspace.dart';
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

final defaultTextStyle = TextStyle(
  color: Colors.grey[300],
  fontFamily: 'FiraCode',
  fontWeight: FontWeight.bold,
);

final defaultHeaderTextStyle = defaultTextStyle.copyWith(
  color: Colors.grey[700],
  fontFamily: 'FiraCodeBold',
);

class MyApp extends StatelessWidget {
  final ThemeData appTheme = ThemeData(
    primaryColor: Colors.grey,
    canvasColor: const Color(0xFF131516),
    hoverColor: const Color(0xFF343C40),
    cardColor: const Color(0xFF131516),
    textTheme: TextTheme(
      displayLarge: defaultHeaderTextStyle,
      displayMedium: defaultHeaderTextStyle,
      displaySmall: defaultHeaderTextStyle,
      headlineLarge: defaultTextStyle,
      headlineMedium: defaultTextStyle,
      headlineSmall: defaultTextStyle,
      titleLarge: defaultHeaderTextStyle,
      titleMedium: defaultHeaderTextStyle,
      titleSmall: defaultHeaderTextStyle,
      bodyLarge: defaultTextStyle,
      bodyMedium: defaultTextStyle,
      bodySmall: defaultTextStyle,
      labelLarge: defaultTextStyle,
      labelMedium: defaultTextStyle,
      labelSmall: defaultTextStyle,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevNook',
      theme: appTheme,
      home: const Workspace(),
    );
  }
}
