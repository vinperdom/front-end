import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFF252729),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6.0),
          topRight: Radius.circular(6.0),
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
            'assets/a.png', // Replace with your image asset path
            width: 16.0, // Set the desired width of the image
            height: 16.0, // Set the desired height of the image
          ),
          SizedBox(width: 8.0),
          Text(
            'Python',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
