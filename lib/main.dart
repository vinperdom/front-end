import 'package:flutter/material.dart';
import 'pages/workspace.dart';
import 'globals.dart';

class Globals {
  static const Color primaryColor = Color(0xFF123456);
  static const Color secondaryColor = Color(0xFFABCDEF);
  static const Color accentColor = Color(0xFF789012);
  static const String title = 'DevNook';
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Globals.title,
      theme: ThemeData.dark(),
      home: const Workspace(),
    );
  }
}
