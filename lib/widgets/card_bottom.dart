import 'package:flutter/material.dart';

class CardBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF252729),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(4.0),
          bottomRight: Radius.circular(4.0),
        ),
      ),
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 8.0,
        right: 16.0,
        bottom: 8.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  'Console',
                ),
                SizedBox(width: 8.0),
                Icon(Icons.keyboard_arrow_up_rounded, color: Colors.grey[300])
              ],
            ),
          ),
          SizedBox(
            width: 90, // Fixed width for the button
            height: 50 - 16, // Fixed width for the button
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Testar'),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 8),
    );
  }
}
