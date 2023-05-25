import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF252729),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.0),
          topRight: Radius.circular(4.0),
        ),
      ),
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 2.0,
        right: 16.0,
        bottom: 2.0,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/a.png',
            width: 16.0,
            height: 16.0,
          ),
          SizedBox(width: 8.0),
          Text(
            'Python',
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 8),
    );
  }
}
