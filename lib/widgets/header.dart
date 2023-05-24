import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  Header({required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[800],
      title: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'DevNook',
                      style: TextStyle(
                        fontFamily: 'Syn',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chevron_left),
                      SizedBox(width: 32),
                      Icon(Icons.menu),
                      SizedBox(width: 8),
                      Text('Lista de Problemas',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(width: 32),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.logout),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
