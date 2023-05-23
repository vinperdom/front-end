import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  Header({required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF131516).withOpacity(0.3),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey[300],
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      shape: Border(
        bottom: BorderSide(
          color: Color(0xFF252729),
          width: 1.0,
        ),
      ),
    );
  }
}
