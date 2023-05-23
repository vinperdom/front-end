import 'package:flutter/material.dart';
import 'pages/workspace.dart';
import 'globals.dart';

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
