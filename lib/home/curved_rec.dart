import 'package:flutter/material.dart';

class buildCurvedRectangularBox extends StatelessWidget {
  final icon;
  String text;
  Color color;

  buildCurvedRectangularBox({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width/2)-20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: color, width: 1)
      ),
      padding: EdgeInsets.only(top: 13.0,bottom: 13,left: 20),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: color,
          ),
          SizedBox(width: 8.0),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}